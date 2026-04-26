function scr_enemy_throw()
{
    sprite_index = spr_throw;
    
    if (object_index == obj_fizzCloud || object_index == obj_conedrone)
        vsp = 0;
    
    if (!grounded)
        hsp = approach(hsp, 0, 0.1);
    else
        hsp = 0;
    
    scr_conveyorBeltKinematics();
    
    if (animation_end())
    {
        switch (object_index)
        {
            case obj_fizzCloud:
            case obj_frothCloud:
            case obj_conedrone:
                state = UnknownEnum.Value_18;
                sprite_index = baddieSpriteWalk;
                break;
            
            default:
                state = UnknownEnum.Value_1;
                sprite_index = baddieSpriteWalk;
                break;
        }
    }
    
    if (bombreset <= 0 && floor(image_index) >= throw_frame)
    {
        bombreset = 100;
        sprite_index = spr_throw;
        
        switch (object_index)
        {
            default:
                event_play_oneshot("event:/SFX/enemies/projectile", x, y);
                break;
            
            case obj_fizzCloud:
                event_play_oneshot("event:/SFX/enemies/thunderspawn", x, y);
                break;
        }
        
        switch (object_index)
        {
            case obj_gumslime:
                bombreset = 200;
                
                with (instance_create(x + (image_xscale * 6), y - 6, obj_gumslime_proj))
                {
                    image_xscale = other.image_xscale;
                    movespeed = 5;
                    vsp = -8;
                }
                
                break;
            
            case obj_honeyslime:
                bombreset = 200;
                
                with (instance_create(x + (image_xscale * 6), y - 6, obj_sludge))
                {
                    image_xscale = other.image_xscale;
                    movespeed = 5;
                    vsp = -8;
                }
                
                break;
            
            case obj_honeycreature:
                bombreset = 200;
                instance_create(x, y, obj_honeycreatureprojectile);
                break;
            
            case obj_spitwad:
                bombreset = 200;
                
                with (instance_create(x + (image_xscale * 6), y - 6, obj_gumslime_proj))
                {
                    image_xscale = other.image_xscale;
                    movespeed = 5;
                    vsp = -8;
                }
                
                break;
            
            case obj_spitter:
                bombreset = 200;
                
                with (instance_create(x + (image_xscale * 6), y - 6, obj_spitter_proj))
                {
                    image_xscale = other.image_xscale;
                    movespeed = 5;
                    vsp = -8;
                }
                
                break;
            
            case obj_googlyjuice:
                bombreset = 400;
                
                with (instance_create(x, y, obj_puddle))
                {
                    image_xscale = sign(other.image_xscale);
                    vsp -= 12;
                    hsp = 2;
                    grounded = 0;
                }
                
                with (instance_create(x, y, obj_puddle))
                {
                    image_xscale = -sign(other.image_xscale);
                    vsp -= 12;
                    hsp = -2;
                    grounded = 0;
                }
                
                break;
            
            case obj_gumballmachine:
                bombreset = 250;
                
                with (instance_create(x + (image_xscale * 6), y - 6, obj_gumball))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                    vsp = -4;
                }
                
                break;
            
            case obj_cottonwitch:
                bombreset = 400;
                
                if (!painter)
                {
                    with (instance_create(x, y, obj_cottonwitchprojectile))
                        image_xscale = other.image_xscale;
                }
                else
                {
                    with (instance_create(x, y, obj_paintwitchproj))
                        image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_guard:
            case obj_flyingguard:
                if (object_index != obj_flyingguard)
                    vsp = -9;
                
                alarmed = true;
                global.martian_alarmed = true;
                
                with (obj_parent_baddie)
                {
                    if (id != other.id)
                    {
                        vsp = -4;
                        
                        if (object_index != obj_googlyjuice && object_index != obj_fizzCloud)
                            paletteSelect = 1;
                        
                        elite = true;
                        eliteHP = max(1, eliteHP);
                    }
                    
                    instance_create(x, y - 50, obj_noticeeffect);
                }
                
                break;
            
            case obj_popcornbag:
                bombreset = 400;
                instance_destroy(butterID);
                
                with (instance_create(x, y, obj_hotbutter))
                {
                    vsp -= 12;
                    hsp = -other.image_xscale * 2;
                    grounded = 0;
                    other.butterID = id;
                }
                
                break;
            
            case obj_mintsplosion:
                bombreset = 200;
                
                with (instance_create(x + (image_xscale * 65), y + 10, obj_mintsplosion_bomb))
                {
                    image_xscale = other.image_xscale;
                    movespeed = 12;
                }
                
                break;
            
            case obj_icescreamer:
                bombreset = 300;
                hsp = image_xscale * -8;
                
                with (instance_create(x, y, obj_icescreamer_cone))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_snowMint:
                bombreset = 400;
                
                with (instance_create(x, y, obj_snowMintProjectile))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_fizzCloud:
                bombreset = 300;
                
                with (instance_create(x, y, obj_thundercloudprojectile))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_beecopter:
                bombreset = 300;
                
                with (instance_create(x, y, obj_beecopterbomb))
                    image_xscale = other.image_xscale;
            
            case obj_popice:
                bombreset = 200;
                
                with (instance_create(x, y - 8, obj_popice_sneezeparticle))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_conedrone:
                bombreset = 300;
                instance_create(x, y, obj_conedroneprojectile);
                break;
            
            case obj_beeSoldier:
                bombreset = 500;
                instance_create(x, y, obj_beemissile);
                break;
            
            case obj_beemortar:
                bombreset = 500;
                
                with (instance_create(x, y, obj_honeybomb))
                {
                    vsp = -14;
                    image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_crackerkicker:
                instance_create(x + (image_xscale * 50), y, obj_crackerkicker_kickhitbox, 
                {
                    image_xscale: image_xscale,
                    baddieID: id
                });
                bombreset = 200;
                break;
            
            case obj_gumknight:
                instance_create(x + (image_xscale * 50), y, obj_gumknight_swipehitbox, 
                {
                    image_xscale: image_xscale,
                    baddieID: id
                });
                bombreset = 100;
                break;
            
            case obj_executionerThrower:
                instance_create(x + (image_xscale * 50), y, obj_executionerAxe, 
                {
                    image_xscale: image_xscale,
                    baddieID: id
                });
                bombreset = 120;
                break;
        }
    }
}
