draw_set_font(fnt_subtitle);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_ext(960, 1055, current_subtitle, 44, 750);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (audio_is_playing(myseq_audio) && audio_is_paused(myseq_audio))
{
    draw_set_color(c_black);
    draw_set_alpha(0.4);
    draw_rectangle(0, 0, 1920, 1080, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(fnt_subtitle);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(960, 540, "- PAUSED -");
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}
