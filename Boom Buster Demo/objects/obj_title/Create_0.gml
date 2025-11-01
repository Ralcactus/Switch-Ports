loaded = false;
var _splash = instance_create_layer(0, 0, "GUI", obj_splash);

if (!global.opening)
{
    with (_splash)
    {
        move_percent = 1;
        bg_alpha = 0;
        scale = 0.3;
        visible = false;
    }
}

sprite_prefetch(spr_fx_explosionHQ);
sprite_prefetch(spr_tv_select);
sprite_prefetch(spr_tv_select_screens);
go = false;
hand_ind = 0;
global.world = 1;
global.stage = 1;
global.act = 1;
global.stage_type = 0;
global.boss_cutscene = false;
init_game_globals();
state = -1;
logo_scale = 0;
percent_logo_scale = 1;
bounces = 0;
time = 0;
alarm[3] = 2;
any_scale = 1;
any_percent = 0;
started = false;
bg_yoff = 0;
bg_yoff_lerp = bg_yoff;
