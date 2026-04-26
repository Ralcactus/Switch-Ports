event_play_multiple("event:/SFX/general/collect", x, y);
var val = 100;
create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), string(val));
global.PokerChips += val;
global.Collect += val;
global.ComboTime = 60;

with (create_collect_effect(x, y, sprite_index, val, col))
    pokerChip = true;

instance_destroy();
