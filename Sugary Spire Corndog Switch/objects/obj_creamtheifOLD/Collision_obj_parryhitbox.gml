if (thiefSubstate == 2)
{
    instance_destroy();
    
    with (obj_parent_baddie)
    {
        if (distance_to_object(other.id) < 64 && (object_index != obj_charcherryOLD || (object_index == obj_charcherryOLD && state == UnknownEnum.Value_14)))
            instance_destroy();
    }
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_92;
        sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
        image_index = 0;
        movespeed = -8;
        flash = true;
        
        with (instance_create(x, y, obj_bangEffect))
            sprite_index = spr_parryeffect;
    }
}
