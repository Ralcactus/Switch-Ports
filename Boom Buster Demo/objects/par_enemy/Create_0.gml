anim_init();
facing = 1;
facing_lock = false;
dies_on_spikes = true;
path_init();
path_lock_timer = -1;
eyes_sprite = -4;
eyelids_sprite = -4;
eyes_xoff = 0;
eyes_yoff = 0;
eyes_lenX = 6;
eyes_lenY = 6;
eyes_lenY_min = -999;
eyes_lenY_max = -999;
eyes_lenY_min = -999;
eyes_lenY_max = -999;

get_eyes = function()
{
    var _y = y - 42;
    eX1 = x - (52 * facing);
    eY1 = _y - 316;
    eX2 = x + (396 * facing);
    eY2 = _y + 360;
};

invincible = false;
stompable = true;
spinnable = true;
can_die_stomp = true;
can_die_spin = true;
walkspd = 2;
alarm[0] = 1;
ledge_turn = false;
mask_normal = mask_index;
mask_hurt = -4;
sprite_turn = -4;
sprite_move = sprite_index;
hurt_delay = 0;
hurt_player = -4;
stomped = false;
spun = false;
physics_init();
vspd_max = 16;

event_wall = function()
{
    hspd = -hspd;
};

event_animend_extra = function()
{
};

event_animend = function()
{
    var _anim = anim_sprite;
    
    if (_anim == sprite_turn)
        anim_play(sprite_move);
    
    event_animend_extra();
};

event_ymove = function()
{
    if (vspd < 0 && place_meeting(x, y - 1, obj_player))
    {
        with (obj_player)
        {
            var _enemy = instance_place(x, y + 1, par_enemy);
            
            if (_enemy && _enemy.stompable && y <= (_enemy.bbox_top + 4))
            {
                with (_enemy)
                {
                    hitBy = other;
                    hurt_delay = 10;
                    event_user(0);
                }
                
                event_bounce_enemy();
            }
        }
    }
    
    return true;
};

hspd_bounce = 0;
