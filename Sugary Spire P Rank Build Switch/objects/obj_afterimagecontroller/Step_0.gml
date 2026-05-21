for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i);
    
    with (b)
    {
        for (var l = 0; l < array_length(alarm); l++)
        {
            if (alarm[l] >= 0 && !global.freezeframe)
                alarm[l]--;
        }
        
        if (blink)
            visible = global.BlinkTrail;
        
        if (instance_exists(identity) && identity.object_index == obj_player && !global.freezeframe)
        {
            switch (identity.state)
            {
                case states.ufofloat:
                case states.ufodash:
                    var _mvspd = (identity.verticalMovespeed > identity.movespeed) ? identity.verticalMovespeed : identity.movespeed;
                    image_alpha = abs(identity.movespeed) / 12;
                    break;
                
                default:
                    image_alpha = identity.movespeed / 12;
                    break;
            }
        }
        
        if (instance_exists(identity) && identity.object_index == obj_player && identity.state != states.mach3 && identity.state != states.Nhookshot && identity.state != states.ufodash && identity.state != states.ufofloat && identity.state != states.charge && identity.state != states.mach2 && identity.state != states.handstandjump && identity.state != states.machslide && identity.state != states.slam && identity.state != 28 && identity.state != states.machfreefall && identity.state != states.superslam && identity.state != states.minecart && !(identity.state == states.machroll && identity.sprite_index != identity.spr_crouchslip && identity.movespeed >= 12) && identity.state != states.chainsaw && identity.state != states.Sjump && identity.state != states.parry && identity.state != states.tumble && identity.state != 125 && identity.state != states.jump && identity.state != states.uppercut && identity.state != states.machtumble && global.cane == 0 && identity.state != states.pizzanosidejump && identity.state != states.pizzanoshoulderbash && identity.state != states.mach1 && identity.state != states.pizzanokungfu && identity.state != states.rupertjump && identity.state != states.tumble)
            vanish = true;
        
        if (vanish)
            gonealpha = approach(gonealpha, 0, 0.15);
        
        x += hsp;
        y += vsp;
        
        if (alarm[0] == 0 || !instance_exists(identity))
            vanish = true;
        
        if (alarm[1] == 0 || gonealpha == 0)
        {
            b = undefined;
            ds_list_delete(global.afterimage_list, i);
            i--;
        }
    }
}

if (!global.freezeframe)
{
    if (blinkingBuffer > 0)
        blinkingBuffer--;
    else
    {
        event_user(0);
        blinkingBuffer = 3;
    }
}
