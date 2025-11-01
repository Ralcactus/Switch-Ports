global.game_music = "bgm_micro_saturnbound";
global.game_music_loops = true;
surf_bg = -4;
shader = sha_heatwave;
uTime = shader_get_uniform(shader, "Time");
uTexel = shader_get_uniform(shader, "Texel");
uFreq = shader_get_uniform(shader, "uFreq");
uSize = shader_get_uniform(shader, "uSize");
time_bg = 0;
text = "* Ball approaches!";
scr_dialogue_reset(text);
blip = [[snd_micro_ballbattle_textblip]];
time = 0;
text_spd_default = 0.45;
alarm[0] = 1;
arrow_ind = 0;
draw_dialogue = false;
timer[0] = 8;

timer_func[0] = function()
{
    draw_dialogue = true;
};

timer[1] = -1;

timer_func[1] = function()
{
    var _xoff = irandom_range(-140, 140);
    var _yoff = irandom_range(-140, 140);
    var _w = sprite_get_width(ball_sprite);
    var _h = sprite_get_height(ball_sprite);
    var _fx = instance_create_layer(584 + _xoff + (_w / 2), 156 + _yoff + (_h / 2), "Over1", obj_micro_ballbattle_pow);
    _fx.controller = controller;
    _fx.ID = ID;
    
    if ((pows % 2) == 0)
        _fx.sprite_index = spr_micro_ballbattle_pow1;
    
    pows++;
    
    if (audio_is_playing(snd_ouch))
        audio_stop_sound(snd_ouch);
    
    var _snd = audio_play_sound_on(controller.audio, snd_ouch, 0, 0);
    audio_sound_pitch(_snd, choose(1, 1.1, 1.2));
    ball_shake = 1.1;
    
    if (pows <= 4)
        timer[1] = 7;
    else
        timer[2] = 50;
};

timer[2] = -1;

timer_func[2] = function()
{
    ball_shake = 0.8;
    timer[2] = 50;
};

timer[3] = 6;

timer_func[3] = function()
{
    var _flash = flash_ind;
    
    if (_flash == 0)
        flash_ind = 2;
    else
        flash_ind = 0;
    
    timer[3] = 6;
};

flash_ind = 0;
ball_shake = 0;
pows = 0;
chose = -4;
pause = 0;
bg_x = 0;
bg_y = 0;
ball_sprite = spr_micro_ballbattle_ball;
ball_ind = 0;
attack = choose(0, 1);
selected = !attack;
