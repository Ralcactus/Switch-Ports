windowwidth = window_get_width();
windowheight = window_get_height();
appscalex = 1;
appscaley = 1;
guisurf = -1;
finalsurf = -1;
bgsurf = -1;
copyapp = false;
hovering = false;
clicklink = -1;
global.screenmouse_x = 0;
global.screenmouse_y = 0;
image_speed = 0.35;
gpu_set_alphatestenable(true);
gpu_set_alphatestref(0);
gpu_set_texrepeat(true);
gpu_set_blendenable(true);
application_surface_draw_enable(false);

gameframe_init();
global.gameframe_caption_font = font_caption;
global.gameframe_caption_text = window_get_caption();
global.gameframe_caption_icon = spr_icon;
global.gameframe_border_width = 2;

if (window_is_rounded())
{
    global.gameframe_border_width = 0;
    global.gameframe_caption_draw_border = function() { }
}

mouse_xprev = mouse_x;
mouse_yprev = mouse_y;
goawaytimer = 100;
camera = view_camera[0];
zoom = 1;
camDist = -270;
camFov = 88;
camAsp = camera_get_view_width(camera) / camera_get_view_height(camera);
view2D = -1;
proj2D = -1;
viewMat = -1;
projMat = -1;
camX = x;
camY = y;
camZ = depth;
camYAW = 0;
camPITCH = 0;
camXINTERP = 0;
camYINTERP = 0;
curlock = noone;
curlockbboxdata = [];
prevlock = curlock;
prevlockbboxdata = curlockbboxdata;
interpplaypos = false;
prevcamx = camX;
prevcamy = camY;
campan = 0;
camForward = 0;
camUp = 0;
camVerticalPan = 0;
camshake = 0;
shake_mag_acc = 0;
shake_mag = 0;
noisehudshaketime = 0;
noisehudshake = 0;
showhovertimer = false;
hovertimerfade = 0;
hovertimerflash = 0;
billboardlist = ds_list_create();
toshadow = [];

shadedobjects = 
[
	obj_player, 
	obj_playerheart, 
	obj_philbert, 
	obj_pumpkin, 
	obj_rope, 
	obj_checkpoint, 
	obj_torchplatform, 
	obj_deathplatform, 
	obj_deathplatformend, 
	obj_nitrodetonator, 
	par_billboard, 
	par_collect, 
	par_gem, 
	par_enemy, 
	par_crate, 
	obj_destroyablenitroarrow, 
	obj_destroyablecheckpoint, 
	obj_endplatform, 
	obj_movingplatformguy, 
	obj_windmill, 
	obj_outhouse, 
	obj_mirror
];

debugcam = false;
debugcamcontrols = false;

vBuffTiles = array_create(0, -1);
assetLayers = [];
var _shadows = sprite_get_number(tex_shadow);
shadowTex = array_create(_shadows);

for (var _i = 0; _i < _shadows; _i++)
    shadowTex[_i] = sprite_get_texture(tex_shadow, _i);

vBuffShadow = vertex_create_buffer();
vertex_begin(vBuffShadow, global.vFormat);
vertex_create_face(vBuffShadow, new Vec3(-1, 0, -1), new Vec3(1, 0, -1), new Vec3(1, 0, 1), new Vec3(-1, 0, 1), tex_shadow);
vertex_end(vBuffShadow);
vertex_freeze(vBuffShadow);
globallight = 1;
u_tileLightLevel = shader_get_uniform(shd_3dtiles, "u_LightLevel");
u_shadowLightLevel = shader_get_uniform(shd_shadows, "u_LightLevel");

global.outlineDrawing = false;
outlineDebug = false;
outlineSurf = -1;
outlineTileOutlining = shader_get_uniform(shd_3dtiles, "u_Outlining");
outlineMask = shader_get_sampler_index(shd_3doutline, "u_Mask");
outlineLayers = shader_get_sampler_index(shd_3doutline, "u_Layers");
outlineTexel = shader_get_uniform(shd_3doutline, "u_Texel");
outlineUVs = shader_get_uniform(shd_3doutline, "u_UVs");
outlineHUDTexel = shader_get_uniform(shd_3doutline_hud, "u_Texel");
shadowMask = shader_get_sampler_index(shd_shadows, "u_Mask");

hpalpha = 0;
collectalpha = 0;
comboalpha = 0;
pumpkinalpha = 0;
cratealpha = 0;
gemalpha = 0;
hpatimer = 0;
collectatimer = 0;
comboatimer = 0;
pumpkinatimer = 0;
crateatimer = 0;
gematimer = 0;
hudcratespin = 0;
hudcratesurf = -1;
candyind = 0;
hudgemsurf = -1;
scoresparkles = array_create(0);
scoresparkletimer = 0;

function ScoreSparkle(xx, yy) constructor
{
    x = xx + random_range(-32, 32);
    y = yy + random_range(-16, 16);
    sprite = choose(spr_collectsparkleeffect1, spr_collectsparkleeffect2);
    index = 0.5;
}

scoresurf = -1;
scoreshake = array_create(0);
scorepal = array_create(0);
prevcollect = -1;
piesurf = -1;
u_colour = shader_get_uniform(shd_gemshading_gui, "u_Colour");
u_light = shader_get_uniform(shd_gemshading_gui, "u_Light");
u_view = shader_get_uniform(shd_gemshading_gui, "u_View");

function lock_cam(_x, _y, _lock, _lockbboxdata)
{
    var _camW = get_game_width() * zoom;
    var _camH = get_game_height() * zoom;
    
    switch (_lock)
    {
        case obj_lockcamvertical:
            _y = clamp(_y, _lockbboxdata[1] + (_camH / 2), _lockbboxdata[3] - (_camH / 2));
            break;
        
        case obj_lockcambottom:
            _y = min(_y, _lockbboxdata[3] - (_camH / 2));
            break;
        
        case obj_lockcamtop:
            _y = max(_y, _lockbboxdata[1] + (_camH / 2));
            break;
        
        case obj_lockcamhorizontal:
            _x = clamp(_x, _lockbboxdata[0] + (_camW / 2), _lockbboxdata[2] - (_camW / 2));
            break;
        
        case obj_lockcamright:
            _x = min(_x, _lockbboxdata[2] - (_camW / 2));
            break;
        
        case obj_lockcamleft:
            _x = max(_x, _lockbboxdata[0] + (_camW / 2));
            break;
        
        case obj_lockcamtopright:
            _x = min(_x, _lockbboxdata[2] - (_camW / 2));
            _y = max(_y, _lockbboxdata[1] + (_camH / 2));
            break;
        
        case obj_lockcamtopleft:
            _x = max(_x, _lockbboxdata[0] + (_camW / 2));
            _y = max(_y, _lockbboxdata[1] + (_camH / 2));
            break;
        
        case obj_lockcambottomright:
            _x = min(_x, _lockbboxdata[2] - (_camW / 2));
            _y = min(_y, _lockbboxdata[3] - (_camH / 2));
            break;
        
        case obj_lockcambottomleft:
            _x = max(_x, _lockbboxdata[0] + (_camW / 2));
            _y = min(_y, _lockbboxdata[3] - (_camH / 2));
            break;
        
        case obj_lockcamverticalright:
            _x = min(_x, _lockbboxdata[2] - (_camW / 2));
            _y = clamp(_y, _lockbboxdata[1] + (_camH / 2), _lockbboxdata[3] - (_camH / 2));
            break;
        
        case obj_lockcamverticalleft:
            _x = max(_x, _lockbboxdata[0] + (_camW / 2));
            _y = clamp(_y, _lockbboxdata[1] + (_camH / 2), _lockbboxdata[3] - (_camH / 2));
            break;
        
        case obj_lockcamhorizontalbottom:
            _x = clamp(_x, _lockbboxdata[0] + (_camW / 2), _lockbboxdata[2] - (_camW / 2));
            _y = min(_y, _lockbboxdata[3] - (_camH / 2));
            break;
        
        case obj_lockcamhorizontaltop:
            _x = clamp(_x, _lockbboxdata[0] + (_camW / 2), _lockbboxdata[2] - (_camW / 2));
            _y = max(_y, _lockbboxdata[1] + (_camH / 2));
            break;
        
        case obj_lockcamall:
            _x = clamp(_x, _lockbboxdata[0] + (_camW / 2), _lockbboxdata[2] - (_camW / 2));
            _y = clamp(_y, _lockbboxdata[1] + (_camH / 2), _lockbboxdata[3] - (_camH / 2));
            break;
    }
    
    return [_x, _y];
}

function update_cam(_calculate_view = true, _set_view = true)
{
    if (_calculate_view)
    {
        var _xOff = camX + camshake;
        var _yOff = camY + camshake;
        var _xFrom = _xOff;
        var _yFrom = _yOff;
        var _zFrom = camZ;
        var _xTo = _xOff + (dcos(camYAW) * dcos(camPITCH));
        var _yTo = _yOff - dsin(camPITCH);
        var _zTo = camZ - (dsin(camYAW) * dcos(camPITCH));
        var _cW = camera_get_view_width(camera);
        var _cH = camera_get_view_height(camera);
        viewMat = matrix_build_lookat(_xFrom, _yFrom, _zFrom, _xTo, _yTo, _zTo, 0, 1, 0);
        projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 1, 32000);
        view2D = matrix_build_lookat(_cW / 2, _cH / 2, -16000, _cW / 2, _cH / 2, 0, 0, 1, 0);
        proj2D = matrix_build_projection_ortho(_cW, -_cH, 1, 32000);
    }
    
    if (_set_view)
    {
        camera_set_view_mat(camera, viewMat);
        camera_set_proj_mat(camera, projMat);
        camera_apply(camera);
    }
}

function draw_background()
{
    var _camX = camX;
    var _camY = -camY;
    
    if (!surface_exists(bgsurf))
        bgsurf = surface_create(get_game_width(), get_game_height());
    
    if (surface_get_width(bgsurf) != get_game_width() || surface_get_height(bgsurf) != get_game_height())
        surface_resize(bgsurf, get_game_width(), get_game_height());
    
    surface_set_target(bgsurf);
    var bgspr = bg_pumpkintower;
    var bgframe = 0;
    var bgmoonframe = 0;
    var bgcloudsframe = 0;
    var bgoceanspr = bg_patch_ocean;
    
    switch (room)
    {
        case Titlescreen:
            bgspr = noone;
            bgoceanspr = bg_patch_oceantitle;
            bgmoonframe = 2;
            bgcloudsframe = 2;
            draw_clear(#5000B8);
            break;
        
        case PatchDeathRoute:
        case PatchDeathRoute2:
            bgspr = bg_silo;
            bgoceanspr = bg_patch_oceandeathroute;
            bgmoonframe = 1;
            bgcloudsframe = 1;
            draw_clear(#DE7681);
            break;
        
        case PatchPerilousRoute:
            bgspr = bg_skeletontower;
            bgoceanspr = bg_patch_oceanperilous;
            bgmoonframe = 3;
            bgcloudsframe = 3;
            draw_clear(#E15D1B);
            break;
        
        default:
            bgspr = bg_pumpkintower;
            bgoceanspr = bg_patch_ocean;
            bgmoonframe = 0;
            bgcloudsframe = 0;
            draw_clear(#5000B8);
    }
    
    draw_sprite_ext(bg_patch_moon, bgmoonframe, get_game_width() / 2, get_game_height() / 2, 1, 1, 0, c_white, 1);
    var _cloudmovecycle = get_cycle(sprite_get_width(bg_patch_clouds) * 4) / 4;
    draw_sprite_ext(bg_patch_clouds, bgcloudsframe, (get_game_width() / 2) + _cloudmovecycle, get_game_height() / 2, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bg_patch_clouds, bgcloudsframe, ((get_game_width() / 2) + _cloudmovecycle) - sprite_get_width(bg_patch_clouds), get_game_height() / 2, 1, 1, 0, c_white, 1);
    var _oceananimcycle = get_cycle(sprite_get_number(bgoceanspr) * 4) / 4;
    draw_sprite_ext(bgoceanspr, _oceananimcycle, get_game_width() / 2, get_game_height() / 2, 1, 1, 0, c_white, 1);
    
    if (bgspr != noone)
    {
        for (var i = 0; i < 10; i++)
        {
            bgframe = 0;
            
            if ((i % 2) == 0)
                bgframe = 1;
            
            draw_sprite_ext(bgspr, bgframe, (_camX * -0.3) + (sprite_get_width(bgspr) * i), get_game_height(), 1, 1, 0, c_white, 1);
        }
    }
    
    if (room == Patch5)
    {
        var _sp = world_to_screen(1288, 2004, 140, viewMat, projMat, true);
        
        if (!is_undefined(_sp))
            draw_sprite(spr_barn, 0, _sp[0], _sp[1]);
    }
    
    surface_reset_target();
    draw_surface_ext(bgsurf, 0, get_game_height(), 1, -1, 0, c_white, 1);
}

function draw_tiles()
{
    var _roomind = array_find_pos(global.levelrooms, room);
    gpu_push_state();
    gpu_set_blendenable(false);
    shader_set(shd_3dtiles);
    shader_set_uniform_i(outlineTileOutlining, global.outlineDrawing);
    shader_set_uniform_f(u_tileLightLevel, globallight);
    
    if (array_get_undefined(vBuffTiles, _roomind) != undefined && array_get_undefined(roomTileset, _roomind) != -1 && array_get_undefined(roomTileset, _roomind) != undefined)
        vertex_submit(vBuffTiles[_roomind], pr_trianglelist, tileset_get_texture(roomTileset[_roomind]));
    
    with (obj_jegplayer)
        event_user(0);
    
    shader_reset();
    gpu_pop_state();
}

function draw_models()
{
    var _objects = 
	[
		par_bouncysolid, 
		obj_endplatform, 
		obj_deathplatform, 
		obj_deathplatformend, 
		obj_movingplatformguy, 
		obj_outhouse, 
		par_switchsolid
	];
    var _num = collision_circle_list(camX, camY, max(global.maxscreenwidth, global.maxscreenheight), _objects, false, true, global.instancelist, false);
    
    for (var i = 0; i < _num; i++)
    {
        with (global.instancelist[| i])
        {
            if (!visible)
                continue;
            
            event_user(0);
        }
    }
    
    ds_list_clear(global.instancelist);
    
    with (obj_titlescreen)
        event_user(0);
}

function draw_assets()
{
    gpu_push_state();
    gpu_set_cullmode(0);
    
    for (var i = 0; i < array_length(assetLayers); i++)
    {
        var _l = assetLayers[i];
        matrix_set(2, matrix_build(0, 0, _l.depth, 0, 0, 0, 1, 1, 1));
        
        for (var b = 0; b < array_length(_l.elements); b++)
        {
            var _e = _l.elements[b];
            var _clr = make_colour_rgb(_e.colour[0] * globallight, _e.colour[1] * globallight, _e.colour[2] * globallight);
            draw_sprite_ext(_e.sprite, layer_sprite_get_index(_e.element), _e.x, _e.y, _e.xscale, _e.yscale, _e.angle, _clr, _e.alpha);
        }
        
        matrix_set(2, matrix_build_identity());
    }
    
    gpu_pop_state();
}

if (instance_number(obj_drawcontroller) > 1)
    show_error("Fatal Error! More than 1 draw controller object found! Check your code!", true);
