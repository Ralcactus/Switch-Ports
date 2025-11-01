var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

if (touching)
{
    var _x = x + 64;
    draw_sprite(spr_npc_talk, 0, _x - _camx, (bbox_bottom + 24 + z) - _camy);
}
