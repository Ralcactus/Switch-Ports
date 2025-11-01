x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
z += (zspd * global.delta_game_factor);
zspd += (grav * global.delta_game_factor);
anim_logic();
angle -= (facing * 5);

if (z >= (zstart - 30) && zspd > 0)
{
    var _inst = instance_create_layer(x, y + 32, layer, obj_coin);
    _inst.z = z - 128 - 32;
    
    with (_inst)
    {
        zstart = z;
        event_user(0);
        already_got = true;
    }
    
    instance_destroy();
}

grounded = instance_place_3d(x, y, z + 1, obj_solid);
scr_shadow_z();
