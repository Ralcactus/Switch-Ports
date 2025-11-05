scr_define_collide();
grav = 0.5;
triggerNitros = true;
instance_create_depth(x, y, depth, obj_playercape);
move = 0;
movespeed = 0;
terminalVelocity = 20;
depth += 5;
z = depth;
nonplatZ = z;
state = states.actor;
afterimagetime = 0;
mach4mode = 0;
dir = image_xscale;
image_speed = 0.35;
hp = 1;
angle = 0;
jumpstop = 0;
hurt = 0;
decel = 0;
momentum = 0;
lastslipperyplat = noone;
landanim = 0;
palettespr = spr_noisepalette;
curpalette = 1;
onslipperyplat = false;
particlecooldown1 = 0;
particlecooldown2 = 0;
particlecooldown3 = 0;
particlecooldown4 = 0;
particlecooldown5 = 0;
particlecooldown6 = 0;
coyotetime = 7;
speedlinesobj = noone;
jumpbuffer = 0;
attackbuffer = 0;
slidebuffer = 0;
movestop = 0;
nextpunch = 0;
lastpunch = 0;
punchair = 1;
cartwheelcooldown = 0;
mach3crashtimer = 0;
hitstuntime = 0;
walljumptimer = 0;
wallslidecanceltimer = 0;
targetdoor = 0;
targetroom = noone;
firstroom = Patch1;
firstx = x;
firsty = y;
levelstarty = y;
hovering = 0;
hovered = 0;
dontcling = 0;
debugstate = states.normal;
ropeID = noone;
movingplatID = noone;
ondeathplatform = noone;
beforedeathroute = 
{
    room: Patch3A,
    path: pth_deathroutealt
};
targetouthouse = noone;
canchangedir = 1;
turning = 0;
platformspin = 45;
showturnsprite = false;
platformtargetpos = 0;
platformstartpos = 0;
slidetime = 18;
crouchjump = 0;
xprev = x;
bouncecombo = 0;
ropexstartpos = 0;
ropeystartpos = 0;
ropel = 0;
nointro = false;
sendtocheckpoint = false;
diddeathroute = false;
lightlevel = 1;
fakewalktime = 0;
outofhallway = true;
verticalhallway = false;
verticalhallwayposoffset = 0;
wrathofcortex = false;
hovertime = 0;
hovermaxtime = 165;
holdingdown = false;
slopfootsteptime = 0;
stepped = false;
tornadobuffer = 0;
tornadoendbuffer = 0;
jumpnum = 0;
walljumpnum = 0;
randomidletime = 240;
standstillrun = 0;
longjumptimer = 0;
outhousestartx = 0;
outhousestarty = 0;
outhousegoin = true;

playersavedstate = 
{
    state: state,
    sprite_index: sprite_index,
    mask_index: mask_index,
    image_index: image_index,
    image_speed: image_speed,
    movespeed: movespeed,
    hsp: hsp,
    vsp: vsp
};
currcheckpoint = 
{
    id: noone,
    object_index: noone,
    room: 0,
    x: 0,
    y: 0,
    collect: 0,
    destroyedcount: 0,
    pumpkins: noone,
    gems: noone,
    saveroom: noone,
    switchstate: true,
    respawnroom: ds_map_create()
};

#region Player States
enum states 
{
	normal = 0,
	jump = 1,
	standstillrun = 2,
	sprint = 3,
	sprintjump = 4,
	machslide = 5,
	hurt = 6,
	bump = 7,
	cartwheel = 8,
	punch = 9,
	wall = 10,
	downslide = 11,
	hitstun = 12,
	wallslide = 13,
	crouch = 14,
	levelintro = 15,
	noclip = 16,
	debug = 17,
	dead = 18,
	rope = 19,
	platformlocked = 20,
	falllocked = 21,
	fakewalk = 22,
	groundpound = 23,
	grimace = 24,
	tornado = 25,
	endplatform = 26,
	nitrocutscene = 27,
	outhouse = 28,
	mirror = 29,
	actor = 30,
}

states = [];
states[states.normal] = scr_player_normal;
states[states.jump] = scr_player_jump;
states[states.standstillrun] = scr_player_standstillrun;
states[states.sprint] = scr_player_sprint;
states[states.sprintjump] = scr_player_sprintjump;
states[states.machslide] = scr_player_machslide;
states[states.hurt] = scr_player_hurt;
states[states.bump] = scr_player_bump;
states[states.cartwheel] = scr_player_cartwheel;
states[states.punch] = scr_player_punch;
states[states.wall] = scr_player_wall;
states[states.downslide] = scr_player_downslide;
states[states.hitstun] = scr_player_hitstun;
states[states.wallslide] = scr_player_wallslide;
states[states.crouch] = scr_player_crouch;
states[states.levelintro] = scr_player_levelintro;
states[states.noclip] = scr_player_noclip;
states[states.debug] = function() { };
states[states.dead] = scr_player_dead;
states[states.rope] = scr_player_rope;
states[states.platformlocked] = scr_player_platformlocked;
states[states.falllocked] = scr_player_falllocked;
states[states.fakewalk] = scr_player_fakewalk;
states[states.groundpound] = scr_player_groundpound;
states[states.grimace] = scr_player_grimace;
states[states.tornado] = scr_player_tornado;
states[states.endplatform] = scr_player_endplatform;
states[states.nitrocutscene] = function() { };
states[states.outhouse] = scr_player_outhouse;
states[states.mirror] = scr_player_mirror;
states[states.actor] = function() { };
#endregion
#region Player Sounds
jumpsnd = event_instance("event:/sfx/player/jump");
landsnd = event_instance("event:/sfx/player/land");
hurtsnd = event_instance("event:/sfx/player/hurt");
machsnd = event_instance("event:/sfx/player/mach");
skidsnd = event_instance("event:/sfx/player/skid");
splatsnd = event_instance("event:/sfx/player/splat");
groundpoundstartsnd = event_instance("event:/sfx/player/groundpoundstart");
groundpoundsnd = event_instance("event:/sfx/player/groundpound");
slamsnd = event_instance("event:/sfx/player/slam");
cartwheelsnd = event_instance("event:/sfx/player/cartwheel");
punchsnd = event_instance("event:/sfx/player/punch");
bitesnd = event_instance("event:/sfx/player/bite");
runinplacesnd = event_instance("event:/sfx/player/runinplace");
slidesnd = event_instance("event:/sfx/player/slide");
grimacesnd = event_instance("event:/sfx/player/grimace");
tornadosnd = event_instance("event:/sfx/player/tornado");
wallslidesnd = event_instance("event:/sfx/player/wallslide");
hoverstartsnd = event_instance("event:/sfx/player/hoverstart");
longjumpsnd = event_instance("event:/sfx/player/longjump");
ropegrabsnd = event_instance("event:/sfx/player/ropegrab");
slopfootstepsnd = event_instance("event:/sfx/player/slopfootstep");
grassfootstepsnd = event_instance("event:/sfx/player/grassfootstep");
woodfootstepsnd = event_instance("event:/sfx/player/woodfootstep");
genericfootstep = event_instance("event:/sfx/player/genericfootstep");
metalfootstepsnd = event_instance("event:/sfx/player/metalfootstep");
voicerandom = event_instance("event:/sfx/player/voice/random");
voicehurt = event_instance("event:/sfx/player/voice/hurt");
levelintropopoutsnd = event_instance("event:/sfx/player/levelintropopout");
deadblowsnd = event_instance("event:/sfx/player/deadblow");
deadpopsnd = event_instance("event:/sfx/player/deadpop");
deadblinksnd = event_instance("event:/sfx/player/deadblink");
deaddisintergratesnd = event_instance("event:/sfx/player/disintergrate");
#endregion

enum standingsurface 
{
	grass = 0,
	wood = 1,
	slop = 2,
	metal = 3,
	generic = 4,
	none = 5,
}

standingsurface = standingsurface.grass;

#region Player Moves
function jump()
{
    state = (state == states.sprint || state == states.standstillrun || state == states.sprintjump) ? states.sprintjump : states.jump;
    vsp = -12;
    
    if (jumpnum == 2 && move == 0)
        jumpnum = 0;
    
    switch (jumpnum++)
    {
        case 0:
            if (state == states.sprintjump)
            {
                if (movespeed <= 11)
                    sprite_index = spr_player_mach2jump;
                else
                {
                    sprite_index = spr_player_mach2fastjumpstart;
                    vsp = -13;
                }
            }
            else
                sprite_index = spr_player_jump;
            
            break;
        
        case 1:
            sprite_index = spr_player_secondjump;
            vsp = -14;
            break;
        
        case 2:
            sprite_index = spr_player_cartwheel;
            scr_fmod_soundeffect(cartwheelsnd, x, y);
            jumpnum = 0;
            vsp = -15;
            break;
    }
    
    canchangedir = 1;
    jumpstop = 0;
    image_speed = 0.35;
    image_index = 0;
    onslipperyplat = false;
    lastslipperyplat = false;
    scr_fmod_soundeffect(jumpsnd, x, y);
    scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
}

function punch()
{
    hit_horizontal = -1;
    hit_vertical = -1;
    state = states.punch;
    image_index = 0;
    
    if (move != 0)
        image_xscale = move;
    
    if (!input_check("up"))
    {
        if (movespeed < 4)
            movespeed = 4;
        
        if (grounded)
        {
            if (lastpunch == 0)
                sprite_index = spr_player_punch1;
            else if (lastpunch == 1)
                sprite_index = spr_player_punch2;
            else if (lastpunch == 2)
                sprite_index = spr_player_punch3;
        }
        else
            sprite_index = spr_player_airpunch;
    }
    else
    {
        movespeed = abs(movespeed);
        
        if (grounded)
            sprite_index = spr_player_uppunch;
        else
            sprite_index = spr_player_upairpunch;
    }
    
    nextpunch = 20;
    scr_fmod_soundeffect(punchsnd, x, y);
}

function attack()
{
    if (attackbuffer > 0)
    {
        attackbuffer = 0;
        
        if ((state == states.sprint || state == states.downslide) && grounded && vsp >= 0)
        {
            if (cartwheelcooldown <= 0)
            {
                cartwheelcooldown = 5;
                
                if (move != 0)
                    image_xscale = move;
                
                image_index = 0;
                sprite_index = spr_player_tornado;
                scr_fmod_soundeffect(tornadosnd, x, y);
                
                if (state == states.downslide)
                    movespeed = 16;
                else
                    movespeed = 14;
                
                state = states.cartwheel;
                longjumptimer = 30;
                
                if (grounded)
                    scr_createparticle(true, x, y, z + 4, spr_jumpdust, image_xscale);
            }
        }
        else
            punch();
    }
}

function groundpoundstart()
{
    state = states.groundpound;
    sprite_index = spr_player_groundpoundstart;
    image_index = 0;
    vsp = -5;
    scr_fmod_soundeffect(groundpoundstartsnd, x, y);
    scr_fmod_soundeffect(groundpoundsnd, x, y);
}

function downslide()
{
    if (slidebuffer > 0 && vsp >= 0)
    {
        slidebuffer = 0;
        slidetime = 18;
        
        if (move != 0)
            image_xscale = move;
        
        if (state == states.punch)
            event_stop(punchsnd, 1);
        
        if (state == states.cartwheel)
            event_stop(cartwheelsnd, 1);
        
        state = states.downslide;
        scr_createparticle(true, x, y, z + 4, spr_jumpdust, image_xscale);
        
        if (grounded)
        {
            sprite_index = spr_player_downslide;
            scr_fmod_soundeffect(slidesnd, x, y);
        }
        else
        {
            sprite_index = spr_player_downslidedive;
            vsp = 10;
        }
        
        image_index = 0;
        holdingdown = true;
        
        if (movespeed < 14)
            movespeed = 14;
    }
}

function slide()
{
    if (slidebuffer > 0 && vsp >= 0 && grounded)
    {
        slidebuffer = 0;
        slidetime = 18;
        
        if (move != 0)
            image_xscale = move;
        
        if (state == states.punch)
            event_stop(punchsnd, 1);
        
        if (state == states.cartwheel)
            event_stop(cartwheelsnd, 1);
        
        state = states.downslide;
        scr_createparticle(true, x, y, z + 4, spr_jumpdust, image_xscale);
        sprite_index = spr_player_downslide;
        scr_fmod_soundeffect(slidesnd, x, y);
        image_index = 0;
        holdingdown = true;
        
        if (movespeed < 14)
            movespeed = 14;
    }
}

function dive()
{
    if (slidebuffer > 0 && vsp >= 0)
    {
        slidebuffer = 0;
        slidetime = 18;
        
        if (move != 0)
            image_xscale = move;
        
        if (state == states.punch)
            event_stop(punchsnd, 1);
        
        if (state == states.cartwheel)
            event_stop(cartwheelsnd, 1);
        
        state = states.downslide;
        scr_createparticle(true, x, y, z + 4, spr_jumpdust, image_xscale);
        sprite_index = spr_player_downslidedive;
        vsp = 10;
        image_index = 0;
        holdingdown = true;
        
        if (movespeed < 14)
            movespeed = 14;
    }
}

function wallslide(_x)
{
    if ((sign(_x) == sign(image_xscale) || (sign(_x) == move && !canchangedir)) && !scr_solid(x + _x, y, obj_nostickwall) && !scr_solid(x, y + 1, [obj_slope, obj_slopePlatform]) && ((move == image_xscale && state != states.sprint) || state == states.sprint || (state == states.jump && !canchangedir)) && !grounded && dontcling == 0)
    {
        image_xscale = sign(_x);
        state = states.wallslide;
        wallslidecanceltimer = 10;
        
        if (vsp > 0)
        {
            vsp = 0;
            sprite_index = spr_player_wallslidedown;
        }
        else
        {
            vsp = -abs(movespeed);
            sprite_index = spr_player_wallslideup;
        }
        
        movespeed = 0;
        hsp = 0;
    }
}

function hover()
{
    if (state == states.falllocked)
        exit;
    
    if (!grounded && vsp >= 0 && jumpbuffer > 0 && jumpbuffer <= 6 && !hovering && hovertime < hovermaxtime)
    {
        if (hovertime > 0)
        {
            trace("hover penalty");
            hovertime = min(hovertime + 10, hovermaxtime);
        }
        
        if (hovertime >= hovermaxtime)
            exit;
        
        attackbuffer = 0;
        jumpbuffer = 0;
        momentum = 0;
        
        if (!canchangedir)
        {
            movespeed *= move;
            
            if (movespeed < 0)
                movespeed = 0;
            
            hsp = 0;
            canchangedir = true;
        }
        
        if (state != states.jump)
            state = states.jump;
        
        if (vsp > 0)
        {
            if (!hovered)
            {
                hovered = 1;
                vsp = -8;
            }
            else
                vsp = vsp / 2;
        }
        
        hovering = 1;
        scr_fmod_soundeffect(hoverstartsnd, x, y);
        image_index = 0;
        sprite_index = spr_player_hoverstart;
    }
}
#endregion
#region Player Particles
function dashcloudparticle()
{
    if (particlecooldown1 > 0)
        particlecooldown1--;
    
    if (particlecooldown1 == 0)
    {
        particlecooldown1 = 15;
        scr_createparticle(true, x, y, z + 4, spr_slidecloud, image_xscale);
    }
}

function dashcloud2particle()
{
    if (particlecooldown2 > 0)
        particlecooldown2--;
    
    if (particlecooldown2 == 0)
    {
        particlecooldown2 = 15;
        scr_createparticle(true, x, y, z + 4, spr_dashcloud, image_xscale, undefined, undefined, 0.35);
    }
}

function dashcloudfastparticle()
{
    if (particlecooldown3 > 0)
        particlecooldown3--;
    
    if (particlecooldown3 == 0)
    {
        particlecooldown3 = 10;
        scr_createparticle(true, x, y, z + 4, spr_dashcloudfast, image_xscale, undefined, undefined, 0.5);
    }
}

function tornadodashcloud2particle()
{
    if (particlecooldown4 > 0)
        particlecooldown4--;
    
    if (particlecooldown4 == 0)
    {
        particlecooldown4 = 4;
        scr_createparticle(true, x, y, z + 4, spr_dashcloud, image_xscale, undefined, undefined, 0.35);
    }
}

function particlewithcooldown(_cooldown, _anim_end, _x, _y, _depth, _sprite, _xscale = 1, _yscale = 1, _index = 0, _spd = 0.35, _angle = 0, _grav = 0, _hsp = 0, _vsp = 0, _zsp = 0)
{
    if (particlecooldown6 > 0)
        particlecooldown6--;
    
    if (particlecooldown6 == 0)
    {
        particlecooldown6 = _cooldown;
        scr_createparticle(_anim_end, _x, _y, _depth, _sprite, _xscale, _yscale, _index, _spd, _angle, _grav, _hsp, _vsp, _zsp);
    }
}
#endregion