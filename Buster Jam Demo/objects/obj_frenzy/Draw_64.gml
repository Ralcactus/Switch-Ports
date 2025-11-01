testvariablenothing = false;
trans_percent = approach(trans_percent, 1, 0.062);

if (in)
{
    var _spotlight = trans_spotlight;
    trans_spotlight = use_curve(acurv_linear, trans_percent, "in", 0, 1);
    
    if (trans_spotlight == 1 && _spotlight < 1)
    {
        with (par_boss_transition)
            instance_destroy();
    }
}
else if (out)
{
    trans_spotlight = use_curve(acurv_linear, trans_percent, "in", 1, 0);
    
    if (trans_percent == 1)
    {
        out = false;
        pattern_ind++;
    }
}

if (!draw)
    exit;

if (!surface_exists(surf_draw))
    surf_draw = surface_create(1920, 1080);

surface_set_target(surf_draw);
draw_clear_alpha(c_black, 1);
pattern_move += (1 * global.delta_game_factor);
draw_sprite_tiled_ext(spr_frenzy_pattern, pattern_ind, pattern_move, pattern_move * 0.5, 1, 1, c_white, 1);
scr_draw_microgame();
surface_reset_target();
gpu_set_blendenable(false);
draw_surface_ext(surf_draw, 0, 0, 1, 1, 0, c_white, 1);
gpu_set_blendenable(true);
