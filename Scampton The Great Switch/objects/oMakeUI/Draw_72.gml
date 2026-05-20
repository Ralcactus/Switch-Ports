StickTyme++;
PartyCount = 0;

while (PartyCount != array_length(Party))
{
    PartyCount += 1;
    draw_sprite(sPepHudBLOCK, 0, ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), HUDy + 294 + A_MoveBoxUI[PartyCount - 1]);
}

instance_destroy(oMenuPartObj);

with (instance_create_depth(0, HUDy + 325, depth, oMenuPartObj))
{
    image_speed = 0;
    sprite_index = sBigBox;
    image_index = 1;
}

with (instance_create_depth(0, HUDy + 327, depth, oMenuPartObj))
{
    image_speed = 0;
    sprite_index = sBigBox;
    image_index = 2;
}

if (StickTyme == 35)
{
    PartyCount = 0;
    
    while (PartyCount != array_length(Party))
    {
        PartyCount += 1;
        
        with (instance_create_depth(((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213) + 1, HUDy + 294, depth, oPepStick))
        {
            Seed = "L";
            image_index = other.Party[other.PartyCount - 1] - 1;
        }
        
        with (instance_create_depth(((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213) + 210, HUDy + 294, depth, oPepStick))
        {
            Seed = "R";
            image_index = other.Party[other.PartyCount - 1] - 1;
        }
    }
    
    StickTyme = 0;
}
