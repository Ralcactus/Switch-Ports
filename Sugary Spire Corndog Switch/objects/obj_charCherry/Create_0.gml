event_inherited();
grav = 0.5;
countdown = 100;
hsp = 0;
vsp = 0;
movespeed = 1;
state = UnknownEnum.Value_13;
baddieStunTimer = 0;
alarm[0] = 150;
canRoam = true;
flying = 0;
straightthrow = 0;
thrown = 0;
reset = 0;
flash = false;
momentum = 0;
baddieSpriteIdle = spr_charcherry_popout;
baddieSpriteStun = spr_charcherry_stun;
baddieSpriteWalk = spr_charcherry_run;
baddieSpriteTurn = spr_charcherry_run;
baddieSpriteGrabbed = spr_charcherry_stun;
baddieSpriteScared = spr_charcherry_stun;
baddieSpriteDead = spr_charcherry_dead;

spawnBaddieDeadParticle = function()
{
    if (state == UnknownEnum.Value_14)
        instance_create(x, y, obj_bombExplosionHarmful);
    else
        instance_create(x, y, obj_bombExplosionHarmless);
};

hp = 1;
slapped = 0;
grounded = 1;
birdCreated = 0;
boundbox = 0;
slide = 0;
