if (touchedByPlayer || !signEnabled || (character == "MAIN CHARACTER" && other.character == other.mainPlayerCharacter) || other.character == character)
    exit;

obj_temporaryCharacterChange.touchedByPlayer = true;
obj_temporaryCharacterChange.alarm[0] = 60;

with (other)
{
    scr_player_changeCharacter(id, (other.character == "MAIN CHARACTER") ? mainPlayerCharacter : other.character, true);
    instance_create(0, 0, obj_characterSwitchScreen, 
    {
        character: character
    });
    x = other.targetX;
    y = other.targetY;
}

if (!global.SouractiveProgression)
    global.SouractiveProgression = 1;
