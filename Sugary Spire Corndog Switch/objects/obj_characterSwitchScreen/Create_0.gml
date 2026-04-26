depth = obj_tv.depth - 1;
state = 0;
staticdex = 0;
alarm[0] = 80;
obj_parent_player.hsp = 0;
obj_parent_player.vsp = 0;
event_play_oneshot("event:/SFX/ui/tvswitch");
var _sprite = spr_souractiveCharacterTransition_Pizzelle;

switch (character)
{
    case UnknownEnum.Value_3:
        _sprite = spr_souractiveCharacterTransition_Gumbob;
        break;
}

sprite_index = _sprite;
global.ComboFreeze = 30;
