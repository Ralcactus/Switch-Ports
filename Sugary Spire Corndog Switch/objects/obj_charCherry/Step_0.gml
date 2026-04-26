baddieCollisionBoxEnabled = state != UnknownEnum.Value_14;
event_inherited();

if (flash && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;
