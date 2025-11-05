var _scale = 1000;
lighting_set(0, -1, -1);
draw_model("TitleGROUND", room_width / 2, room_height / 2, 0, -_scale, -_scale, _scale, 0, 180, 0);
lighting_end();
var _housescale = -sin(housestretch);
lighting_set(0, -1, -1, undefined, undefined, undefined, undefined, true);
draw_model("TitleHOUSE", (room_width / 2) + (-0.452861 * _scale), (room_height / 2) + (-0.234361 * -_scale), 2.23182 * _scale, -_scale / (1 + (_housescale / 4)), -_scale * (1 + (_housescale / 2)), _scale, 0, 180, 0);
lighting_end();
