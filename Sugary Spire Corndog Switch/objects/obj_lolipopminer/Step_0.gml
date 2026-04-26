pickthrowtime -= 0.5;

if (((obj_parent_player.x > (x - 300) && obj_parent_player.x < (x + 300)) && (y <= (obj_parent_player.y + 200) && y >= (obj_parent_player.y - 200))) && obj_parent_player.state != UnknownEnum.Value_87 && obj_parent_player.state != UnknownEnum.Value_96 && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.state != UnknownEnum.Value_97 && obj_parent_player.state != 112)
{
    sprite_index = spr_lolipopmineranger;
    
    if (pickthrowtime == 0)
    {
        with (instance_create(x, y, obj_pickaxeprojectile))
            image_xscale = other.image_xscale;
        
        pickthrowtime = irandom_range(200, 500);
    }
}
else
{
    sprite_index = spr_lolipopmineridle;
}
