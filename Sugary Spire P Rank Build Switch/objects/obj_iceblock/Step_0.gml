if (!global.freezeframe)
    invtime = approach(invtime, 0, 1);

if (obj_player.baddiegrabbedID != id && state == baddiestate.grabbed)
    state = baddiestate.idle;

if (type == "Heavy" && !grounded)
    vsp += 0.2;

if (y > (room_height + 200))
{
    state = baddiestate.idle;
    x = xstart;
    y = ystart;
    hsp = 0;
    vsp = 0;
}

switch (state)
{
    case baddiestate.idle:
        thrown = false;
        grav = 0.5;
        
        if (grounded)
            hsp = approach(hsp, 0, 0.3);
        
        scr_collision();
        break;
    
    case baddiestate.stun:
        if (type == "Fragile" && scr_solid(x + hsp, y + vsp))
            instance_destroy();
        
        grav = 0.5;
        
        if (grounded && vsp > 0)
            state = baddiestate.idle;
        
        scr_collision();
        break;
    
    case baddiestate.frozen:
        scr_enemy_frozen();
        break;
}

if (flash == 1 && alarm[1] <= 0)
    alarm[1] = 0.15 * room_speed;

if ((type == "Normal" || type == "Heavy") && ((state == baddiestate.idle && type == "Heavy") || state == baddiestate.stun))
{
    instance_destroy(instance_place(x + hsp, y + vsp, obj_baddie));
    instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_baddie));
    instance_destroy(instance_place(x + hsp, y + vsp, obj_destructibles));
    instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles));
    instance_destroy(instance_place(x + hsp, y + vsp, obj_icewall));
    instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_icewall));
}

if (!place_meeting(x, y, obj_dashpad))
    touching = false;

if (!global.freezeframe && place_meeting(x, y, obj_dashpad) && state != baddiestate.grabbed && touching == false)
{
    state = baddiestate.stun;
    vsp = -7;
    var _pad = instance_place(x, y, obj_dashpad);
    x = _pad.x;
    y = _pad.y;
    xscale = _pad.image_xscale;
    movespeed = 15;
    other.hsp = other.movespeed * other.xscale;
    other.flash = true;
    touching = true;
}

if (!global.freezeframe && invtime <= 0 && place_meeting(x, y, obj_player) && state != baddiestate.grabbed)
{
    with (obj_player)
    {
        if (state == states.mach3 || state == states.mach2 || state == states.pizzanokungfu || state == states.minecart || state == states.bottlerocket)
        {
            instance_create(other.x, other.y, obj_slapstar);
            instance_create(other.x, other.y, obj_baddiegibs);
            instance_create(other.x, other.y, obj_bangeffect);
            
            with (instance_create(other.x, other.y, obj_bangeffect))
                sprite_index = spr_enemypuncheffect;
            
            machpunchAnim = true;
            other.state = baddiestate.stun;
            other.vsp = -11;
            
            if (state == states.mach2)
                other.vsp = -7;
            
            other.movespeed = movespeed + 2;
            
            if (state == states.bottlerocket)
            {
                other.vsp -= 7;
                other.movespeed += 2;
            }
            
            other.xscale = xscale;
            other.hsp = other.movespeed * other.xscale;
            other.flash = true;
            other.invtime = 10;
            scr_sound(sound_punch);
            scr_sleep();
        }
        
        if (state == states.Sjump || state == states.uppercut)
        {
            var pctg = other.x - x;
            instance_create(other.x, other.y, obj_slapstar);
            instance_create(other.x, other.y, obj_baddiegibs);
            instance_create(other.x, other.y, obj_bangeffect);
            
            with (instance_create(other.x, other.y, obj_bangeffect))
                sprite_index = spr_enemypuncheffect;
            
            machpunchAnim = true;
            other.state = baddiestate.stun;
            other.vsp = vsp;
            
            if (state == states.Sjump)
                other.vsp -= 8;
            
            other.movespeed = 7 * (abs(pctg) / 32);
            
            if (sign(pctg) != 0)
                other.xscale = sign(pctg);
            else
                other.movespeed = 0;
            
            other.hsp = other.movespeed * other.xscale;
            other.flash = true;
            other.invtime = 20;
            scr_sound(sound_punch);
            scr_sleep();
        }
        
        if (state == states.handstandjump)
        {
            scr_sound(sound_slaphit);
            baddiegrabbedID = other.id;
            
            with (other)
            {
                state = baddiestate.grabbed;
                instance_create(x + (other.xscale * 40), y, obj_punchdust);
            }
            
            if (!key_up)
            {
                state = states.grab;
                sprite_index = spr_player_haulingstart;
                image_index = 0;
            }
            else
            {
                state = states.superslam;
                sprite_index = spr_player_piledriverstart;
                
                if (grounded)
                    vsp = -12;
                else
                    vsp = -6;
                
                grounded = false;
                image_index = 0;
                image_speed = 0.35;
            }
        }
    }
}
