function scr_boss_vunerable()
{
    if (grounded)
    {
        hsp = approach(hsp, 0, 0.1);
        
        if (vsp > 0)
            hsp = 0;
    }
    
    movespeed = 0;
    
    if (sprite_index != hurt_spr)
        sprite_index = vulnerable_spr;
    
    if (intensity >= 0)
    {
        intensity--;
    }
    else
    {
        sprite_index = normal_spr;
        state = UnknownEnum.Value_0;
        image_index = 0;
    }
    
    var p = obj_parent_player;
    
    if (place_meeting(x, y, p) && p.state != UnknownEnum.Value_68)
    {
        var o = id;
        
        with (p)
        {
            if (instakillmove || state == UnknownEnum.Value_88)
            {
                o.xscale = -xscale;
                o.movespeed = 12;
                instance_create(o.x, o.y, obj_slapstar);
                instance_create(o.x, o.y, obj_baddieGibs);
                instance_create(o.x, o.y, obj_bangEffect);
                
                with (instance_create(o.x, o.y, obj_bangEffect))
                    sprite_index = spr_enemypuncheffect;
                
                o.sprite_index = o.hurt_spr;
                o.vsp = -12;
                o.flash = true;
                o.state = UnknownEnum.Value_2;
                o.baddieStunTimer = 120;
                o.baddieInvincibilityBuffer = 20;
                o.markedForDeath = true;
                event_play_oneshot("event:/SFX/player/punch", x, y);
                camera_shake_add(30, 15);
                scr_sleep(700);
            }
            
            if (state == UnknownEnum.Value_16)
            {
                baddieGrabbedID = o.id;
                
                with (o)
                {
                    state = UnknownEnum.Value_1;
                    instance_create(x + (other.xscale * 40), y, obj_punchdust);
                }
                
                if (!key_up)
                {
                    state = UnknownEnum.Value_86;
                    image_index = 0;
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
                }
                else
                {
                    state = UnknownEnum.Value_33;
                    sprite_index = spr_player_PZ_pileDriver_intro;
                    
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
}
