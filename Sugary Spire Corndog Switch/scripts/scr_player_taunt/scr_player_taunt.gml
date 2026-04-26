function state_player_taunt()
{
    if (sprite_index != spr_player_PZ_freeFallSpin)
    {
        hsp = 0;
        movespeed = 0;
    }
    else
    {
        hsp = xscale * movespeed;
    }
    
    landAnim = false;
    
    if (sprite_index == spr_taunt || sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
    {
        tauntTimer--;
        vsp = 0;
    }
    
    if (sprite_index == spr_player_PZ_freeFallSpin && place_meeting(x, y + 1, obj_solid))
    {
        state = UnknownEnum.Value_66;
        sprite_index = spr_player_PZ_crouchSlide;
    }
    
    if (sprite_index == spr_taunt)
    {
        if (tauntTimer >= 5 && superTauntCharged && key_up)
        {
            image_index = 0;
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
        }
        
        if (!instance_exists(parryId))
        {
            with (instance_create(x, y, obj_parryhitbox))
            {
                other.parryId = id;
                image_xscale = other.xscale;
            }
        }
    }
    
    if (tauntTimer <= 0 && sprite_index == spr_taunt)
        scr_taunt_setVariables();
    
    if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
    {
        vsp = 0;
        hsp = 0;
        superTauntBuffer = 0;
        
        if (floor(image_index) >= 5 && superTauntCharged)
        {
            instance_create(x, y, obj_tauntaftereffectspawner);
            
            with (obj_parent_baddie)
            {
                if (bbox_in_camera(id, view_camera[0]) && !invincibleBaddie)
                {
                    spawnBaddieDeadParticle = function()
                    {
                    };
                    
                    instance_destroy();
                    
                    with (instance_create(x, y, obj_shake))
                    {
                        sprite_index = other.baddieSpriteDead;
                        paletteSprite = other.paletteSprite;
                        paletteSelect = other.paletteSelect;
                        alarm[0] = 30;
                    }
                }
            }
            
            if (!instance_exists(parryId))
            {
                with (instance_create(x, y, obj_parryhitbox))
                {
                    other.parryId = id;
                    image_xscale = other.xscale;
                }
            }
            
            scr_sleep();
            camera_shake_add(10, 30);
            superTauntCharged = false;
        }
        
        if (animation_end())
        {
            superTauntBuffer = 0;
            superTauntCharged = false;
            scr_taunt_setVariables();
        }
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_null || sprite_index == spr_petdog || sprite_index == spr_bossintro || sprite_index == spr_null || (sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate)))
            state = UnknownEnum.Value_1;
    }
    
    if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
        image_speed = 0.4;
    else if (sprite_index == spr_taunt)
        image_speed = 0;
    else
        image_speed = 0.35;
    
    if (true && sprite_index == spr_taunt)
    {
        if (key_down2)
        {
            paletteSelect++;
            
            if (paletteSelect >= array_length(myPalettes))
                paletteSelect = 0;
            
            if (buffer_exists(global.player_pal_buffer))
                buffer_delete(global.player_pal_buffer);
            
            tauntTimer = 20;
        }
        
        if (key_up2 && !superTauntCharged)
        {
            var _character;
            
            switch (character)
            {
                case UnknownEnum.Value_0:
                    _character = UnknownEnum.Value_1;
                    paletteSelect = 1;
                    break;
                
                case UnknownEnum.Value_1:
                    _character = UnknownEnum.Value_3;
                    paletteSelect = 1;
                    break;
                
                case UnknownEnum.Value_3:
                    _character = UnknownEnum.Value_2;
                    paletteSelect = 0;
                    break;
                
                case UnknownEnum.Value_2:
                    _character = UnknownEnum.Value_4;
                    paletteSelect = 0;
                    break;
                
                case UnknownEnum.Value_4:
                    _character = UnknownEnum.Value_0;
                    paletteSelect = 0;
                    break;
            }
            
            scr_player_changeCharacter(self, _character);
            tauntStored.sprite_index = spr_idle;
            tauntStored.state = UnknownEnum.Value_1;
            tauntTimer = 20;
            image_index = irandom_range(0, sprite_get_number(spr_taunt));
            sprite_index = spr_taunt;
            
            with (instance_create(x, y, obj_taunteffect))
                playerID = other.id;
        }
    }
}
