function scr_kungfu() //scr_kungfu
{
    scr_soundeffect(uppercut2)
    if irandom(1)
        scr_soundeffect(choose(bo_kungfu1,bo_kungfu2,bo_kungfu3,bo_kungfu4,bo_kungfu5))
    if (movespeed < (9 * getRPGMulti("attack")))
        movespeed = 9 * getRPGMulti("attack")
    state = (82 << 0)
    image_index = 0
    if grounded
        sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3)
    else
        sprite_index = choose(spr_kungfuair1transition, spr_kungfuair2transition, spr_kungfuair3transition)
    return;
}

