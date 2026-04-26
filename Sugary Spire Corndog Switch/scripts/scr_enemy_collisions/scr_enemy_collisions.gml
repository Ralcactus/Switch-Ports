function scr_finishingBlow(arg0, arg1)
{
    if (!instance_exists(arg0))
        exit;
    
    if (arg0.state == UnknownEnum.Value_5 || arg0.state == UnknownEnum.Value_2)
        exit;
    
    with (arg0)
    {
        flash = true;
        global.ComboTime = 60;
        alarm[1] = 5;
        grounded = false;
        hitHsp = arg1.xscale * 25;
        hitVsp = 0;
        
        if (arg1.sprite_index == spr_player_PZ_finishingBlow_uppercut)
        {
            hitHsp = 0;
            hitVsp = -25;
        }
        
        hsp = hitHsp;
        vsp = hitVsp;
        hp = 0;
        throwAntiGrav = true;
        state = UnknownEnum.Value_5;
        
        if (object_get_parent(object_index) == obj_parent_boss)
        {
            state = UnknownEnum.Value_2;
            movespeed = abs(hsp);
        }
        
        if (baddieStunTimer < 500)
            baddieStunTimer = 500;
        
        create_particle(x, y, spr_bangEffect);
        create_particle(x, y, spr_parryeffect);
        create_debris(x, y, spr_slapstar);
        create_debris(x, y, spr_baddieGibs);
        scr_sleep();
    }
}

function scr_piledriverEnd(arg0)
{
    if (!instance_exists(arg0))
        exit;
    
    if (arg0.state == UnknownEnum.Value_5 || arg0.state == UnknownEnum.Value_2)
        exit;
    
    with (arg0)
    {
        event_play_oneshot("event:/SFX/enemies/killingblow", x, y);
        flash = true;
        global.ComboTime = 60;
        alarm[1] = 5;
        x = other.x;
        y = other.y;
        hsp = other.xscale * 10;
        vsp = -10;
        hp = 0;
        throwAntiGrav = false;
        state = UnknownEnum.Value_5;
        
        if (object_get_parent(object_index) == obj_parent_boss)
        {
            state = UnknownEnum.Value_2;
            movespeed = abs(hsp);
        }
        
        if (baddieStunTimer < 500)
            baddieStunTimer = 500;
        
        instance_create(x, y, obj_bumpEffect);
        
        repeat (2)
        {
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_baddieGibs);
        }
        
        scr_sleep();
    }
}

function scr_baddieCollisionBox(arg0 = mask_index)
{
    var old_mask = mask_index;
    mask_index = arg0;
    baddieOnPlayerCollisions();
    baddieOnEscapeRosetteCollisions();
    baddieOnBaddieCollisions();
    baddieOnSwingCollisions();
    mask_index = old_mask;
}

function baddieOnPlayerCollisions()
{
    var player_object = get_nearestPlayer();
    
    if (!invincibleBaddie && state != UnknownEnum.Value_7 && place_meeting(x, y, player_object) && !player_object.cutscene && player_object.state != UnknownEnum.Value_68)
    {
        if (baddieInvincibilityBuffer <= 0 && player_object.instakillmove && state != UnknownEnum.Value_5)
        {
            scr_sleep();
            event_play_oneshot("event:/SFX/player/punch", x, y);
            camera_shake_add(3, 3);
            global.ComboTime = 60;
            image_xscale = -player_object.xscale;
            
            if (player_object.x != x)
                image_xscale = getFacingDirection(player_object.x, x);
            
            hsp = image_xscale * abs(player_object.hsp);
            vsp = -10;
            sprite_index = baddieSpriteDead;
            flash = true;
            state = UnknownEnum.Value_4;
            
            if (baddieStunTimer < 200)
                baddieStunTimer = 200;
            
            baddieInvincibilityBuffer = 20;
            weakThrowHit = true;
            markedForDeath = true;
            
            if (player_object.vsp < 0)
            {
                hasSquashedX = true;
                squashValueX = 1;
            }
            else
            {
                hasSquashedY = true;
                squashValueY = 1;
            }
            
            create_particle(x, y, spr_bangEffect);
            create_particle(x, y, spr_enemypuncheffect);
            create_particle(x, y, spr_parryeffect);
            
            repeat (3)
            {
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddieGibs);
            }
            
            with (player_object)
            {
                if (!grounded && state != UnknownEnum.Value_69 && key_jump2)
                {
                    instance_create(x, y + 50, obj_stompeffect);
                    suplexMove = false;
                    vsp = -11;
                }
                
                if (state == UnknownEnum.Value_65 && sprite_index != spr_mach3hit)
                {
                    sprite_index = spr_mach3hit;
                    image_index = 0;
                }
                
                if (state == UnknownEnum.Value_105)
                {
                    if (other.hsp < hsp)
                        other.hsp = hsp;
                    
                    other.hsp++;
                    other.vsp = -5;
                    other.baddieInvincibilityBuffer = 10;
                    other.thrown = true;
                    other.markedForDeath = false;
                }
            }
            
            exit;
        }
        
        if (baddieInvincibilityBuffer <= 0 && state != UnknownEnum.Value_5 && !weakThrowHit && !player_object.instakillmove && (player_object.state == UnknownEnum.Value_64 || player_object.state == UnknownEnum.Value_3 || player_object.state == UnknownEnum.Value_28 || player_object.state == UnknownEnum.Value_103 || player_object.state == UnknownEnum.Value_125) && mach2Bumpable)
        {
            event_play_oneshot("event:/SFX/enemies/stomp", x, y);
            global.ComboTime = 60;
            image_xscale = -player_object.xscale;
            
            if (player_object.x != x)
                image_xscale = getFacingDirection(player_object.x, x);
            
            image_index = 0;
            hsp = image_xscale * 12;
            vsp = (player_object.y - 180 - y) / 60;
            state = UnknownEnum.Value_4;
            baddieInvincibilityBuffer = 5;
            hasSquashedX = true;
            squashValueX = 0;
            
            if (baddieStunTimer < 200)
                baddieStunTimer = 200;
            
            instance_create(x, y, obj_bumpEffect);
            
            repeat (2)
            {
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddieGibs);
            }
            
            with (player_object)
            {
                machPunchAnim = true;
                
                if (!grounded && state != UnknownEnum.Value_69 && key_jump2)
                {
                    instance_create(x, y + 50, obj_stompeffect);
                    suplexMove = false;
                    sprite_index = spr_mach2jump;
                    vsp = -11;
                }
            }
            
            exit;
        }
        
        if (baddieInvincibilityBuffer <= 0 && player_object.state == UnknownEnum.Value_106)
        {
            global.ComboTime = 60;
            event_play_oneshot("event:/SFX/player/punch", x, y);
            camera_shake_add(10, 50);
            image_index = 0;
            sprite_index = baddieSpriteDead;
            vsp = -5;
            hsp = player_object.xscale * 9;
            thrown = true;
            baddieInvincibilityBuffer = 120;
            flash = true;
            weakThrowHit = true;
            
            if (player_object.vsp < 0)
            {
                hasSquashedX = true;
                squashValueX = 1;
            }
            else
            {
                hasSquashedY = true;
                squashValueY = 1;
            }
            
            create_particle(x, y, spr_bangEffect);
            create_particle(x, y, spr_enemypuncheffect);
            
            repeat (2)
            {
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddieGibs);
            }
            
            with (player_object)
            {
                machPunchAnim = true;
                
                if (!grounded && key_jump2)
                {
                    if (!kungAirCount)
                        kungAirCount = true;
                    
                    vsp = -11;
                }
            }
            
            exit;
        }
        
        if (baddieInvincibilityBuffer <= 0 && player_object.state == UnknownEnum.Value_87 && player_object.sprite_index == spr_player_PZ_cotton_attack)
        {
            event_play_oneshot("event:/SFX/player/punch", x, y);
            event_play_oneshot("event:/SFX/enemies/killingblow", x, y);
            camera_shake_add(5, 20);
            scr_finishingBlow(id, player_object);
            exit;
        }
        
        if (stompable && vsp >= 0 && (player_object.state == UnknownEnum.Value_55 || player_object.state == UnknownEnum.Value_37) && player_object.vsp > 0 && player_object.y < y && player_object.sprite_index != player_object.spr_stompprep)
        {
            event_play_oneshot("event:/SFX/enemies/stomp", x, y);
            hasSquashedX = true;
            squashValueX = 0;
            
            if (baddieStunTimer < 200)
                baddieStunTimer = 200;
            
            if (player_object.x != x)
                image_xscale = getFacingDirection(player_object.x, x);
            
            image_index = 0;
            hsp = -image_xscale * 3;
            vsp = -5;
            state = UnknownEnum.Value_4;
            
            with (player_object)
            {
                suplexMove = false;
                stompAnim = true;
                sprite_index = spr_stompprep;
                vsp = key_jump2 ? -14 : -9;
            }
            
            exit;
        }
        
        if (grabbable && player_object.state == UnknownEnum.Value_16)
        {
            state = UnknownEnum.Value_7;
            
            if (baddieStunTimer < 200)
                baddieStunTimer = 200;
            
            with (player_object)
            {
                baddieGrabbedID = id;
                create_particle(x, y, spr_punchdust, 0, xscale, 1);
                state = UnknownEnum.Value_37;
                sprite_index = spr_player_PZ_hauling_intro;
                image_index = 0;
                
                if (key_up)
                {
                    state = UnknownEnum.Value_33;
                    sprite_index = spr_player_PZ_pileDriver_intro;
                    vsp = grounded ? -12 : -6;
                    grounded = false;
                    image_index = 0;
                    image_speed = 0.35;
                }
            }
            
            if (object_get_parent(object_index) == obj_parent_boss)
                scr_grab_boss(player_object);
            
            exit;
        }
    }
    
    exit;
}

function baddieOnBaddieCollisions()
{
    if (state != UnknownEnum.Value_5 || !place_meeting(x, y, obj_parent_baddie))
        exit;
    
    with (instance_place(x, y, obj_parent_baddie))
    {
        if (!invincibleBaddie && state != UnknownEnum.Value_7)
        {
            instance_destroy();
            exit;
        }
    }
}

function baddieOnEscapeRosetteCollisions()
{
    if (!place_meeting(x, y, obj_escaperosette))
        exit;
    
    with (instance_place(x, y, obj_escaperosette))
    {
        if (state == 1)
        {
            instance_destroy(other.id);
            exit;
        }
    }
}

function baddieOnSwingCollisions()
{
    if (baddieInvincibilityBuffer > 0 || invincibleBaddie || !place_meeting(x, y, obj_swinghitbox))
        exit;
    
    var player_object = instance_place(x, y, obj_swinghitbox).playerID;
    
    if (!instance_exists(player_object))
        exit;
    
    event_play_oneshot("event:/SFX/player/punch", x, y);
    scr_sleep();
    create_particle(x, y, spr_enemypuncheffect);
    create_particle(x, y, spr_parryeffect);
    global.ComboTime = 60;
    
    if (player_object.x != x)
        image_xscale = getFacingDirection(player_object.x, x);
    
    hsp = image_xscale * abs(player_object.hsp);
    vsp = -10;
    sprite_index = baddieSpriteDead;
    flash = true;
    state = UnknownEnum.Value_4;
    eliteHP = 0;
    
    if (baddieStunTimer < 200)
        baddieStunTimer = 200;
    
    baddieInvincibilityBuffer = 20;
    weakThrowHit = true;
    markedForDeath = true;
    camera_shake_add(3, 3);
    
    repeat (3)
    {
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddieGibs);
    }
}
