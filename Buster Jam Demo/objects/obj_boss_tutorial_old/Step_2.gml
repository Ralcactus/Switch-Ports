camera_set_view_pos(view_camera[0], 0, 0);

if (zoom_in)
{
    trans_percent = approach(trans_percent, 1, 0.045);
    scale_trans = use_curve(acurv_transition, trans_percent, undefined, 1, 14);
    overlay_alpha = approach(overlay_alpha, 0, 0.11);
}
else
{
    trans_percent = approach(trans_percent, 1, 0.045);
    scale_trans = use_curve(acurv_transition, trans_percent, "out", 12, 1);
    overlay_alpha = approach(overlay_alpha, 1.2, 0.11);
}

if (ending_fade)
    ending_fade_alpha = approach(ending_fade_alpha, 1, 0.009);
