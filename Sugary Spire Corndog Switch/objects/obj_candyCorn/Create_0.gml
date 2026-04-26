event_inherited();
depth = 0;
grav = 0.5;
hsp = 0;
vsp = 0;
state = UnknownEnum.Value_23;
baddieStunTimer = 0;
canRoam = true;
flying = 0;
straightthrow = 1;
thrown = 0;
reset = 0;
hp = 1;
hitboxcreate = 0;
grounded = 1;
baddieCollisionBoxEnabled = false;

spawnBaddieDeadParticle = function()
{
    instance_create(x, y, obj_snowpoofeffect, 
    {
        image_xscale: image_xscale
    });
};

baddieSpriteIdle = spr_executionerThrowIdle;
baddieSpriteStun = spr_candyCornStun;
baddieSpriteGrabbed = spr_candyCornStun;
baddieSpriteDead = spr_candyCornDeath;
sprite_index = spr_candyCornIntro;
introTriggered = false;
punchCooldown = 0;
flash = false;
slapped = 0;
birdCreated = 0;
boundbox = 0;

faceTowardsPlayerFunc = function()
{
    var target_player = instance_nearest(x, y, obj_parent_player);
    image_xscale = sign(target_player.x - x);
    
    if (image_xscale == 0)
        image_xscale = target_player.image_xscale;
    
    if (image_xscale == 0)
        image_xscale = 1;
};

image_speed = 0.35;
