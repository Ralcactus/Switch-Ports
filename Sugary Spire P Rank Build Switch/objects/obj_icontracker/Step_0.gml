if (!instance_exists(target))
{
    instance_destroy();
    exit;
}

var w = sprite_width / 2;
var h = sprite_height / 2;
x = clamp(target.x, camx + w, (camx + camw) - w);
y = clamp(target.y, camy + h, (camy + camh) - h);
var bbox_in_cam = false;

with (target)
    bbox_in_cam = bbox_in_camera(view_camera[0]);

visible = !bbox_in_cam;

if (visible_cond != noone && !bbox_in_cam)
    visible = visible_cond();
