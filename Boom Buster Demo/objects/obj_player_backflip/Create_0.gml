anim_init();
anim_sprite = spr_buster_crouchin;

event_animend = function()
{
    if (anim_sprite == spr_buster_crouchin)
    {
        anim_sprite = spr_buster_crouch;
        alarm[0] = 20;
    }
    else if (anim_sprite == spr_buster_backflip)
    {
        anim_index = 4;
    }
};

image_speed = 0;
facing = 1;
