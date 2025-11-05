scr_collide();

if (sprite_index == spr_flyguy_idle)
{
    if (obj_player.x != x)
        image_xscale = -sign(x - obj_player.x);
    
    cooldown--;
    timesshot = 0;
    grav = 0.5;
    
    if (check_in_rect(obj_player, x - 300, x + 300, y - 40, y + 40) && cooldown <= 0 && player_collideable())
    {
        vsp = -6;
        sprite_index = spr_flyguy_flystart;
        image_index = 0;
        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/flyguyjump", x, y);
    }
}

if (sprite_index == spr_flyguy_flystart)
{
    grav = 0.25;
    cooldown = 20;
    timesshot = 0;
    
    if (vsp >= 0)
    {
        sprite_index = spr_flyguy_shoot;
        image_index = 0;
    }
    
    if (vsp >= 0 && grounded)
    {
        sprite_index = spr_flyguy_idle;
        image_speed = 0.35;
    }
}

if (sprite_index == spr_flyguy_shoot)
{
    grav = 0.4;
    cooldown = 20;
    
    if (floor(image_index) == 3 && vsp >= 0)
    {
        if (timesshot < 3)
        {
            timesshot++;
            vsp = -2;
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/flyguyshoot", x, y);
            
            with (instance_create_depth(x + (58 * image_xscale), y + 19, depth, obj_flyguy_bullet))
            {
                hsp = 4 * other.image_xscale;
                image_xscale = other.image_xscale;
                parent = other.id;
            }
        }
    }
    
    if (timesshot >= 3 && sprite_animation_end())
        image_speed = 0;
    
    if (vsp >= 0 && grounded)
    {
        sprite_index = spr_flyguy_idle;
        image_speed = 0.35;
    }
}
