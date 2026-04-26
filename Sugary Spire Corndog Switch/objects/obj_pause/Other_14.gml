global.gamePauseState = 1;
selected = 0;

switch (obj_parent_player.character)
{
    case UnknownEnum.Value_0:
    default:
        playerPauseSprite = spr_pizzelle_pause;
        break;
    
    case UnknownEnum.Value_1:
        playerPauseSprite = spr_pizzano_pause;
        break;
    
    case UnknownEnum.Value_3:
        playerPauseSprite = spr_gumbob_pause;
        break;
    
    case UnknownEnum.Value_4:
        playerPauseSprite = spr_pizzelle_pause;
        break;
}

playerCustomPalette = obj_parent_player.customPalette;
playerSPalette = obj_parent_player.customPalette ? obj_parent_player.surfacePallete : obj_parent_player.paletteSprite;
playerPalSelect = obj_parent_player.paletteSelect;
scr_pause_instances(true);
fmod_event_play(pauseMusic);
fmod_event_setPause(pauseMusic, false);
fmod_event_setParameter(pauseMusic, "state", 0, false);
canmove = true;
alarm[0] = 1;
pausecount = 29;
