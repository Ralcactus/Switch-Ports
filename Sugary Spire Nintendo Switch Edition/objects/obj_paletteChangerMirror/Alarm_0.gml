if (savedIndex != global.PlayerPaletteIndex)
{
	ini_open(global.SaveFileName)
	ini_write_real("Misc", string("playerPaletteIndex_{0}", scr_getCharacterPrefix(global.playerCharacter)), global.PlayerPaletteIndex)
	ini_close()
	savedIndex = global.PlayerPaletteIndex
}
