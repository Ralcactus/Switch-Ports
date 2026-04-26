player = instance_nearest(x, y, obj_parent_player);
direction = point_direction(x, y, player.x, player.y);
image_angle = direction;
invisFrames = 60;
state = UnknownEnum.Value_0;
riseTimer = 60;
riseTargetXInitial = x;
riseTargetX = x;
riseTargetY = y - 100;
riseXOffsetSign = choose(-1, 1);
angerTimer = 0;
linePosition = -1;
entityToFollow = -4;

spawnBaddieDeadParticle = function()
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
};

baddieSpriteDead = spr_beeswarm_rise;
paletteSprite = spr_gumslimePalette;
paletteSelect = 0;
importantEnemy = false;
escapeEnemy = false;
