surf = surface_create(1408, 1080);
darkness = 0.65;
player_radius = 130;
flicker = 1;
flick_timer = 0;

with (obj_controller)
    wizard_sprite = spr_tv_wizard_lightsoff;

out = false;
timer[0] = -1;

timer_func[0] = function()
{
    flick_timer = 0;
    out = true;
};

target = obj_player;
audio_play_sound(snd_lightswitch, 0, 0);
