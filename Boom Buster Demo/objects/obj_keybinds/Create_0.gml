func = function()
{
    deac = true;
    alarm[0] = 180;
};

func_default = function()
{
    with (input)
    {
        for (var i = 0; i <= 10; i++)
            key[i] = key_default[i];
    }
    
    audio_play_sound(snd_coin, 0, 0);
};

func_back = function()
{
    ini_open("options.ini");
    
    for (var i = 0; i <= 10; i++)
        ini_write_real("KEYMAPS", i, input.key[i]);
    
    fixed_ini_close();
    instance_destroy();
};

menu = 
{
    options: ["LEFT", "RIGHT", "UP", "DOWN", "JUMP", "SPIN", "DASH", "CROUCH", "CHARM", "PAUSE", "RESTORE DEFAULTS", "BACK"],
    functions: [func, func, func, func, func, func, func, func, func, func, func_default, func_back]
};
deac = false;
input = global.input[0];
selected_option = 0;
exists_alpha = 0;
exists_pop = 0;
