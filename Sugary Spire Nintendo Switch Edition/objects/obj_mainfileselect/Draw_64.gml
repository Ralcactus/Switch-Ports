if (!loaded)
{
	draw_text_scribble(952, 532, string("[fa_right][fa_bottom][c_white][fontDefault]{0}", lang_get("loadingGeneric")))
}
else
{
	draw_set_halign(fa_right)
	draw_set_valign(fa_bottom)
	draw_set_color(c_white)
	draw_set_font(global.smallfont)
	draw_text(952, 532, string("V{0}", "4.0.0.0"))
}
