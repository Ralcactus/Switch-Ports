if deactivated = 0
{
    if (gamepad_discovered && (!device_selected[0]))
    {
        //if (room == /*global.roomstart[global.newtitlescreen]*/ devroom)
        {
            if (instance_exists(obj_pause) && global.gamePauseState == 0)
            {
                for (var i = 0; i < 8; i++)
                {
                    var _index = scr_button_pressed(i)
                    if (_index != -2)
                    {
                        device_selected[0] = 1
                        global.player_input_device = _index
						confirmspr = 2
                    }
                }
            }
        }
    }
    /*if (room == characterselect && (!device_selected[1]))
    {
        for (i = 0; i < 8; i++)
        {
            _index = scr_button_pressed(i)
            if (_index != -2)
            {
                if ((!self.CheckUsedIndex(_index)) || (_index == -1 && player_input_device[0] == -1 && (keyboard_check_pressed(global.key_jumpN) || keyboard_check_pressed(global.key_startN))))
                {
                    var _y = 0
                    while (_y < 2)
                    {
                        if (player_input_device[_y] == -2)
                        {
                            player_input_device[_y] = _index
                            device_selected[_y] = 1
                            if (_y == 1)
                            {
                                if instance_exists(obj_player2)
                                    obj_player2.key_jump2 = 1
                            }
                            break
                        }
                        else
                        {
                            _y++
                            continue
                        }
                    }
                }
            }
        }
    }*/
    i = 0
    while (i < 2)
    {
        if (device_selected[i] && global.player_input_device >= 0)
        {
            if (!gamepad_is_connected(global.player_input_device))
            {
                deactivated = 1
                device_selected[i] = 0
                global.player_input_device = -2
                device_to_reconnect = i
                instance_deactivate_all(true);
				//instance_activate_object(obj_pause);
				//instance_activate_object(obj_rpc);
				//instance_activate_object(rousrDissonance);
                break;
            }
            else
            {
                i++
                continue
            }
        }
        else
        {
            i++
            continue
        }
    }
}
else
{
    for (i = 0; i < 8; i++)
    {
        _index = scr_button_pressed(i)
        if (_index != -2)
        {
            if ((!self.CheckUsedIndex(_index)) || (device_to_reconnect == 1 && _index == -1 && (keyboard_check_pressed(global.key_jumpN) || keyboard_check_pressed(global.key_startN))))
            {
                device_selected[device_to_reconnect] = 1
                global.player_input_device = _index
                deactivated = 0
                instance_activate_all()
                //scr_deactivate_escape()
                alarm[0] = 1
            }
            /*else if (device_to_reconnect == 1 && global.coop)
            {
                global.coop = 0
                instance_destroy(obj_coopplayerfollow)
                device_selected[device_to_reconnect] = 0
                player_input_device[device_to_reconnect] = -2
                deactivated = 0
                instance_activate_all()
                scr_deactivate_escape()
                alarm[0] = 1
            }*/
        }
    }
}
gamepad_set_vibration(global.player_input_device, vibration1, vibration1)
vibration1 -= vibrationDecay1
//card lol
carddex += .3
if confirmspr = 2 && cardspr != spr_rankcardflipping
{
	carddex = 0
	cardspr = spr_rankcardflipping
}
	if cardspr = spr_rankcardflipping && carddex >= 6 cardspr = spr_rankcardflipped
	if cardspr = spr_rankcardflipped && carddex >= 2 {confirmspr = -2 gamepad_discovered = 0}

