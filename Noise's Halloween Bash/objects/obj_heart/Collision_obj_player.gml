if (game_paused() || !player_collideable())
    exit;

if (obj_player.hp == 1)
{
    obj_playerheart.x = x;
    obj_playerheart.y = y;
    obj_playerheart.z = z;
    obj_playerheart.visible = true;
}

scr_fmod_soundeffectONESHOT("event:/sfx/player/heartcollect", x, y);
obj_player.hp++;

if (obj_player.hp > 3)
{
    obj_player.hp = 3;
    
    with (instance_create_depth(x, y, depth, par_collect))
    {
        value = 10;
        splitfactor = 10;
        splittime = 5;
        particlespr = [spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5];
        canmagnetise = false;
        splitsound = "event:/sfx/player/collect";
        saveroom = false;
        event_user(0);
    }
}

instance_destroy();
