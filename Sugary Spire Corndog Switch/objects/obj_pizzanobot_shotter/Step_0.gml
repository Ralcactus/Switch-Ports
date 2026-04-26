event_inherited();

if (state != UnknownEnum.Value_4)
{
    hsp = 0;
    vsp = 0;
    
    if (state == UnknownEnum.Value_1)
    {
        shoottimer--;
        
        if (shoottimer <= 0)
        {
            shoottimer = 150;
            image_index = 0;
            
            with (instance_create(x + (image_xscale * 10), y - 20, obj_pizzanonote))
            {
                hsp = 6 * other.image_xscale;
                vsp = -6;
            }
        }
    }
}
