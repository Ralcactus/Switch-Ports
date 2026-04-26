depth = obj_tv.depth - 1;
state = 0;
staticdex = 0;
chardex = irandom_range(0, sprite_get_number(spr_technicaldifficulty_pizzy));
alarm[0] = 80;
obj_parent_player.hsp = 0;
obj_parent_player.vsp = 0;
event_play_oneshot("event:/SFX/ui/tvswitch");
global.ComboFreeze = 60;
