event_inherited();
grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 4;
state = UnknownEnum.Value_1;
baddieStunTimer = 0;
alarm[0] = 150;
canRoam = true;
flying = 0;
straightthrow = 0;
thrown = 0;
reset = 0;
flash = false;
baddieSpriteIdle = spr_bigcherrystun;
baddieSpriteStun = spr_bigcherrystun;
baddieSpriteWalk = spr_bigcherry;
baddieSpriteTurn = spr_bigcherry;
baddieSpriteGrabbed = spr_bigcherrystun;
baddieSpriteScared = spr_bigcherrythrown;
baddieSpriteDead = spr_bigcherrythrown;
debris = false;
hp = 10;
slapped = 0;
grounded = 1;
birdCreated = 0;
boundbox = 0;
idletimer = 200;
movespeedmax = 20;

spawnBaddieDeadParticle = function()
{
    if (thrown)
    {
        with (instance_create(x, y, obj_baddieDead))
        {
            canrotate = true;
            image_xscale = other.image_xscale;
            image_blend = other.image_blend;
            sprite_index = other.baddieSpriteDead;
            paletteSprite = other.paletteSprite;
            paletteSelect = other.paletteSelect;
        }
    }
};
