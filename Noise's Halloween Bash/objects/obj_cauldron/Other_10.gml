scr_collide();
event_set_3d_position(chasesnd, x, y);
event_set_3d_position(throwsnd, x, y);

if (!chasing)
{
    if (event_isplaying(chasesnd))
        event_stop(chasesnd, false);
    
    sprite_index = spr_cauldron_idle;
    shoottimer = 70;
    shot = false;
    hsp = approach(hsp, 0, 0.25);
    
    if (check_in_rect(obj_player, x - (200 + (100 * (image_xscale == -1))), x + (200 + (100 * (image_xscale == 1))), y - 200, y + 100) && player_collideable())
        chasing = true;
}
else
{
    if (!event_isplaying(chasesnd))
        scr_fmod_soundeffect(chasesnd, x, y);
    
    hit_horizontal = function(_h)
    {
        if (scr_destroy_horizontal(_h, obj_destroyablenitro))
            exit;
        
        vsp = -6;
        hsp = -3 * _h;
    };
    
    if (obj_player.x != x)
        image_xscale = -sign(x - obj_player.x);
    
    if (sprite_index != spr_cauldron_shootprep && sprite_index != spr_cauldron_shootdiagonal && sprite_index != spr_cauldron_shootup)
    {
        hsp = approach(hsp, image_xscale * 4, 0.1);
        shot = false;
        sprite_index = spr_cauldron_run;
        
        if ((!check_in_rect(obj_player, x - 400, x + 400, y - 400, y + 100) && grounded && vsp >= 0) || !player_collideable())
            chasing = false;
        
        if (distance_to_object(obj_player) > 100 && (floor(obj_player.y - y) == 0 || obj_player.y < y))
        {
            shoottimer--;
            
            if (shoottimer <= 0)
            {
                scr_fmod_soundeffect(throwsnd, x, y);
                shoottimer = 70;
                sprite_index = spr_cauldron_shootprep;
                image_index = 0;
            }
        }
    }
    else
    {
        if (event_isplaying(chasesnd))
            event_stop(chasesnd, false);
        
        hsp = approach(hsp, 0, 0.25);
        
        if (sprite_animation_end() && sprite_index == spr_cauldron_shootprep)
        {
            event_stop(throwsnd, false);
            var _gootraj = calculate_projectile_motion(x, y - 10, obj_player.x, obj_player.y, 0.5, floor(max(10, distance_to_object(obj_player) / 8)));
            
            if (abs(_gootraj.hsp) > 7)
                sprite_index = spr_cauldron_shootdiagonal;
            else
                sprite_index = spr_cauldron_shootup;
            
            image_index = 0;
            
            with (instance_create_depth(x, y - 10, depth + 2, obj_cauldron_goo))
            {
                hsp = _gootraj.hsp;
                vsp = _gootraj.vsp;
                parent = other.id;
            }
        }
        
        if (sprite_animation_end() && sprite_index != spr_cauldron_shootprep)
            sprite_index = spr_cauldron_idle;
    }
}
