if (tableState == UnknownEnum.Value_0)
{
    var finished_dealing_hole_cards = true;
    
    for (var i = 0; i < 5; i++)
    {
        if (players[i].state != UnknownEnum.Value_9 && array_length(players[i].hand) < 2)
        {
            finished_dealing_hole_cards = false;
            break;
        }
    }
    
    if (!finished_dealing_hole_cards)
    {
        var last_card_count = 0;
        var player_to_deal = 0;
        
        for (var i = 0; i < 5; i++)
        {
            var player = players[i];
            
            if (player.state != UnknownEnum.Value_9)
            {
                if (array_length(player.hand) == 0)
                {
                    player_to_deal = i;
                    break;
                }
                else if (array_length(player.hand) < last_card_count)
                {
                    player_to_deal = i;
                    break;
                }
                else
                {
                    last_card_count = array_length(player.hand);
                }
            }
        }
        
        players[player_to_deal].hand[array_length(players[player_to_deal].hand)] = ds_list_find_value(deck, 0);
        ds_list_delete(deck, 0);
        alarm[0] = 45;
    }
    else
    {
        alarm[1] = 20;
    }
}
else if (tableState == UnknownEnum.Value_1)
{
    communityCards[array_length(communityCards)] = ds_list_find_value(deck, 0);
    ds_list_delete(deck, 0);
    
    if (array_length(communityCards) < 3)
        alarm[0] = 45;
    else
        alarm[1] = 20;
}
else if (tableState == UnknownEnum.Value_2)
{
    communityCards[array_length(communityCards)] = ds_list_find_value(deck, 0);
    ds_list_delete(deck, 0);
    alarm[1] = 20;
}
else if (tableState == UnknownEnum.Value_3)
{
    communityCards[array_length(communityCards)] = ds_list_find_value(deck, 0);
    ds_list_delete(deck, 0);
    alarm[1] = 20;
}
