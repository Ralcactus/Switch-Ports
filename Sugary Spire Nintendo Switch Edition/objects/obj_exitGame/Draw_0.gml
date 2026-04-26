draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(-64, -64, 1024, 604, false)
draw_set_alpha(1)
draw_set_color(c_white)
var _text = "main_menu_leavegame"
var _string = string("[c_white][spr_fileBye,{0}][fontDefault][c_white][fa_center][fa_middle]{1}[c_white][spr_fileBye,{2}]\n[{3}]{4}         [{5}]{6}", image_index, lang_get(_text), image_index, (optionSelection == 1) ? "c_gray" : "c_white", lang_get("main_menu_yes"), (optionSelection == 0) ? "c_gray" : "c_white", lang_get("main_menu_no"))
draw_text_scribble(480, 270, _string)
