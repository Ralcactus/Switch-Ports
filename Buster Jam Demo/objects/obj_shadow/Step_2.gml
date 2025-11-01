if (!instance_exists(follow))
{
    instance_destroy();
    exit;
}

event_inherited();
x = follow.x;
y = (follow.bbox_bottom + z) - 3;
render_layer = follow.render_layer;
scale = max(0.5, 1 - ((z - follow.z) * 0.005));

if (out)
    image_alpha = approach(image_alpha, 0, 0.1);
else if (follow.z == z || follow.grounded)
    image_alpha = approach(image_alpha, 0, 0.5);
else
    image_alpha = 1;

if (render_layer == 0)
    depth = layer_get_depth("Instances_Render0") + 1;
else if (render_layer == 1)
    depth = layer_get_depth("Instances_Render1") + 1;

if (!scale_out)
{
    scale = scale_size;
    
    if (!out)
        image_alpha = 0.425;
}
