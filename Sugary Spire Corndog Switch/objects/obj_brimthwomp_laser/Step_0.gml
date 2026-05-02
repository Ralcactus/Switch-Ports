if (targetID != -4 && instance_exists(targetID))
{
    x = targetID.x;
    y = targetID.y + (32 * targetID.image_yscale);
}

if (blastTimer > 0)
{
    blastTimer--;
}
else if (image_alpha == 1)
{
    if (!blasted)
    {
        alarm[0] = blastDuration;
        blasted = true;
    }
    
    if (image_xscale < 1)
        image_xscale = min(image_xscale + 0.25, 1);
}

if (fadeout)
{
    image_xscale -= 0.25;
    
    if (image_alpha > 0)
        image_alpha -= 0.35;
    else
        instance_destroy();
}

if (abs(savedYscale) < 15)
    savedYscale *= 1.05;

image_yscale = savedYscale;
var hit_valid_solid = false;
var solids_list = ds_list_create();
instance_place_list(x, y, obj_solid, solids_list, false);
var nearest_solid_y = (sign(savedYscale) == 1) ? infinity : -infinity;

for (var i = 0; i < ds_list_size(solids_list); i++)
{
    if (ds_list_find_value(solids_list, i).object_index != obj_metalblock)
    {
        hit_valid_solid = true;
        
        if ((ds_list_find_value(solids_list, i).y < nearest_solid_y && sign(savedYscale) == 1) || ((ds_list_find_value(solids_list, i).y + ds_list_find_value(solids_list, i).sprite_height) > nearest_solid_y && sign(savedYscale) == -1))
        {
            nearest_solid_y = ds_list_find_value(solids_list, i).y;
            
            if (sign(savedYscale) == -1)
                nearest_solid_y += ds_list_find_value(solids_list, i).sprite_height;
        }
    }
}

ds_list_clear(solids_list);
instance_place_list(x, y, obj_platform, solids_list, false);

for (var i = 0; i < ds_list_size(solids_list); i++)
{
    hit_valid_solid = true;
    
    if (ds_list_find_value(solids_list, i).y < nearest_solid_y && sign(savedYscale) == 1)
    {
        nearest_solid_y = ds_list_find_value(solids_list, i).y;
        
        if (sign(savedYscale) == -1)
            nearest_solid_y += ds_list_find_value(solids_list, i).sprite_height;
    }
}

ds_list_destroy(solids_list);

var _spr_h = sprite_get_height(sprite_index);

if (hit_valid_solid && _spr_h > 0 && nearest_solid_y != infinity && nearest_solid_y != -infinity)
{
    image_yscale = (abs(nearest_solid_y - y) / _spr_h) * sign(savedYscale);
}
else
{
    image_yscale = savedYscale;
}

if (savedYscale != savedYscale || savedYscale == 0)
    savedYscale = 1;

if (image_yscale != image_yscale || image_yscale == 0)
    image_yscale = 0.01 * sign(savedYscale);