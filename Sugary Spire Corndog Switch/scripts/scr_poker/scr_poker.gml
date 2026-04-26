function scr_poker_startHand()
{
    for (var i = 0; i < 5; i++)
    {
        var player = players[i];
        player.state = UnknownEnum.Value_0;
        player.betSize = 0;
        player.hand = [];
    }
    
    tableState = UnknownEnum.Value_0;
    commmunityCards = [];
    scr_poker_getBlinds();
    tableBet = bigBlind;
    var small_blinds_player = scr_poker_getPlayerToLeft(dealer);
    var big_blinds_player = scr_poker_getPlayerToLeft(small_blinds_player);
    players[small_blinds_player].state = UnknownEnum.Value_8;
    players[small_blinds_player].betSize = min(bigBlind / 2, players[small_blinds_player].stack);
    players[small_blinds_player].stack -= players[small_blinds_player].betSize;
    potSize += players[small_blinds_player].betSize;
    players[big_blinds_player].state = UnknownEnum.Value_7;
    players[big_blinds_player].betSize = min(bigBlind, players[big_blinds_player].stack);
    players[big_blinds_player].stack -= players[big_blinds_player].betSize;
    potSize += players[big_blinds_player].betSize;
    minRaiseAmount = bigBlind;
    scr_poker_shuffleNewDeck();
    alarm[0] = 40;
    currentTurn = scr_poker_getPlayerToLeft(big_blinds_player);
    canCheck = false;
    callAmount = bigBlind;
    minRaise = bigBlind;
}

function scr_poker_checkIfHandProgresses()
{
    var num_players_in_hand = 0;
    
    for (var i = 0; i < 5; i++)
    {
        var player = players[i];
        var state = player.state;
        
        if (state != UnknownEnum.Value_6 && state != UnknownEnum.Value_9)
            num_players_in_hand++;
    }
    
    if (num_players_in_hand <= 1)
    {
        scr_poker_endHand();
        exit;
    }
    
    var advance_to_next_phase = true;
    
    if (players[currentTurn].state == UnknownEnum.Value_3 || players[currentTurn].state == UnknownEnum.Value_4 || players[currentTurn].state == UnknownEnum.Value_5)
    {
        advance_to_next_phase = false;
    }
    else
    {
        for (var i = 0; i < 5; i++)
        {
            var player = players[i];
            var state = player.state;
            
            if (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_7 || state == UnknownEnum.Value_8)
            {
                advance_to_next_phase = false;
                break;
            }
        }
        
        var largest_bet = 0;
        
        for (var i = 0; i < 5; i++)
        {
            var player = players[i];
            var state = player.state;
            
            if (state != UnknownEnum.Value_6 && state != UnknownEnum.Value_9)
                largest_bet = max(largest_stake, player.betSize);
        }
        
        for (var i = 0; i < 5; i++)
        {
            var player = players[i];
            var state = player.state;
            
            if (state != UnknownEnum.Value_6 && state != UnknownEnum.Value_9)
            {
                if (state != UnknownEnum.Value_5 && player.betSize < largest_bet)
                    advance_to_next_phase = false;
            }
        }
    }
    
    if (advance_to_next_phase)
        scr_poker_progressHand();
}

function scr_poker_progressHand()
{
    for (var i = 0; i < 5; i++)
    {
        var player = players[i];
        player.state = UnknownEnum.Value_0;
        player.betSize = 0;
    }
    
    minRaise = bigBlind;
    
    if (tableState < UnknownEnum.Value_3)
        tableState++;
    else
        scr_poker_decideShowdown();
    
    if (tableState == UnknownEnum.Value_1)
    {
        ds_list_delete(deck, 0);
        alarm[0] = 45;
    }
    else if (tableState == UnknownEnum.Value_2 || tableState == UnknownEnum.Value_3)
    {
        ds_list_delete(deck, 0);
        alarm[0] = 45;
    }
}

function scr_poker_endHand()
{
    dealer = (dealer + 1) % 5;
    handsCompleted++;
}

function scr_poker_getPlayerToLeft(arg0)
{
    return (arg0 == 4) ? 0 : (arg0 + 1);
}

function scr_poker_getBlinds()
{
    bigBlind = 200 * min(1 + floor(handsCompleted / 5), 5);
}

function scr_poker_decideShowdown()
{
    var players_ranked = scr_poker_rankHands();
}

function scr_poker_rankHands()
{
    var player_ranks = [];
    var suits = "SCDH";
    var values = "A23456789TJQK";
    
    for (var i = 0; i < 5; i++)
    {
        if (players[i].state != UnknownEnum.Value_6 && players[i].state != UnknownEnum.Value_9)
        {
            var has_straight = false;
            var has_flush = false;
            var suit_counts = array_create(4, 0);
            var val_counts = array_create(13, 0);
            var available_cards = array_concat(players[i].hand, communityCards);
            var card_used = array_create(7, 0);
            
            for (var j = 0; j < 7; j++)
            {
                var val_index = string_pos(string_char_at(available_cards[j], 1), values) - 1;
                var suit_index = string_pos(string_char_at(available_cards[j], 2), suits) - 1;
                val_counts[val_index]++;
                suit_counts[suit_index]++;
            }
            
            for (var j = 0; j < 4; j++)
            {
                if (suit_counts[j] >= 5)
                    has_flush = true;
            }
            
            var straight_counter = 0;
            
            for (var j = 0; j < 14; j++)
            {
                if (val_counts[j % 13] > 0)
                    straight_counter++;
                else
                    straight_counter = 0;
                
                if (straight_counter >= 5)
                {
                    has_straight = true;
                    break;
                }
            }
            
            var sf_found = false;
            
            if (has_straight && has_flush)
            {
                for (var j = 13; j >= 4; j--)
                {
                    var straight_starts_here = true;
                    
                    for (var k = 4; k >= 0; k--)
                    {
                        if (val_counts[(j - k) % 13] <= 0)
                        {
                            straight_starts_here = false;
                            break;
                        }
                    }
                    
                    if (straight_starts_here)
                    {
                        var suit_val_matrix = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]];
                        
                        for (var k = 0; k < 5; k++)
                        {
                            for (var l = 0; l < 7; l++)
                            {
                                var val_index = string_pos(string_char_at(available_cards[l], 1), values) - 1;
                                
                                if (((j - k) % 13) == val_index)
                                {
                                    var suit_index = string_pos(string_char_at(available_cards[l], 2), suits) - 1;
                                    suit_val_matrix[suit_index][k]++;
                                }
                            }
                        }
                        
                        for (var k = 0; k < 4; k++)
                        {
                            var sf_this_row = true;
                            
                            for (var l = 0; l < 5; l++)
                            {
                                if (suit_val_matrix[k][l] < 1)
                                {
                                    sf_this_row = false;
                                    break;
                                }
                            }
                            
                            if (sf_this_row)
                            {
                                sf_found = true;
                                var sf_rank = UnknownEnum.Value_128;
                                sf_rank = (sf_rank + j) << 4;
                                sf_rank = ((sf_rank + j) - 1) << 4;
                                sf_rank = ((sf_rank + j) - 2) << 4;
                                sf_rank = ((sf_rank + j) - 3) << 4;
                                sf_rank += (j - 4);
                                player_ranks[i] = sf_rank;
                                break;
                            }
                        }
                    }
                    
                    if (sf_found)
                        break;
                }
            }
            
            if (sf_found)
            {
                show_debug_message(string("{0} had a Straight Flush.", players[i].name));
                continue;
            }
            
            var quads_found = false;
            
            for (var j = 13; j >= 1; j--)
            {
                if (val_counts[j % 13] >= 4)
                {
                    quads_found = true;
                    var quad_rank = UnknownEnum.Value_112;
                    quad_rank = (quad_rank + j) << 4;
                    quad_rank = (quad_rank + j) << 4;
                    quad_rank = (quad_rank + j) << 4;
                    quad_rank = (quad_rank + j) << 4;
                    val_counts[j % 13] -= 4;
                    
                    for (var k = 13; k >= 1; k--)
                    {
                        if (val_counts[k % 13] > 0)
                        {
                            quad_rank += k;
                            break;
                        }
                    }
                    
                    player_ranks[i] = quad_rank;
                    break;
                }
            }
            
            if (quads_found)
            {
                show_debug_message(string("{0} had 4 of a kind.", players[i].name));
                continue;
            }
            
            var fh_found = false;
            var trip_val = -1;
            var pair_val = -1;
            var pair_val_low = -1;
            
            for (var j = 13; j >= 1; j--)
            {
                if (trip_val == -1 && val_counts[j % 13] >= 3)
                    trip_val = j;
                else if (pair_val == -1 && val_counts[j % 13] >= 2)
                    pair_val = j;
                else if (pair_val_low == -1 && val_counts[j % 13] >= 2)
                    pair_val_low = j;
                
                if (trip_val != -1 && pair_val != -1)
                {
                    fh_found = true;
                    var fh_rank = UnknownEnum.Value_96;
                    fh_rank = (fh_rank + trip_val) << 4;
                    fh_rank = (fh_rank + trip_val) << 4;
                    fh_rank = (fh_rank + trip_val) << 4;
                    fh_rank = (fh_rank + pair_val) << 4;
                    fh_rank += pair_val;
                    player_ranks[i] = fh_rank;
                    break;
                }
            }
            
            if (fh_found)
            {
                show_debug_message(string("{0} had a full house.", players[i].name));
                continue;
            }
            
            if (has_flush)
            {
                var flush_rank = UnknownEnum.Value_80;
                var flush_suit = -1;
                
                for (var j = 0; j < 4; j++)
                {
                    if (suit_counts[j] >= 5)
                    {
                        flush_suit = j;
                        break;
                    }
                }
                
                cards_left_to_add = 5;
                
                for (var j = 13; j >= 1; j--)
                {
                    if (val_counts[j % 13] > 0 && cards_left_to_add > 0)
                    {
                        for (var k = 0; k < 7; k++)
                        {
                            var val_index = string_pos(string_char_at(available_cards[k], 1), values) - 1;
                            var suit_index = string_pos(string_char_at(available_cards[k], 2), suits) - 1;
                            
                            if (suit_index == flush_suit && val_index == (j % 13))
                            {
                                cards_left_to_add--;
                                flush_rank += j;
                                
                                if (cards_left_to_add > 0)
                                    flush_rank = flush_rank << 4;
                                
                                break;
                            }
                        }
                    }
                }
                
                player_ranks[i] = flush_rank;
                show_debug_message(string("{0} had a flush.", players[i].name));
                continue;
            }
            
            if (has_straight)
            {
                var straight_rank = UnknownEnum.Value_64;
                straight_counter = 0;
                var straight_start = -1;
                
                for (var j = 13; j >= 0; j--)
                {
                    if (val_counts[j % 13] > 0)
                    {
                        straight_counter++;
                        
                        if (straight_counter == 5)
                        {
                            straight_start = j + 4;
                            break;
                        }
                    }
                    else
                    {
                        straight_counter = 0;
                    }
                }
                
                straight_rank = (straight_rank + straight_start) << 4;
                straight_rank = ((straight_rank + straight_start) - 1) << 4;
                straight_rank = ((straight_rank + straight_start) - 2) << 4;
                straight_rank = ((straight_rank + straight_start) - 3) << 4;
                straight_rank += (straight_start - 4);
                player_ranks[i] = straight_rank;
                show_debug_message(string("{0} had a straight.", players[i].name));
                continue;
            }
            
            if (trip_val != -1)
            {
                val_counts[trip_val % 13] -= 3;
                var trip_rank = UnknownEnum.Value_48;
                trip_rank = (trip_rank + trip_val) << 4;
                trip_rank = (trip_rank + trip_val) << 4;
                trip_rank = (trip_rank + trip_val) << 4;
                cards_left_to_add = 2;
                
                for (var j = 13; j >= 1; j--)
                {
                    if (val_counts[j % 13] > 0 && cards_left_to_add > 0)
                    {
                        trip_rank += j;
                        show_debug_message("Adding");
                        cards_left_to_add--;
                        
                        if (cards_left_to_add > 0)
                            trip_rank = trip_rank << 4;
                    }
                }
                
                player_ranks[i] = trip_rank;
                show_debug_message(string("{0} had three of a kind.", players[i].name));
                continue;
            }
            
            if (pair_val != -1)
            {
                val_counts[pair_val] -= 2;
                
                if (pair_val_low == -1)
                {
                    var pair_rank = UnknownEnum.Value_16;
                    pair_rank = (pair_rank + pair_val) << 4;
                    pair_rank = (pair_rank + pair_val) << 4;
                    cards_left_to_add = 3;
                    
                    for (var j = 13; j >= 1; j--)
                    {
                        if (val_counts[j % 13] > 0 && cards_left_to_add > 0)
                        {
                            pair_rank += j;
                            cards_left_to_add--;
                            
                            if (cards_left_to_add > 0)
                                pair_rank = pair_rank << 4;
                        }
                    }
                    
                    player_ranks[i] = pair_rank;
                    show_debug_message(string("{0} had a Pair.", players[i].name));
                    continue;
                }
                else
                {
                    var two_pair_rank = UnknownEnum.Value_32;
                    two_pair_rank = (two_pair_rank + pair_val) << 4;
                    two_pair_rank = (two_pair_rank + pair_val) << 4;
                    two_pair_rank = (two_pair_rank + pair_val_low) << 4;
                    two_pair_rank = (two_pair_rank + pair_val_low) << 4;
                    val_counts[pair_val_low] -= 2;
                    
                    for (var j = 13; j >= 1; j--)
                    {
                        if (val_counts[j % 13] > 0)
                        {
                            two_pair_rank += j;
                            break;
                        }
                    }
                    
                    player_ranks[i] = two_pair_rank;
                    show_debug_message(string("{0} had Two Pair.", players[i].name));
                    continue;
                }
            }
            
            var cards_left_to_add = 5;
            var hc_rank = UnknownEnum.Value_0;
            
            for (var j = 13; j >= 1; j--)
            {
                while (val_counts[j % 13] > 1 && cards_left_to_add > 0)
                {
                    cards_left_to_add--;
                    val_counts[j % 13]--;
                    hc_rank += j;
                    
                    if (cards_left_to_add > 0)
                        hc_rank = hc_rank << 4;
                }
            }
            
            player_ranks[i] = hc_rank;
            show_debug_message(string("{0} had High Card.", players[i].name));
        }
        else
        {
            show_debug_message(string("{0} was not part of the hand.", players[i].name));
            player_ranks[i] = -1;
        }
    }
    
    return player_ranks;
}

function scr_poker_shuffleNewDeck()
{
    if (deck != -4)
        ds_list_destroy(deck);
    
    deck = ds_list_create();
    var suits = "SCDH";
    var values = "23456789TJQKA";
    
    for (var i = 0; i < 52; i++)
        ds_list_add(deck, string_char_at(values, (i % 13) + 1) + string_char_at(suits, floor(i / 13) + 1));
    
    for (var i = 0; i < ds_list_size(deck); i++)
        show_debug_message(ds_list_find_value(deck, i));
    
    ds_list_shuffle(deck);
}
