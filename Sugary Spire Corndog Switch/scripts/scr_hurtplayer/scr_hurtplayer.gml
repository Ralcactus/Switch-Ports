function scr_hurtplayer(arg0 = obj_parent_player, arg1)
{
    if (!global.freezeframe && arg0.state != UnknownEnum.Value_110 && arg0.state != UnknownEnum.Value_92 && arg0.state != UnknownEnum.Value_68)
    {
        with (arg0)
        {
            if (cutscene)
                continue;
            
            if ((state == UnknownEnum.Value_17 || state == UnknownEnum.Value_18 || state == UnknownEnum.Value_13) && !cutscene)
                continue;
            
            if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
                continue;
            
            if (state == UnknownEnum.Value_100)
            {
                sprite_index = spr_player_PZ_hitWall_mach3;
                state = UnknownEnum.Value_67;
                hsp = 2.5 * xscale;
                vsp = -3;
                machTwo = 0;
                image_index = 0;
                instance_create(x, y, obj_bombExplosionHarmless);
                
                for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
                {
                    with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_minecartdebris))
                        image_index = i;
                }
            }
            else if (state == UnknownEnum.Value_20 && !hurted)
            {
            }
            else if (state == UnknownEnum.Value_9 || state == UnknownEnum.Value_87 || state == UnknownEnum.Value_96 || state == UnknownEnum.Value_97)
            {
            }
            else if (state == UnknownEnum.Value_139 || (state == UnknownEnum.Value_105 && flash))
            {
            }
            else if (state != UnknownEnum.Value_68 && state != UnknownEnum.Value_42 && !hurted && !cutscene && state != UnknownEnum.Value_67 && state != UnknownEnum.Value_95)
            {
                if (state == UnknownEnum.Value_78 || state == UnknownEnum.Value_79)
                {
                    with (instance_create(x, y, obj_dogMount))
                    {
                        image_xscale = other.xscale;
                        sprite_index = spr_dogMount_kick;
                        vsp = -16;
                        hsp = -image_xscale * 16;
                    }
                }
                
                event_play_oneshot("event:/SFX/player/hurt", x, y);
                global.hurtcounter += 1;
                instance_create(x, y, obj_bumpEffect);
                state = UnknownEnum.Value_68;
                alarm[8] = 60;
                alarm[7] = 120;
                hurted = true;
                
                if (chance(33))
                    fmod_event_play(obj_parent_player.voiceHurt);
                
                sprite_index = (sign(image_xscale) == other.image_xscale) ? spr_hurtjump : spr_hurt;
                movespeed = !is_undefined(arg1) ? arg1 : 8;
                timeuntilhpback = 300;
                global.ComboTime = clamp(global.ComboTime - 0.5, 0, 60);
                var _oldcollect = global.Collect;
                global.Collect = max(global.Collect - 100, 0);
                var _repeat = clamp(round((_oldcollect - global.Collect) / 10), 0, 15);
                
                if (global.Collect > 0)
                {
                    create_small_number(x, y, string(global.Collect - _oldcollect), 1);
                    
                    repeat (_repeat)
                        instance_create(x, y, obj_pizzaloss);
                }
                
                instance_create(x, y, obj_spikehurteffect);
                image_index = 0;
                flash = true;
                global.style -= 15;
                vsp = -12;
                
                with (obj_bosscontroller)
                    event_user(1);
                
                return true;
            }
        }
    }
    
    return false;
}
