if (game_paused())
{
    image_index -= image_speed;
    exit;
}

x = lerp(x, (obj_player.image_xscale == 1) ? (obj_player.x - 64) : (obj_player.x + 64), 0.05);
y = lerp(y, obj_player.y - 16, 0.05);
image_xscale = -sign(x - obj_player.x);

if (obj_player.state != states.mirror)
{
    z = lerp(z, obj_player.z + 3, 0.05);
    
    if (obj_player.hp > 1)
        visible = obj_player.visible;
    
    if (obj_player.state == states.actor)
        visible = false;
    
    if (obj_player.hp <= 1)
    {
        if (visible)
        {
            var _id = instance_create_depth(x, y, z, obj_deadenemy);
            scr_fmod_soundeffectONESHOT("event:/sfx/player/voice/heartdie", x, y);
            
            with (_id)
            {
                sprite_index = spr_heartdead;
                hsp = irandom_range(2, 6) * image_xscale;
                vsp = irandom_range(-12, -6);
                zsp = irandom_range(3, -3);
                
                if (wall_behind(other.x, other.y, other.z))
                    zsp = -abs(zsp);
            }
        }
        
        visible = false;
    }
}

curpalette = obj_player.hp > 2;
