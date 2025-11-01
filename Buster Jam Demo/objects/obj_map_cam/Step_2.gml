if (!ready)
    exit;

if (global.cutscene_swap)
    exit;

lag = approach(lag, 1, 0.1);

if (instance_exists(follow))
{
    x_follow = easy_smooth(x_follow, follow.x, lag);
    y_follow = easy_smooth(y_follow, follow.y, lag);
    z_follow = easy_smooth(z_follow, follow.z, lag);
    y_follow = (follow.y - 72) + follow.z;
    
    if (x_follow < (x - (x_radius / 2)))
        x = x_follow + (x_radius / 2);
    
    if (x_follow > (x + (x_radius / 2)))
        x = x_follow - (x_radius / 2);
    
    if (y_follow < (y - (y_radius / 2)))
        y = y_follow + (y_radius / 2);
    
    if (y_follow > (y + (y_radius / 2)))
        y = y_follow - (y_radius / 2);
    
    if (instant)
    {
        y = y_follow - (y_radius / 2);
        instant = false;
    }
}

for (var i = 0; i < 4; i++)
{
    if (!instance_exists(follow))
        break;
    
    var _spd = 0;
    var _done = false;
    
    if (is_array(myclamp_dir[i]) && array_contains(myclamp_dir[i], 3) && array_contains(myclamp_dir[i], 2) && obj_map_player.hspd != 0)
    {
        _spd = abs(obj_map_player.x - obj_map_player.xprevious);
        _done = true;
    }
    
    var _player_climbup = false;
    
    if (obj_map_player.state == obj_map_player.state_climb && obj_map_player.zspd < 0)
        _player_climbup = true;
    
    var _player_climbdown = false;
    
    if (obj_map_player.state == obj_map_player.state_climb && obj_map_player.zspd > 0)
        _player_climbdown = true;
    
    if ((myclamp_dir[i] == 1 && (obj_map_player.vspd > 0 || _player_climbdown)) || (myclamp_dir[i] == 0 && (obj_map_player.vspd < 0 || _player_climbup)) || ((myclamp_dir[i] == 5 && (obj_map_player.vspd != 0 || _player_climbup || _player_climbdown)) && !_done))
    {
        if ((myclamp_dir[i] == 5 && (_player_climbup || _player_climbdown)) || (myclamp_dir[i] == 0 && _player_climbup) || (myclamp_dir[i] == 1 && _player_climbdown))
            _spd = abs(obj_map_player.z - obj_map_player.zprevious);
        else
            _spd = abs(obj_map_player.y - obj_map_player.yprevious);
        
        _done = true;
    }
    
    if (((myclamp_dir[i] == 3 && obj_map_player.hspd < 0) || (myclamp_dir[i] == 2 && obj_map_player.hspd > 0)) || ((myclamp_dir[i] == 4 && obj_map_player.hspd != 0) && !_done))
    {
        _spd = abs(obj_map_player.x - obj_map_player.xprevious);
        _done = true;
    }
    
    if (((i == 3 || i == 2) && (myclamp_dir[i] == 0 || myclamp_dir[i] == 1 || myclamp_dir[i] == 5)) || ((i == 0 || i == 1) && (myclamp_dir[i] == 3 || myclamp_dir[i] == 2 || myclamp_dir[i] == 4)))
        _spd *= 0.5;
    else
        _spd *= 1.5;
    
    myclamp[i] = approach(myclamp[i], myclamp_to[i], _spd);
}

x = clamp(x, myclamp[3] + 960, myclamp[2] - 960);
y = clamp(y, myclamp[0] + 540, myclamp[1] - 540);
var _shakeX = irandom_range(-global.screen_shake[0], global.screen_shake[0]);
var _shakeY = irandom_range(-global.screen_shake[1], global.screen_shake[1]);

if (lag == 1)
{
    x = floor(x);
    y = floor(y);
}

if (global.cam_follow == id)
    camera_set_view_pos(view_camera[0], (x - 960) + _shakeX, (y - 540) + _shakeY);

my_cam_x = x - 960;
my_cam_y = y - 540;
var _left = camera_get_view_x(view_camera[0]) - 128;
var _top = camera_get_view_y(view_camera[0]) - 128;
var _width = camera_get_view_width(view_camera[0]) + 256;
var _height = camera_get_view_height(view_camera[0]) + 256;
instance_activate_region(_left, _top, _width, _height, true);
