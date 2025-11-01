layer = layer_get_id("Instances");
physics_init();

event_floor = function()
{
    var _vspd = vspd;
    
    if (_vspd >= 2)
        vspd = -_vspd * 0.2;
    else
        vspd = 0;
};

shard_x[0] = 39;
shard_y[0] = 144;
shard_x[1] = 140;
shard_y[1] = 139;
shard_x[2] = 117;
shard_y[2] = 69;
shard_x[3] = 163;
shard_y[3] = 58;
shard_x[4] = 150;
shard_y[4] = 80;
shard_x[5] = 80;
shard_y[5] = 99;
shard_x[6] = 40;
shard_y[6] = 40;
shard_y[7] = 60;
shard_y[7] = 50;
shard_x[8] = 20;
shard_y[8] = 70;

event_break = function()
{
    if (!instance_exists(obj_cutout_wizard))
    {
        with (obj_controls)
            out = true;
        
        with (obj_controller)
            event_user(0);
    }
};
