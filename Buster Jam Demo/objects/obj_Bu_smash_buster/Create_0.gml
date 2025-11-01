anim_init();
spin = false;
spun = false;
timer[0] = -1;

timer_func[0] = function()
{
    spin = false;
    spun = false;
    
    if (!instance_exists(obj_Bu_smash_brick))
    {
        anim_play(spr_Bu_smash_yooo);
        win = true;
    }
    else
    {
        anim_play(spr_Bu_smash_run);
    }
};

dead = false;
global.game_music = "bgm_micro_western";
alarm[0] = 1;
hspd = 0;
vspd = 0;
win = false;
