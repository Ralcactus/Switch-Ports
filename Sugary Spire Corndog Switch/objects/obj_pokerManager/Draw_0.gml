var num_players_remaining = 0;

for (var i = 0; i < 5; i++)
{
    if (players[i].state != UnknownEnum.Value_9)
        num_players_remaining++;
}

draw_set_font(font_dev);
draw_set_valign(fa_top);

for (var i = 0; i < 5; i++)
{
    var player = players[i];
    var state = player.state;
    var ui_x = (room_width / num_players_remaining) * i;
    draw_set_color(c_aqua);
    draw_rectangle(ui_x + 6, 6, (ui_x + (room_width / num_players_remaining)) - 6, 135, false);
    
    if (state == UnknownEnum.Value_6)
        draw_set_color(c_gray);
    else
        draw_set_color(c_black);
    
    draw_set_halign(fa_left);
    draw_text(ui_x + 10, 5, players[i].name);
    draw_text(ui_x + 10, 25, "$" + string(players[i].stack));
    var state_text = "";
    
    switch (state)
    {
        case UnknownEnum.Value_8:
            state_text = string("Small Blind ${0}", player.betSize);
            break;
        
        case UnknownEnum.Value_7:
            state_text = string("Big Blind ${0}", player.betSize);
            break;
        
        case UnknownEnum.Value_1:
            state_text = string("Called ${0}", player.betSize);
            break;
        
        case UnknownEnum.Value_2:
            state_text = "Checked";
            break;
        
        case UnknownEnum.Value_3:
            state_text = string("Raised to ${0}", player.betSize);
            break;
        
        case UnknownEnum.Value_4:
            state_text = string("Bet ${0}", player.betSize);
            break;
        
        case UnknownEnum.Value_5:
            state_text = string("All In ${0}", player.betSize);
            break;
    }
    
    if (string_length(state_text) >= 1)
        draw_text(ui_x + 10, 45, state_text);
    
    draw_set_halign(fa_center);
    
    if (array_length(player.hand) >= 1)
    {
        draw_set_color(c_white);
        draw_rectangle(ui_x + 9, 94, (ui_x + (room_width / num_players_remaining / 2)) - 5, 132, false);
        
        if (i == UnknownEnum.Value_0)
        {
            draw_set_color(c_black);
            draw_text((ui_x + (room_width / num_players_remaining / 2)) - 46, 105, player.hand[0]);
        }
        else
        {
            draw_set_color(c_maroon);
            draw_rectangle(ui_x + 11, 96, (ui_x + (room_width / num_players_remaining / 2)) - 7, 130, false);
        }
    }
    
    if (array_length(player.hand) >= 2)
    {
        draw_set_color(c_white);
        draw_rectangle(ui_x + (room_width / num_players_remaining / 2) + 5, 94, (ui_x + (room_width / num_players_remaining)) - 9, 132, false);
        
        if (i == UnknownEnum.Value_0)
        {
            draw_set_color(c_black);
            draw_text(ui_x + (room_width / num_players_remaining / 2) + 46, 105, player.hand[1]);
        }
        else
        {
            draw_set_color(c_maroon);
            draw_rectangle(ui_x + (room_width / num_players_remaining / 2) + 7, 96, (ui_x + (room_width / num_players_remaining)) - 11, 130, false);
        }
    }
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(room_width / 2, 400, string("Pot: ${0}", potSize));
var ui_width = 463;
var ui_y = 432;

for (var i = 0; i < array_length(communityCards); i++)
{
    var ui_x = ((room_width - ui_width) / 2) + (95 * i);
    draw_set_color(c_white);
    draw_rectangle(ui_x, ui_y, ui_x + 82, ui_y + 38, false);
    draw_set_color(c_black);
    draw_text(ui_x + 41, ui_y + 19, communityCards[i]);
}
