y = approach(y, inity, 0.1);

if (sprite_index == spr_object1_activeate && animation_end())
    sprite_index = spr_object1_unactive;

if (place_meeting(x, y + 24, obj_parent_player) && sprite_index != spr_object1_activeate)
{
    game_set_speed(setspd, gamespeed_fps);
    sprite_index = spr_object1_activeate;
    camera_shake_add(20, 40);
    y -= 5;
    event_play_oneshot("event:/SFX/ui/stamp");
}
