event_play_oneshot("event:/SFX/player/parry", x, y);

with (other.id)
{
    if (object_index == obj_snowMintProjectile)
    {
        bumpcount++;
        var _dir = sign(image_xscale);
        
        if (x != other.x)
            _dir = sign(x - other.x);
        
        image_xscale = _dir;
    }
}

with (obj_parent_baddie)
{
    if (distance_to_object(other.id) < 64 && (object_index != obj_charcherryOLD || (object_index == obj_charcherryOLD && state == UnknownEnum.Value_14)))
    {
        scr_sleep();
        hsp = obj_parent_player.xscale * 25;
        vsp = 0;
        grav = 0;
        hp = 0;
        thrown = 1;
        markedForDeath = true;
        state = UnknownEnum.Value_5;
        sprite_index = baddieSpriteDead;
        eliteHP = 0;
    }
}

with (obj_parent_player)
{
    state = UnknownEnum.Value_92;
    sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
    image_index = 0;
    movespeed = -8;
    flash = true;
    create_particle(x, y, spr_parryeffect);
}
