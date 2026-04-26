var hands = [["2H", "2C"], ["AS", "JC"], ["6H", "6D"], ["6C", "9H"], ["2D", "3C"]];
var hex_digits = "0123456789ABCDEF";
var hand_names = ["HIGH_CARD", "PAIR", "TWO_PAIR", "THREE_OF_A_KIND", "STRAIGHT", "FLUSH", "FULL_HOUSE", "FOUR_OF_A_KIND", "STRAIGHT_FLUSH"];
communityCards = ["2S", "3D", "4D", "5D", "7D"];

for (var i = 0; i < 5; i++)
{
    with (players[i])
    {
        state = UnknownEnum.Value_0;
        hand = hands[i];
    }
}

show_debug_message("Attempting to rank hands.");
var player_ranks = scr_poker_rankHands();
show_debug_message("Finished attempt to rank hands.");

for (var i = 0; i < 5; i++)
{
    var rank_string = players[i].name + ": ";
    
    if (player_ranks[i] <= 0)
    {
        rank_string += string(player_ranks[i]);
    }
    else
    {
        var digit_string = "";
        
        for (var j = 0; j < 5; j++)
        {
            digit_string = string_char_at(hex_digits, (player_ranks[i] & 15) + 1) + digit_string;
            player_ranks[i] = player_ranks[i] >> 4;
        }
        
        rank_string += hand_names[player_ranks[i] & 15];
        rank_string += ", 0x";
        rank_string += digit_string;
    }
    
    show_debug_message(rank_string);
}
