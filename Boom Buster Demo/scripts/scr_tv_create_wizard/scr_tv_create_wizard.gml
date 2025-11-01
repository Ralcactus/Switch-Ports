function scr_tv_create_wizard()
{
    wizard_sprite = spr_tv_wizard_intro3;
    wizard_sub = 0;
    wizard_speed = 1;
    
    wizard_animend = function()
    {
        wizard_sub = 0;
        
        switch (wizard_sprite)
        {
            case spr_tv_wizard_intro:
                wizard_sprite = spr_tv_wizard_intro1;
                break;
            
            case spr_tv_wizard_intro1:
                with (obj_stagestart_boss)
                    event_user(0);
                
                break;
            
            case spr_tv_wizard_intro2:
                wizard_sprite = spr_tv_wizard_intro3;
                obj_stagestart_boss.timer[4] = 45;
                break;
        }
    };
    
    wizard_flash = 0;
    wizard_blink = true;
}
