x = controller.game_width / 2;
y = controller.game_height;

with (controller)
{
    event_set_time(999);
    timer_alpha_override = 0;
}

var _sep = 820;

for (i = 0; i < 4; i++)
{
    var _inst = instance_create_micro(x + irandom_range(-380, 380), y - 1100 - (_sep * i), layer, obj_micro_bec_topping_fall);
    _inst.y_target = y - land_order[i];
    _inst.sprite_index = spr_order[i];
    _inst.order = i;
    array_push(draw_order, _inst);
}

var i = array_length(draw_order) - 1;

while (i >= 0)
{
    if (i == 0)
        draw_order[i].topping_touch = id;
    else
        draw_order[i].topping_touch = draw_order[i - 1];
    
    i--;
}
