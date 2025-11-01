event_inherited();
sprite_stomp = spr_goblinjr_stomped;
sprite_spun = spr_goblinjr_spun;
mask_hurt = spr_goblinjr_hurt;
can_die_stomp = false;
can_die_spin = false;
has_spear = true;
array_push(move_forces[0], "hspd_bounce");
ledge_turn = true;
timer[0] = -1;

timer_func[0] = function()
{
    anim_sprite = spr_goblinjr_naked;
    hspd = facing * 5;
};

naked_loop = 0;
naked_loop_to = choose(2, 4, 5, 5, 6);

event_animend_extra = function()
{
    var _anim = anim_sprite;
    
    if (_anim == spr_goblinjr_naked)
    {
        if (naked_loop == naked_loop_to)
        {
            naked_loop_to = choose(2, 4, 5, 5, 6);
            anim_sprite = spr_goblinjr_lookback;
            naked_loop = 0;
        }
        else
        {
            naked_loop++;
        }
    }
    else if (_anim == spr_goblinjr_lookback)
    {
        anim_sprite = spr_goblinjr_look;
    }
    else if (_anim == spr_goblinjr_look)
    {
        anim_sprite = spr_goblinjr_lookaway;
    }
    else if (_anim == spr_goblinjr_lookaway)
    {
        anim_sprite = spr_goblinjr_naked;
    }
};
