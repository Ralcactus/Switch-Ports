event_inherited();
image_speed = 0;
angle = 0;
hspd = random_range(-10, 10);
vspd = random_range(-15, -21);
grav = 1;
my_barrier = -4;

event_floor = function()
{
    if (bounced)
    {
        var _inst = instance_create_micro(x, y, layer, obj_micro_monstertruck_shard_onground);
        _inst.sprite_index = sprite_index;
        _inst.image_index = image_index;
        _inst.image_speed = 0;
        _inst.hspd = hspd;
        _inst.angle = angle;
        instance_destroy();
    }
    else if (!bounced)
    {
        vspd = -vspd * 0.4;
        bounced = true;
        y--;
    }
};

bounced = false;
