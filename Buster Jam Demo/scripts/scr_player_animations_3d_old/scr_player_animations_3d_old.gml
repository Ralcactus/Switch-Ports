function scr_player_animations_3d_old()
{
    var _spr = anim_sprite;
    var _dir = floor(dir / 45) * 45;
    
    if (state != state_climb)
        anim_speed = 1;
    
    if (action == action_spin)
    {
        if (_dir == 270)
        {
            anim_sprite = spr_buster_spin_d;
        }
        else if (_dir == 0 || _dir == 180)
        {
            anim_sprite = spr_buster_spin_r;
            
            if (_dir == 0)
                facing = 1;
            else
                facing = -1;
        }
        else if (_dir == 90)
        {
            anim_sprite = spr_buster_spin_u;
        }
        else if (_dir == 45 || _dir == 135)
        {
            if (_dir == 135)
                facing = -1;
            else
                facing = 1;
            
            anim_sprite = spr_buster_spin_ur;
        }
        else
        {
            if (_dir == 225)
                facing = -1;
            else
                facing = 1;
            
            anim_sprite = spr_buster_spin_dr;
        }
    }
    else if (state == state_free)
    {
        if (_dir == 270)
        {
            if (hspd != 0 || vspd != 0)
                anim_sprite = sprite_down_walk;
            else
                anim_sprite = sprite_down;
            
            facing = 1;
        }
        else if (_dir == 315 || _dir == 225)
        {
            if (hspd != 0 || vspd != 0)
                anim_sprite = sprite_downright_walk;
            else
                anim_sprite = sprite_downright;
            
            if (_dir == 315)
                facing = 1;
            else
                facing = -1;
        }
        else if (_dir == 0 || _dir == 180)
        {
            if (hspd != 0 || vspd != 0)
                anim_sprite = sprite_right_walk;
            else
                anim_sprite = sprite_right;
            
            if (_dir == 0)
                facing = 1;
            else
                facing = -1;
        }
        else if (_dir == 45 || _dir == 135)
        {
            if (hspd != 0 || vspd != 0)
                anim_sprite = sprite_upright_walk;
            else
                anim_sprite = sprite_upright;
            
            if (_dir == 45)
                facing = 1;
            else
                facing = -1;
        }
        else if (_dir == 90)
        {
            if (hspd != 0 || vspd != 0)
                anim_sprite = sprite_up_walk;
            else
                anim_sprite = sprite_up;
            
            facing = 1;
        }
    }
    else if (state == state_climb)
    {
        anim_play(sprite_up_walk);
        
        if (zspd == 0)
            anim_speed = 0;
        else
            anim_speed = 1;
    }
    
    if (anim_sprite != _spr)
    {
        if ((_spr == spr_buster_d || _spr == spr_buster_dr || _spr == spr_buster_r || _spr == spr_buster_u || _spr == spr_buster_ur) && (anim_sprite == spr_buster_d_walk || anim_sprite == spr_buster_dr_walk || anim_sprite == spr_buster_r_walk || anim_sprite == spr_buster_u_walk || anim_sprite == spr_buster_ur_walk))
            anim_index = 0;
    }
}
