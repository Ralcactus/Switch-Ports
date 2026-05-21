if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == states.pizzanoshoulderbash || obj_player.state == states.pizzanosidejump || obj_player.state == states.minecart))
    exit;

event_inherited();

if (instance_place(x, y, obj_melon).sprite_index != spr_meloncoolparry)
{
    with (instance_place(x, y, obj_melon))
    {
        state = baddiestate.slugparry;
        substate = 1;
        image_index = 0;
        sprite_index = spr_meloncoolparry;
    }
}
