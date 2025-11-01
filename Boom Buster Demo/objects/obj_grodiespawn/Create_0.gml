anim_init();
xscale = 1;
yscale = 1;
percent_scale = 0;
flash_alpha = 0;
shake = 0;
xshake = 0;
yshake = 0;
star_count = 8;
set = false;
xoff = 0;
yoff = 0;
timer[0] = 150;

timer_func[0] = function()
{
    var _rotoffset = irandom_range(0, 360);
    var _x = x;
    var _y = y - 44;
    
    for (var i = 0; i < star_count; i++)
    {
        var _angle = ((360 / star_count) * i) + _rotoffset;
        var _part = part_type_create();
        part_type_sprite_simple(_part, spr_fx_starflash);
        part_type_direction(_part, _angle, _angle, 0.5, 0);
        part_type_speed(_part, 12, 12, -0.55, 0);
        part_particles_create(global.part_over, _x, _y, _part, 1);
        ds_map_add(global.map_particles, _part, 120);
    }
    
    var _enemy = instance_create_layer(x, y, "Instances", asset_get_index(enemy));
    _enemy.facing = facing;
    _enemy.mypath = mypath;
    _enemy.path_pos = path_pos;
    visible = false;
    instance_destroy();
};

timer[1] = 90;

timer_func[1] = function()
{
    flash_alpha = 0.8;
    shake = 8 - (4 * (timer[0] / 60));
    
    if (visible)
        timer[1] = 10;
};

image_alpha = 0.3;
