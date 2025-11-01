testvariablenothing = false;
render_layer = 0;
touching = false;
z = 0;
alarm[0] = 1;
my_solid = -4;
starts = {};
interactions = 0;
scene[0] = "Dialogue/unused/test.json";
fade_textbox_out = true;

event_interact = function()
{
    var _start = -4;
    var _str = string("_{0}", interactions);
    
    if (struct_exists(starts, _str))
        _start = struct_get(starts, _str);
    
    var _scene = scene_create(scene[interactions], _start, fade_textbox_out);
    _scene.my_interact = id;
    
    if (interactions < (array_length(scene) - 1))
        interactions++;
    
    if (instance_exists(my_character))
    {
    }
};

ready = false;
my_character = -4;
events = {};
textbox_node_ID = -4;

event_textbox_event = function()
{
    var _str = string("_{0}", textbox_node_ID);
    
    if (is_real(textbox_node_ID) && textbox_node_ID >= 0 && struct_exists(events, _str))
    {
        var _func = struct_get(events, _str);
        _func();
    }
};

event_end = function()
{
};
