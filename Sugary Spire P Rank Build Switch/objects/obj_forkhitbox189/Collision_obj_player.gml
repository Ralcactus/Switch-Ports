with (obj_player)
{
    if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes) && cutscene == 0)
        continue;
    
    if (state == states.bombpep && hurted == 0)
        continue;
    
    if (state == states.boxxedpep)
        continue;
    
    if (state == states.cheesepep || state == states.cheesepepstick)
        continue;
    
    if (state != states.hurt && hurted == 0 && cutscene == 0 && state != states.bump && state != states.tumble)
    {
        scr_sound(sound_touchspike);
        global.hurtcounter += 1;
        alarm[8] = 60;
        alarm[7] = 120;
        hurted = 1;
        
        if (xscale == other.image_xscale)
            sprite_index = spr_hurtjump;
        else
            sprite_index = spr_hurt;
        
        movespeed = 8;
        vsp = -5;
        timeuntilhpback = 300;
        
        if (global.collect > 100)
            global.collect -= 100;
        else
            global.collect = 0;
        
        if (global.collect != 0)
        {
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
        }
        else if (obj_player.shotgunAnim == 1)
            obj_player.shotgunAnim = 0;
        
        instance_create(x, y, obj_spikehurteffect);
        state = states.hurt;
        image_index = 0;
        flash = 1;
        global.style -= 15;
    }
}

with (instance_nearest(x, y, obj_sluggy))
{
    if (obj_sluggy.state != baddiestate.slugparry)
    {
        state = baddiestate.slugparry;
        sprite_index = spr_sluggy_parry;
        image_index = 0;
        movespeed = -8;
        flash = 1;
        image_xscale = -sign(x - obj_player.x);
        scr_sound(sound_parry);
    }
}
