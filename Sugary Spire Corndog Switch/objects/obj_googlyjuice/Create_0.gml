event_inherited();

spawnBaddieDeadParticle = function()
{
    var i = 0;
    
    repeat (10)
    {
        with (instance_create(x, y, obj_juiceDebris))
        {
            paletteSprite = other.paletteSprite;
            paletteSelect = other.paletteSelect;
            image_speed = 0;
            sprite_index = spr_juicedebris;
            image_index = i;
        }
        
        i++;
    }
};

grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 1;
state = UnknownEnum.Value_4;
baddieStunTimer = 0;
alarm[0] = 150;
canRoam = true;
flying = 0;
straightthrow = 0;
thrown = 0;
reset = 0;
flash = false;
baddieSpriteIdle = spr_juicestun;
baddieSpriteStun = spr_juicestun;
baddieSpriteWalk = spr_juicewalk;
baddieSpriteTurn = spr_juicewalk;
baddieSpriteGrabbed = spr_juicestun;
baddieSpriteScared = spr_juicescared;
baddieSpriteDead = spr_juicedead;
hp = 10;
slapped = 0;
grounded = true;
birdCreated = 0;
boundbox = 0;
spr_throw = spr_juice_rage;
throw_frame = 10;
bombreset = 1;
paletteSprite = spr_juicePalette;

switch (global.levelname)
{
    case "entryway":
        paletteSelect = 1;
        break;
    
    default:
        paletteSelect = 2;
        break;
    
    case "molasses":
        paletteSelect = 3;
        break;
    
    case "mines":
        paletteSelect = 4;
        break;
    
    case "fudge":
        paletteSelect = 5;
        break;
    
    case "dance":
        paletteSelect = 6;
        break;
}
