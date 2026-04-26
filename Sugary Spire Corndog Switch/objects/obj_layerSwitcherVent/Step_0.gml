if (!place_meeting(x, y - 1, obj_parent_player))
    exit;

with (obj_parent_player)
{
    if (place_meeting(x, y + 1, other.id))
    {
        inBackgroundLayer = !inBackgroundLayer;
        var x_offset = inBackgroundLayer ? (-camera_get_view_x(view_camera[0]) * 0.05) : (camera_get_view_x(view_camera[0]) * 0.05);
        var y_offset = inBackgroundLayer ? -global.BgInstanceLayerOffset : global.BgInstanceLayerOffset;
        x += x_offset;
        y += y_offset;
        xprevious += x_offset;
        yprevious += y_offset;
        vsp = -12;
        jumpStop = true;
    }
}
