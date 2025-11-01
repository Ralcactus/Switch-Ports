follow = obj_map_player;
y_radius = 154;
z = 0;
x_follow = 0;
y_follow = 0;
z_follow = 0;

if (instance_exists(follow))
{
    x_follow = follow.x;
    y_follow = follow.y;
    z_follow = follow.z;
    x = x_follow;
    y = y_follow;
    z = z_follow;
}

x_radius = 107;
ready = true;
