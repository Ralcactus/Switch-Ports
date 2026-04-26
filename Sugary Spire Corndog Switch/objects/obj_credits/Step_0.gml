draw_set_font(global.creditsfont);

if (y <= (-string_height(creditsText) + 540))
    can_goUp = false;

if (obj_parent_player.key_jump2 && !instance_exists(obj_fadeoutTransition))
{
    scr_levelSet();
    obj_parent_player.targetDoor = "A";
    obj_parent_player.targetRoom = hub_w1;
    instance_create(x, y, obj_fadeoutTransition);
}

if (can_goUp)
    vspeed = lerp(vspeed, -0.4, 0.1);
else
    vspeed = lerp(vspeed, 0, 0.2);
