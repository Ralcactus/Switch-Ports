if (game_paused())
    exit;

squish = min(squish + 0.05, 1);

if (active)
{
    if (steptimer <= 0)
    {
        explodesteps--;
        
        if (explodesteps <= 0)
        {
            instance_destroy();
            exit;
        }
        
        steptimer = 60;
    }
    
    if ((explodesteps > 1 && steptimer == 60) || (explodesteps <= 1 && steptimer != 0 && (steptimer % 15) == 0))
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratetnt", x + (sprite_width / 2), y + (sprite_height / 2));
        stepflash = 1;
    }
    
    steptimer--;
}

stepflash = max(stepflash - 0.05, 0);
