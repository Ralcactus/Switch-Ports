function scr_enemy_stun()
{
    stunned--;
    
    if (!thrown && !throw_hit)
        sprite_index = stunfallspr;
    else
    {
        sprite_index = deadspr;
        
        with (create_afterimage(afterimages.fade, image_xscale))
        {
            image_alpha = 0.6;
            vanish = true;
        }
    }
    
    image_speed = 0.35;
    var t = thrown;
    var f = throw_hit;
    
    if (thrown && linethrown)
    {
        if (abs(hithsp) > abs(hitvsp))
            hitvsp = 0;
        
        hsp = hithsp;
        vsp = hitvsp;
        vsp -= grav;
    }
    
    if (grounded && !thrown)
        hsp = approach(hsp, 0, 0.3);
    
    var _h = 0;
    var _hh = 0;
    // Impact w Collisions when Thrown
    if ((grounded && vsp > 0 && !place_meeting(x + hsp, y, obj_destructibles) && thrown) || (hsp != 0 && place_meeting_collision(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles) && thrown))
    {
        vsp = -5;
        thrown = false;
        
        if (hithsp != 0 || hsp != 0)
        {
            _h = sign(hsp);
            _hh = sign(hithsp);
            hsp = 5 * -_h;
            hithsp = 5 * -_hh;
        }
    }
    // Impact w Ceilings when Thrown
    if ((vsp < 0 || hitvsp < 0) && place_meeting_collision(x, y - 1) && !place_meeting(x, y + hitvsp, obj_destructibles) && thrown)
    {
        vsp = 5;
        thrown = false;
    }
    // Impact w Collisions when Thrown Hit
    if ((grounded && vsp > 0 && !place_meeting(x + hsp, y, obj_destructibles) && throw_hit) || (hsp != 0 && place_meeting_collision(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles) && throw_hit))
    {
        vsp = -5;
        throw_hit = false;
        
        if (hithsp != 0 || hsp != 0)
        {
            _h = sign(hsp);
            _hh = sign(hithsp);
            hsp = 5 * -_h;
            hithsp = 5 * -_hh;
        }
    }
    // Impact w Ceilings when Thrown Hit
    if ((vsp < 0 || hitvsp < 0) && place_meeting_collision(x, y - 1) && !place_meeting(x, y + hitvsp, obj_destructibles) && throw_hit && shoulderbashed <= 0)
    {
        vsp = 5;
        throw_hit = false;
    }
    // Throw impact
    if (t != thrown && t)
    {
        show_debug_message("impact");
        eliteHP--;
        throw_hit = false;
        linethrown = false;
        
        if (!eliteEnemy || eliteHP <= 0)
        {
            if (destroyable)
                instance_destroy();
            else
            {
                repeat (2)
                {
                    instance_create(x, y, obj_slapstar);
                    instance_create(x, y, obj_baddiegibs);
                }
                
                with (instance_create(x, y, obj_bangeffect))
                    sprite_index = spr_enemypuncheffect;
                
                scr_sound(sound_punch);
                flash = true;
            }
        }
        
        if (boss_enemy)
        {
            hsp *= 1.5;
            stunned = 0;
            state = baddiestate.walk;
        }
    }
    else if (f != throw_hit && f)
    {
        repeat (2)
        {
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_baddiegibs);
        }
        
        with (instance_create(x, y, obj_bangeffect))
            sprite_index = spr_enemypuncheffect;
        
        scr_sound(sound_slapswipe2);
        flash = true;
        throw_hit = false;
        
        if (stunned < 100)
            stunned = 100;
    }
    
    if (grounded && stunned < 0 && !thrown)
    {
        image_index = 0;
        
        if (object_index != obj_charger && object_index != obj_swedishfish)
        {
            movespeed = 1;
            state = baddiestate.walk;
            sprite_index = walkspr;
        }
        else if (object_index == obj_babybear)
        {
            movespeed = 5;
            state = baddiestate.walk;
            sprite_index = walkspr;
            vsp -= 8;
        }
        else if (object_index == obj_fizz || object_index == obj_froth)
        {
            movespeed = 5;
            state = baddiestate.float;
            sprite_index = walkspr;
            vsp -= 8;
        }
        else if (object_index == obj_creamtheifOLD)
        {
            movespeed = 2;
            state = baddiestate.theif;
            sprite_index = walkspr;
            theifsubstate = 0;
        }
        else
        {
            sprite_index = idlespr;
            state = baddiestate.idle;
        }
    }
}
