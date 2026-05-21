if (type == "Fragile")
    grabbedspr = spr_iceblock_fragile;

if (type == "Heavy")
{
    grabbedspr = spr_iceblock_heavy;
    grav2 = 0.7;
}

if (room == sucrose_6 || room == sucrose_6_1 || room == sucrose_7 || room == sucrose_8)
{
    color_index = 1;
    color = 
    {
        light: #264d72,
        dark: #000000
    };
}

if (content != noone)
{
    contentspr = object_get_sprite(content);
    
    if (contentspr == spr_bigcollect1P)
        contentspr = choose(spr_bigcollect1P, spr_bigcollect2P, spr_bigcollect3P, spr_bigcollect4P, spr_bigcollect5P, spr_bigcollect6P);
}

if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy();
