if (flash && alarm[2] <= 0)
{
}

if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = false;

event_inherited();

if (state != UnknownEnum.Value_6)
    scr_scareenemy();

bombreset = max(bombreset - 1, 0);
ragereset = max(ragereset - 1, 0);
