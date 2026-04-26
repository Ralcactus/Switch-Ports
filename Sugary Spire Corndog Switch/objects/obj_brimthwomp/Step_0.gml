var _doit = 0;
var _myplayer = instance_nearest(x, y, obj_parent_player);

with (_myplayer)
{
    if (place_meeting(x + hsp, y + vsp, other.id) && state == UnknownEnum.Value_47)
    {
        instance_destroy(other.id);
    }
    else if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && ((state == UnknownEnum.Value_65 && (!other.charging || (other.charging && xscale == other.image_xscale && move == xscale))) || state == UnknownEnum.Value_151 || (state == UnknownEnum.Value_152 && movespeed > 5) || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_13 || (state == UnknownEnum.Value_28 && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall && sprite_index != spr_crouchslipintro && movespeed >= 12) || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_100 || (state == UnknownEnum.Value_17 && momemtum) || (state == UnknownEnum.Value_139 && substate == 0)))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == UnknownEnum.Value_119 && gumbobBounceCounter >= 3))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if ((place_meeting(x + hsp, y, other.id) || place_meeting(x - xscale, y, other.id)) && state == UnknownEnum.Value_145 && movespeed >= 12)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if ((place_meeting(x + hsp, y, other.id) || place_meeting(x - xscale, y, other.id)) && (state == UnknownEnum.Value_146 || state == UnknownEnum.Value_147) && abs(movespeed) >= 12)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + 1, other.id)) && state == UnknownEnum.Value_12 && verticalMovespeed >= 12)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == UnknownEnum.Value_58)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == UnknownEnum.Value_11 && machTwo >= 100)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if (((place_meeting(x, y + vsp, other.id) && vsp >= 0) || place_meeting(x, y + 1, other.id)) && state == UnknownEnum.Value_70 && freeFallSmash > 10)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    else if (!other.calmdowndude && other.bumpcooldown <= 0 && !other.charging && (place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)))
    {
        vsp = -5;
        
        if (xscale == sign(other.x - x))
            hsp = 7 * other.image_xscale;
        else
            hsp = 7 * xscale;
        
        xscale = sign(other.x - x);
        image_index = 0;
        sprite_index = spr_bump;
        event_play_oneshot("event:/SFX/player/splat", x, y);
        state = UnknownEnum.Value_67;
        other.bumpcooldown = 80;
    }
}

if (charging && !calmdowndude && (place_meeting(x + hsp, y, _myplayer) || place_meeting(x + image_xscale, y, _myplayer)))
{
    with (_myplayer)
    {
        if (state != UnknownEnum.Value_94)
        {
            image_index = 0;
            image_speed = 0.35;
            xscale = other.image_xscale;
            sprite_index = spr_player_PZ_slipSlide_intro;
            movespeed = other.movespeed;
            
            if (movespeed > 10)
                movespeed = 10;
            
            state = UnknownEnum.Value_94;
            vsp = -13;
            grounded = 0;
            _doit = 1;
        }
    }
}

with (instance_nearest(x, y, obj_donutShitted))
{
    if (bigShot && (place_meeting(x + hsp, y + vsp, other.id) || place_meeting(x + sign(hsp), y + sign(vsp), other.id)))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
        
        instance_destroy();
    }
}

with (instance_nearest(x, y, obj_donutSlammable))
{
    if (place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
        
        instance_destroy();
    }
}

with (instance_nearest(x, y, obj_minedummycart))
{
    if (place_meeting(x + sign(hsp), y, other.id) && place_meeting(x + hsp, y, other.id))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
}

x += hsp;
y += vsp;
hsp = image_xscale * movespeed;

if (!instance_exists(laserID))
    laserID = -4;

if (chargecooldown > 0)
    chargecooldown--;

if (bumpcooldown > 0)
    bumpcooldown--;

if (blastcooldown > 0 && _myplayer.state != UnknownEnum.Value_42)
{
    if (laserID == -4)
        blastcooldown--;
}
else
{
    blastcooldown = 0;
    calmdowndude = 0;
}

if (calmdowndude)
{
    image_alpha = 0.5;
    movespeed = 0;
}
else
{
    image_alpha = 1;
    
    if (bounced)
    {
        if (movespeed > idlemovespeed)
        {
            movespeed = approach(movespeed, idlemovespeed, 3);
        }
        else
        {
            bounced = false;
            image_xscale *= -1;
        }
    }
    
    if (blasting)
    {
        if (laserID == -4)
        {
            movespeed = approach(movespeed, idlemovespeed, 3);
            
            if (!blasted)
            {
                laserID = instance_create(x, y, obj_brimthwomp_laser);
                
                with (laserID)
                {
                    savedYscale = other.image_yscale;
                    targetID = other.id;
                }
                
                blasted = true;
            }
            else
            {
                blasting = false;
                blasted = false;
                charging = false;
                calmdowndude = 1;
            }
        }
        else if (laserID.blastTimer > 0 && distance_to_object(_myplayer) < 200)
        {
            image_xscale = sign(obj_parent_player.x - x);
            x = approach(x, _myplayer.x, 4);
        }
        else
        {
            movespeed = approach(movespeed, idlemovespeed, 3);
        }
    }
    
    if (image_xscale == sign(obj_parent_player.x - x) && distance_to_object(_myplayer) >= 120 && blastcooldown <= 0)
    {
        image_xscale = sign(obj_parent_player.x - x);
        blastcooldown = 275;
        charging = false;
        bounced = false;
        blasting = true;
    }
    else if (((distance_to_object(_myplayer) > 120 && image_xscale == sign(obj_parent_player.x - x)) || obj_parent_player.state == UnknownEnum.Value_42) && distance_to_object(_myplayer) < 500 && !blasting && !charging && chargecooldown <= 0)
    {
        charging = true;
        event_play_oneshot(sndCharge, x, y);
        
        if (x != obj_parent_player.x)
            image_xscale = sign(obj_parent_player.x - x);
    }
    
    if (charging)
    {
        if (movespeed < 12)
            movespeed += 0.5;
        
        if (place_meeting(x + hsp, y, obj_solid))
        {
            x -= hsp;
            _doit = 1;
        }
    }
    else
    {
        movespeed = approach(movespeed, idlemovespeed, 3);
        
        if (place_meeting(x + hsp, y, obj_solid))
            image_xscale *= -1;
    }
    
    if (_doit)
    {
        movespeed *= -0.35;
        
        if (movespeed > -3)
            movespeed = -3;
        
        bounced = 1;
        chargecooldown = chargecooldownMax;
        charging = false;
        event_play_oneshot("event:/SFX/player/groundpound", x, y);
        camera_shake_add(20, 40);
        
        with (obj_parent_baddie)
        {
            if (bbox_in_camera(id, view_camera[0]) && grounded)
            {
                stun = 1;
                alarm[0] = 200;
                ministun = 0;
                vsp = -5;
                hsp = 0;
            }
        }
        
        instance_create(x + (64 * image_xscale), y + 32, obj_bumpEffect);
    }
}
