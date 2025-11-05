visible = true;

if (game_paused() || in_debug_menu() || state == states.nitrocutscene)
{
    image_index -= image_speed;
    
    for (var _i = 0; _i < 12; _i++)
    {
        if (alarm[_i] != -1)
            alarm[_i]++;
    }
    
    exit;
}

wrathofcortex = false;
xprev = x;

if (y > (room_height + 500))
    event_perform(ev_other, ev_room_start);

if (state != states.actor && state != states.dead && state != states.levelintro && state != states.noclip && state != states.debug && state != states.rope)
    scr_collide();

standingsurface = standingsurface.none;

if (grounded && vsp >= 0)
{
    standingsurface = standingsurface.grass;
    
    if (scr_solid(x, y + 1, [obj_platform, obj_slopePlatform, par_bouncysolid, obj_endplatform]))
        standingsurface = standingsurface.wood;
    
    if (scr_solid(x, y + 1, [obj_movingplatformguy, obj_destroyablecheckpoint, obj_deathplatform, obj_deathplatformend]))
        standingsurface = standingsurface.generic;
    
    if (scr_solid(x, y + 1, [par_switchsolid, obj_destroyableswitchcrate, obj_destroyablenitroarrow]))
        standingsurface = standingsurface.metal;
    
    if (onslipperyplat)
        standingsurface = standingsurface.slop;
}

if (state != states.actor && state != states.endplatform)
{
    if (grounded)
    {
        coyotetime = 7;
        punchair = 1;
        
        if (hovertime != 0)
            obj_drawcontroller.hovertimerflash = 1;
        
        hovertime = 0;
    }
    else if (coyotetime > 0)
    {
        if (vsp < 0)
            coyotetime = 0;
        else
            coyotetime--;
    }
    
    if (input_check_pressed("jump"))
        jumpbuffer = 10;
    
    jumpbuffer = max(jumpbuffer - 1, 0);
    
    if (input_check_pressed("attack"))
        attackbuffer = 8;
    
    attackbuffer = max(attackbuffer - 1, 0);
    
    if (input_check_pressed("slide"))
        slidebuffer = 8;
    
    slidebuffer = max(slidebuffer - 1, 0);
}
else if (state == states.actor)
{
    hsp = 0;
    vsp = 0;
}

if (sprite_index != spr_player_walljumpstart && sprite_index != spr_player_walljump2start && sprite_index != spr_player_walljump && sprite_index != spr_player_downslidejump && sprite_index != spr_player_longjump && sprite_index != spr_player_longjumpend && sprite_index != spr_player_ropeswing && sprite_index != spr_player_cratebounce && sprite_index != spr_player_land && sprite_index != spr_player_land2 && sprite_index != spr_player_jump && sprite_index != spr_player_jumppeak && sprite_index != spr_player_jumpend && sprite_index != spr_player_fall && sprite_index != spr_player_fallturn && (sprite_index != spr_player_mach2land || (sprite_index == spr_player_mach2land && image_index > 6)) && sprite_index != spr_player_mach2jump && sprite_index != spr_player_mach2fall && sprite_index != spr_player_secondjump && sprite_index != spr_player_secondjumpend && sprite_index != spr_player_mach2fastjumpstart && sprite_index != spr_player_mach2fastjumpend)
    jumpnum = 0;

states[state]();

if (state != states.normal)
{
    landanim = 0;
    movestop = 0;
    turning = 0;
}

if (grounded && vsp >= 0 && state != states.jump && state != states.sprintjump)
    bouncecombo = 0;

if (state != states.jump)
    hovering = 0;

if (state != states.crouch && state != states.jump)
    crouchjump = 0;

if (state != states.machslide && state != states.jump)
    canchangedir = 1;

if (state != states.cartwheel)
    cartwheelcooldown = approach(cartwheelcooldown, 0, 1);

walljumptimer = approach(walljumptimer, 0, 1);
wallslidecanceltimer = approach(wallslidecanceltimer, 0, 1);
longjumptimer = approach(longjumptimer, 0, 1);

if (state != states.punch && nextpunch > 0)
{
    nextpunch = approach(nextpunch, 0, 1);
    
    if (nextpunch <= 0)
        lastpunch = 0;
}

if (state != states.sprint && state != states.wall)
    mach4mode = 0;

if (state != states.standstillrun)
    standstillrun = 0;

if (move != dontcling || (state != states.normal && state != states.crouch && state != states.jump))
    dontcling = 0;

if (state != states.downslide)
    slidetime = 18;

if (state == states.rope)
    ropel = min(ropel + 0.1, 1);
else
    ropel = 0;

if (sprite_index != spr_player_idle)
{
    if (image_xscale == 1)
        platformspin = 55;
    else
        platformspin = 325;
    
    showturnsprite = false;
}

if (!place_meeting(x, y, obj_hallway))
    outofhallway = true;

if (state != states.fakewalk)
    fakewalktime = 0;

if (showturnsprite && !ondeathplatform && (floor((wrap(platformspin, 0, 360) / 360) * 16) == 2 || floor((wrap(platformspin, 0, 360) / 360) * 16) == 14))
    showturnsprite = false;

if (floor((wrap(platformspin, 0, 360) / 360) * 16) != 2 && floor((wrap(platformspin, 0, 360) / 360) * 16) != 14)
    showturnsprite = true;

var afterimagegroundpoundcheck = obj_player.state == states.groundpound && obj_player.sprite_index == spr_player_groundpound;

if ((movespeed > 9 || afterimagegroundpoundcheck) && state != states.rope)
{
    if (afterimagetime <= 0)
    {
        afterimagetime = 6;
        
        with (instance_create_depth(x, y, z + 4, obj_afterimage))
        {
            image_speed = 0;
            sprite_index = other.sprite_index;
            image_index = other.image_index;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
            image_angle = other.angle;
            
            if (!afterimagegroundpoundcheck)
                image_alpha = min(other.movespeed / 10, 1) * 0.75;
            else
                image_alpha = min(other.vsp / 20, 1) * 0.75;
        }
    }
    else
        afterimagetime--;
}

var _onslippy = scr_solid(x, y + 1, obj_slipperyplatform) || scr_solid(x, y + 1, obj_slipperyplatformslope);

if (grounded)
{
    if (!_onslippy)
        decel = 1;
    else
        decel = 0.125;
    
    var _lerpspd = 0.2;
    
    if (abs(hsp) > 10)
        _lerpspd = 0.35;
    
    if (abs(hsp) > 15)
        _lerpspd = 0.5;
    
    angle = lerpAngle(angle, get_floor_angle(), _lerpspd);
    hovered = 0;
}
else if (state != states.wall)
    angle = 0;

if (player_collideable() && scr_solid(x, y + 1, obj_movingplatformguy))
    movingplatID = instance_place(x, y + 1, obj_movingplatformguy);
else
    movingplatID = noone;

if (movingplatID != noone)
{
    if (movingplatID.synced)
    {
        with (movingplatID.object_index)
            landed |= synced;
    }
    else
        movingplatID.landed = true;
}

if (instance_exists(speedlinesobj))
{
    speedlinesobj.x = x;
    speedlinesobj.y = y;
    speedlinesobj.image_xscale = image_xscale;
    speedlinesobj.image_angle = angle;
}

scr_playersounds();

if (state != states.endplatform && state != states.levelintro && room != RankRoom)
    global.timer++;

onslipperyplat = vsp >= 0 && _onslippy;

if (!onslipperyplat || !lastslipperyplat || !scr_solid(x, y + 1, lastslipperyplat))
    lastslipperyplat = noone;

if (onslipperyplat && sprite_index != spr_player_move && sprite_index != spr_player_slopmove)
{
    if (grounded && hsp != 0)
        particlewithcooldown(6, false, x + hsp, y + 45, depth - 8, spr_slopparticles, 1.25, 1.25, irandom(4), 0, irandom(360), 0.5, irandom_range(-hsp / 4, -hsp / 2), irandom_range(-5, -4));
}

if (state != states.downslide && state != states.crouch)
    mask_index = spr_player_mask;
else
    mask_index = spr_player_maskcrouch;
