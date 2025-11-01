instances = [];
selected = -1;
surf = -4;
game_width = 1590;
game_height = 876;
object_ignore = [obj_persistent, input_controller_object, obj_micro_editor];
editor_stretch = 350;
layer_selected = "Middle";
window_set_size(1920 + editor_stretch, 1080);
surface_resize(application_surface, 1920 + editor_stretch, 1080);
window_center();

sort_depth = function(arg0, arg1)
{
    var _depth1 = layer_get_depth(layer_get_id(arg0.layer));
    var _depth2 = layer_get_depth(layer_get_id(arg1.layer));
    return _depth2 - _depth1;
};

ID_TOTAL = 0;
multi_select = [];
splash_text = "VERB!";
texture_group = -4;
