if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != UnknownEnum.Value_25)
    state = UnknownEnum.Value_25;

if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

event_inherited();

if (state != UnknownEnum.Value_6)
    scr_scareenemy();

bombreset = max(bombreset - 1, 0);
ragereset = max(ragereset - 1, 0);

if (point_in_rectangle(obj_parent_player.x, obj_parent_player.y, x - 100, y - 50, x + 100, y + 50) && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.state != UnknownEnum.Value_57)
{
    if (state != UnknownEnum.Value_6 && state == UnknownEnum.Value_1 && (obj_parent_player.state == UnknownEnum.Value_78 || obj_parent_player.state == UnknownEnum.Value_79) && bombreset <= 0)
    {
        image_index = 0;
        flash = true;
        create_heat_afterimage(UnknownEnum.Value_0);
        state = UnknownEnum.Value_22;
        sprite_index = spr_golfburger_golf;
        bombreset = 200;
    }
}

if (sprite_index == spr_golfburger_golf || invisFrames > 0)
    baddieInvincibilityBuffer = 1;
else
    baddieInvincibilityBuffer = 0;

if (invisFrames > 0)
    invisFrames--;
