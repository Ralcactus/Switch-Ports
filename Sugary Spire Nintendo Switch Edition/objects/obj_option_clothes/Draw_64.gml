if (!instance_exists(obj_option))
	exit

draw_set_alpha(0.5)
draw_rectangle_color(-100, -100, 1060, 640, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)
var _sprite = spr_fileDelete_snore

if (deleteFileBuffer > 0)
	_sprite = spr_fileDelete_unlit

if (deleteFileBuffer > (deleteFileBufferMax / 2))
	_sprite = spr_fileDelete

var circle_visual = string("[{0},{1}]", sprite_get_name(spr_holdCircle), (deleteFileBuffer / deleteFileBufferMax) * sprite_get_number(spr_holdCircle))
var selection_string = string("\n\n[{0}]{1}{2}         [{3}]{4}", (optionSelection == 1) ? "c_gray" : "c_white", lang_get("main_menu_yes"), circle_visual, (optionSelection == 0) ? "c_gray" : "c_white", lang_get("main_menu_no"))
draw_text_scribble(480, 270, string_concat(string("[c_white][{0},{1}][fa_middle][fa_center][fontDefault]", sprite_get_name(_sprite), image_index), "[c_red]", lang_get("reset_clothes_confirm"), "[c_white]", string("[{0},{1}]", sprite_get_name(_sprite), image_index), selection_string))
