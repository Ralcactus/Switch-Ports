testvariablenothing = false;

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
var _amnt = 7;
bridget_shake = approach(bridget_shake, 0, 0.08333333333333333);
var _bridget_xshake = irandom_range(-bridget_shake * _amnt, bridget_shake * _amnt);
var _bridget_yshake = irandom_range(-bridget_shake * _amnt, bridget_shake * _amnt);
draw_sprite_ext(spr_bosstrans_knives_3_bg, 0, 0, 0, 1, 1, 0, c_white, 1);
var _order;

if (dennis_spot == 2 || dennis_spot == 3)
    _order = ["D", "B"];
else
    _order = ["B", "D"];

for (var i = 0; i < 2; i++)
{
    if (_order[i] == "B")
    {
        draw_sprite_ext(bridget_spr, bridget_ind, _bridget_xshake, _bridget_yshake, 1, 1, 0, c_white, 1);
        
        if (bridget_spr == spr_bosstrans_knives_3_bridget_down)
        {
            _xshake = random_range(-1, 1) * choose(0, 1);
            _yshake = random_range(-1, 1) * choose(0, 1);
            draw_sprite_ext(spr_bosstrans_knives_3_bridget_down_pupils, bridget_ind, bridget_pupils_x + _xshake + _bridget_xshake, _yshake + _bridget_yshake, 1, 1, 0, c_white, 1);
        }
    }
    else if (_order[i] == "D")
    {
        draw_sprite_ext(dennis_spr, dennis_ind, dennis_x, dennis_y, 1, 1, 0, c_white, 1);
    }
}

if (keyboard_check(vk_shift))
{
    draw_sprite_ext(spr_bosstrans_knives_3_dennis_stab_UR, dennis_ind, mouse_x, mouse_y, 1, 1, 0, c_white, 0.5);
    
    if (mouse_check_button_pressed(mb_left))
        show_message(string("({0},{1})", mouse_x, mouse_y));
}

surface_reset_target();
_amnt = 24;
var _xshake = shake * random_range(-_amnt, _amnt);
var _yshake = shake * random_range(-_amnt, _amnt);
var _w = 1920;
var _h = 1080;
var _x = 0 + ((_w / 2) * (1 - zoom)) + _xshake;
var _y = 0 + ((_h / 2) * (1 - zoom)) + _yshake;
draw_surface_ext(surf, _x, _y, zoom, zoom, 0, c_white, 1);
scr_draw_transition_gui();
