draw_set_font(global.toonfont);
draw_set_colour(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var _sp = world_to_screen(x, y, z, obj_drawcontroller.viewMat, obj_drawcontroller.projMat, true);

if (_sp != undefined)
    __draw_text_transformed_hook(_sp[0], _sp[1], string_concat(global.destroyedcount, "/", global.cratecount), 1, 1, 0);
