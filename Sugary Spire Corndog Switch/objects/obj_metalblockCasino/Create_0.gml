event_inherited();
price = 1000;
solidID = instance_create(x, y, obj_solid);

with (solidID)
{
    var pct1 = other.sprite_width / sprite_width;
    var pct2 = other.sprite_height / sprite_height;
    image_xscale = pct1;
    image_yscale = pct2;
}

update_solid = function()
{
    if (global.PokerChips >= price)
    {
        if (instance_exists(solidID))
            solidID.x = -9999999;
        
        x = xstart;
    }
    else
    {
        if (instance_exists(solidID))
            solidID.x = xstart;
        
        x = -999999;
    }
};
