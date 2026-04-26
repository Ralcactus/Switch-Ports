depth = 0;
state = UnknownEnum.Value_0;
scr_collision_init();
grav = 0.5;
hitHsp = 0;
hitVsp = 0;
movespeed = 0;
useCollision = true;
paletteSprite = spr_null;
paletteSelect = 0;
baddieInvincibilityBuffer = 0;
baddieScareBuffer = 0;
tauntBuffer = false;
flash = false;
alarm[1] = 3;
tauntBufferEffect = -4;
escapePortalEffect = -4;

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

giveScore = true;
baddieSpriteIdle = spr_gumslime_walk;
baddieSpriteStun = spr_gumslime_stun;
baddieSpriteWalk = spr_gumslime_walk;
baddieSpriteTurn = spr_gumslime_walk;
baddieSpriteGrabbed = spr_gumslime_stun;
baddieSpriteScared = spr_gumslime_scared;
baddieSpriteDead = spr_gumslime_dead;
baddieSpriteRage = spr_gumslime_rage;
throwAntiGrav = false;
weakThrowHit = false;
baddieCollisionBoxEnabled = true;
stompable = true;
grabbable = true;
mach2Bumpable = true;
hasSquashedX = false;
squashValueX = 0;
hasSquashedY = false;
squashValueY = 0;
baddieStunTimer = 0;
jumpedFromBlock = false;
invincibleBaddie = false;
markedForDeath = false;

drawBaddieSprite = function()
{
    var _drawx = x + (46 * squashValueY);
    var _drawy = y + (46 * squashValueX);
    
    if (tauntBuffer || (global.freezeframe && markedForDeath))
    {
        _drawx += irandom_range(-1, 1);
        _drawy += irandom_range(-1, 1);
    }
    
    var _xs = (abs(image_xscale) + squashValueX) * sign(image_xscale);
    var _ys = image_yscale - squashValueX;
    
    if (hasSquashedY)
    {
        _xs = image_yscale - squashValueY;
        _ys = (abs(image_xscale) + squashValueY) * sign(image_xscale);
    }
    
    pal_swap_set(paletteSprite, paletteSelect, false);
    draw_sprite_ext(sprite_index, image_index, _drawx, _drawy, _xs, _ys, image_angle, image_blend, image_alpha);
    pal_swap_reset();
    
    if (flash)
        draw_sprite_ext_flash(sprite_index, image_index, _drawx, _drawy, _xs, _ys, image_angle, 16777215, image_alpha);
};

draw_xscale = 0;
draw_yscale = 0;
draw_x = 0;
draw_y = 0;
dark_alpha = 1;
eliteHP = 1;
eliteHPMax = 0;
scare_jump = false;
scare_jump_buffer = 0;
ragereset = 0;
painter = false;
flickertime = 0;
baddieCanDie = true;
touchedground = 0;
frozenState = 0;
frozenSpriteIndex = spr_player_PZ_idle;
frozenImageIndex = 0;
frozenImageSpeed = 0.35;
frozenMoveSpeed = 0;
frozenGrav = 0.35;
frozenHsp = 0;
frozenVsp = 0;
scr_baddiesounds_init();
