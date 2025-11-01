function scr_trapdoor_step()
{
    if (exit_freeze())
        exit;
    
    anim_logic();
    inside = place_meeting(x, y, par_physics);
    
    if (inside)
    {
        if (anim_sprite == spr_trapdoor)
        {
            var _choose = irandom_range(0, 500);
            
            if (_choose == 0)
                anim_play(spr_trapdoor_open_fun);
            else
                anim_play(spr_trapdoor_open);
        }
    }
    else
    {
        if (anim_sprite == spr_trapdoor_open || anim_sprite == spr_trapdoor_opened)
            anim_play(spr_trapdoor_close);
        
        if (anim_sprite == spr_trapdoor_open_fun || anim_sprite == spr_trapdoor_opened_fun)
            anim_play(spr_trapdoor_close_fun);
    }
}
