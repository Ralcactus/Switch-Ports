if (!global.ShowHUD)
	exit

var _my_pal_index = global.PlayerPaletteIndex

if (!number_in_range(_my_pal_index, 0, array_length(global.CharacterPalette[global.playerCharacter].palettes) - 1))
{
	show_debug_message(string("WARNING: PALETTE INDEX {0} IS OUT OF RANGE 0-{1}. DEFAULTING TO 0", _my_pal_index, array_length(global.CharacterPalette[global.playerCharacter].palettes) - 1))
	_my_pal_index = 0
}

var lang_key = global.CharacterPalette[global.playerCharacter].palettes[_my_pal_index].palName
var lang_key_desc = lang_get(string("{0}_desc", lang_key))
var scrib = scribble(string("[fa_center][promptfont][fa_bottom][alpha,{0}]{1}\n{2}", alpha, lang_get(lang_key), lang_key_desc))
scrib.wrap(camera_get_view_width(view_camera[0]) - 200)
scrib.draw(480, 524)
