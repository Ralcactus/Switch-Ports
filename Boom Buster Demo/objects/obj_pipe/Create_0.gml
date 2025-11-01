col = 0;
anim_init();
set_sprite = false;

event_animend = function()
{
    if (anim_sprite == spr_pipe_enter)
    {
        if (fire && array_length(boms) > 0)
        {
            event_user(1);
        }
        else
        {
            anim_sprite = pipe_idle;
            anim_speed = 1;
        }
    }
};

alarm[0] = 1;
combo_timer = 0;
combo = 0;
lastCombo = -4;
lastComboSnd = -4;
myScoreFX = -4;
comboScore = 0;
boms = array_create(0);
boms_index = 0;
fire = false;
