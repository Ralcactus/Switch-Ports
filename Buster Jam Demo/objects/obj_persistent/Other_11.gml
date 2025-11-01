var _profile = "keyboard_and_mouse";
var _alt = 0;

if (global.keyboard == 0)
{
    input_binding_set("left", input_binding_key(37), 0, _alt, _profile);
    input_binding_set("up", input_binding_key(38), 0, _alt, _profile);
    input_binding_set("right", input_binding_key(39), _alt, undefined, _profile);
    input_binding_set("down", input_binding_key(40), 0, _alt, _profile);
    input_binding_set("jump", input_binding_key(90), 0, _alt, _profile);
    input_binding_set("action", input_binding_key(88), _alt, undefined, _profile);
    input_binding_set("menu_extra", input_binding_key(67), _alt, undefined, _profile);
    input_binding_set("left_free", input_binding_key(37), 0, _alt, _profile);
    input_binding_set("up_free", input_binding_key(38), 0, _alt, _profile);
    input_binding_set("right_free", input_binding_key(39), _alt, undefined, _profile);
    input_binding_set("down_free", input_binding_key(40), 0, _alt, _profile);
    input_binding_set("left_strict", input_binding_key(37), 0, _alt, _profile);
    input_binding_set("up_strict", input_binding_key(38), 0, _alt, _profile);
    input_binding_set("right_strict", input_binding_key(39), _alt, undefined, _profile);
    input_binding_set("down_strict", input_binding_key(40), 0, _alt, _profile);
}
else
{
    input_binding_set("left", input_binding_key(65), 0, _alt, _profile);
    input_binding_set("up", input_binding_key(87), 0, _alt, _profile);
    input_binding_set("right", input_binding_key(68), 0, _alt, _profile);
    input_binding_set("down", input_binding_key(83), 0, _alt, _profile);
    input_binding_set("jump", input_binding_key(74), 0, _alt, _profile);
    input_binding_set("action", input_binding_key(75), 0, _alt, _profile);
    input_binding_set("left_free", input_binding_key(65), 0, _alt, _profile);
    input_binding_set("up_free", input_binding_key(87), 0, _alt, _profile);
    input_binding_set("right_free", input_binding_key(68), 0, _alt, _profile);
    input_binding_set("down_free", input_binding_key(83), 0, _alt, _profile);
    input_binding_set("left_strict", input_binding_key(65), 0, _alt, _profile);
    input_binding_set("up_strict", input_binding_key(87), 0, _alt, _profile);
    input_binding_set("right_strict", input_binding_key(68), 0, _alt, _profile);
    input_binding_set("down_strict", input_binding_key(83), 0, _alt, _profile);
    input_binding_set("menu_extra", input_binding_key(76), _alt, undefined, _profile);
}
