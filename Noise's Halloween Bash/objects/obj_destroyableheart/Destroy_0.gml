event_inherited();
scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratedestroy", x + (sprite_width / 2), y + (sprite_height / 2));
crateeffect(#B03000);

if (obj_player.hp == 1)
{
    obj_playerheart.x = x + (sprite_width / 2);
    obj_playerheart.y = y + (sprite_height / 2);
    obj_playerheart.visible = true;
}

scr_fmod_soundeffectONESHOT("event:/sfx/player/heartcollect", x, y);
obj_player.hp++;

if (obj_player.hp > 3)
{
    obj_player.hp = 3;
    
    with (instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), depth + 8, par_collect))
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

combo();
