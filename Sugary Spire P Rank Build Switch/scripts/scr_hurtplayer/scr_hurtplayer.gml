/// @desc Hurts player. Returns whether or not player is in hurt state after function is called.
/// @param {id} [player] 
/// @param {real} [movespeed]
/// @returns {bool} whether or not player is in hurt state
function scr_hurtplayer(player = obj_player, mspeed)
{
    if (!global.freezeframe && player.state != states.actor && player.state != states.parry && player.state != states.hurt)
    {
        with (player)
        {
            if (cutscene == 1)
                continue;
            
            if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes) && cutscene == 0)
                continue;
            
            if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
                continue;
            
            if (state == states.minecart)
            {
                sprite_index = spr_player_mach3hitwall;
                state = states.bump;
                hsp = 2.5 * xscale;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x, y, obj_bombexplosion);
                
                for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
                {
                    with (instance_create(x + irandom_range(-9, 9), y + irandom_range(-9, 9), obj_debris))
                    {
                        sprite_index = spr_minecartdebris;
                        image_index = i;
                        vsp = floor(random_range(-5, -9));
                        hsp = floor(random_range(-5, 7));
                    }
                }
            }
            else if (state == states.bombpep && hurted == 0) { }
            else if (state == states.boxxedpep) { }
            else if (state == states.bottlerocket || (state == states.pizzanokungfu && flash)) { }
            else if (state == states.frostburnspin) { }
            else if (state != states.hurt && state != states.backbreaker && hurted == 0 && cutscene == 0 && state != states.bump && state != states.tumble)
            {
                scr_sound(sound_touchspike);
                global.hurtcounter += 1;
                state = states.hurt;
                alarm[8] = 60;
                alarm[7] = 120;
                hurted = 1;
                
                if (xscale == other.image_xscale)
                    sprite_index = spr_hurtjump;
                else
                    sprite_index = spr_hurt;
                
                if (!is_undefined(mspeed))
                    movespeed = mspeed;
                else
                    movespeed = 8;
                
                vsp = -8;
                timeuntilhpback = 300;
                global.combotime = clamp(global.combotime - 0.5, 0, 60);
                var _oldcollect = global.collect;
                
                if (global.collect > 100)
                    global.collect -= 100;
                else
                    global.collect = 0;
                
                var _repeat = clamp(round((_oldcollect - global.collect) / 10), 0, 15);
                
                if (global.collect > 0)
                {
                    create_small_number(x, y, string(global.collect - _oldcollect), 1);
                    
                    repeat (_repeat)
                        instance_create(x, y, obj_pizzaloss);
                }
                
                instance_create(x, y, obj_spikehurteffect);
                image_index = 0;
                flash = 1;
                global.style -= 15;
                
                with (obj_bosscontroller)
                    event_user(1);
                
                return true;
            }
        }
    }
    
    return false;
}
