if (exit_freeze())
    exit;

x += hspd;
y += vspd;

if (mypath == -4)
    item_yoff = 0;
else
    item_yoff = ds_map_find_value(global.map_path_yoffs, object_get_name(myInst));

if (landYobj != -4)
    landY = (landYobj.y + item_yoff) - 2;

if (y >= (landY + item_yoff))
{
    y = landY + item_yoff;
    
    if (myInst != -4)
    {
        var _inst = instance_create_layer(x, landY + item_yoff, "Instances", myInst);
        
        if (mypath == -4)
        {
            if (myInst == obj_dynalife)
            {
                if (!place_meeting(x, y + 4, obj_movingsemi))
                {
                    _inst.vspd = -12;
                    _inst.landY = landY;
                }
                else
                {
                    var _platform = instance_place(x, y + 4, obj_movingsemi);
                    _inst.landYobj = _platform;
                }
            }
            
            part_particles_create(global.part_over, x, y - 32, global.particles.smoke, 1);
        }
        else
        {
            _inst.mypath = mypath;
            _inst.path_pos = path_pos;
        }
    }
    
    var _life = 240;
    var _subs = 13;
    
    for (var i = 0; i < _subs; i++)
    {
        var _ptype1 = part_type_create();
        var _spd = irandom_range(7, 12);
        var _dir, _y;
        
        if (i == 12)
        {
            _dir = 90;
            _y = y - 47.5;
            part_type_orientation(_ptype1, 0, 0, choose(1, 2, -1, -2), 0, false);
        }
        else
        {
            _y = y - 47.5 - irandom_range(0, -92);
            _dir = irandom_range(50, 130);
            part_type_orientation(_ptype1, -20, 20, choose(1, 2, -1, -2), 0, false);
        }
        
        part_type_sprite(_ptype1, spr_barrel_shards, false, false, false);
        part_type_speed(_ptype1, _spd, _spd, 0, 0);
        part_type_direction(_ptype1, _dir, _dir, 0, 0);
        part_type_gravity(_ptype1, 0.7, 270);
        part_type_life(_ptype1, _life, _life);
        part_type_subimage(_ptype1, i);
        part_particles_create(global.part_over, x, _y, _ptype1, 1);
        ds_map_add(global.map_particles, _ptype1, _life);
    }
    
    audio_play_sound(snd_break_barrel, 0, 0);
    screen_shake(8, 8);
    instance_destroy();
}
