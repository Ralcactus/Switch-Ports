event_inherited();
anim_idle = spr_npc_boomtown_detective;
anim_play(anim_idle);
override_animations = true;
animends = 0;
shutter_to = irandom_range(7, 10);

event_animend = function()
{
    if (anim_sprite == spr_npc_boomtown_detective_flash)
    {
        anim_play(spr_npc_boomtown_detective);
        exit;
    }
    
    if (!instance_exists(obj_textbox))
        animends++;
    
    if (animends == shutter_to)
    {
        animends = 0;
        shutter_to = irandom_range(7, 10);
        anim_play(spr_npc_boomtown_detective_flash);
    }
};
