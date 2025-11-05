collected = true;

if (collectedspr != noone)
{
    image_alpha = 1;
    sprite_index = collectedspr;
    image_index = 0;
}
else
    visible = false;

scr_createparticle(true, x, y, z, choose(spr_collectsparkleeffect1, spr_collectsparkleeffect2), image_xscale, image_yscale, 0, 0.5);

if (saveroom)
    add_saveroom(id, global.respawnroom);

event_replay(soundpath, x, y);
