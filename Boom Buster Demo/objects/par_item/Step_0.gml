if (exit_freeze())
    exit;

anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;

if (mypath != -4 && !on_path)
{
    has_collision = false;
    on_path = true;
    grav = 0;
    hspd = 0;
    vspd = 0;
}

path_follow();

if (landYobj != -4)
    landY = landYobj.y - 2;

if (y < landY)
    has_collision = false;
else
    landed = true;

if (mypath == -4 && vspd == 0 && y >= landY && !solid_meeting(x, y, obj_solid))
{
    has_collision = true;
    landY = -999;
    landYobj = -4;
}

physics_apply();

if (vspd > 20)
    vspd = 20;

var _player = instance_place(x, y, obj_player);

if (_player && !collected)
{
    collected = true;
    mypath = -4;
    on_path = false;
    hspd = 0;
    vspd = 0;
    myPlayer = _player;
    event_user(0);
    collected = true;
}

if (!collected)
{
    timer_logic(0);
    timer_logic(1);
    
    if (timer[0] <= 150)
    {
        if (timer[1] == -1)
            timer[1] = 4;
        
        if (flicker)
            image_alpha = 0.9;
        else
            image_alpha = 0.3;
    }
}
else
{
    image_alpha = 1;
}

if (collected)
    has_collision = false;

timer_logic(2);
