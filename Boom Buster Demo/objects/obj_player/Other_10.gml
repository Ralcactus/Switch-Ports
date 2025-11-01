if (invulnerable || obj_controller.win || global.nuclear)
    exit;

global.combo_meter -= 2;
invulnerable = true;
audio_play_sound(choose(voice_buster_pain, voice_buster_pain2), 0, 0);
timer_func[timer_reset_action]();
coyote_spin = 0;
coyote_slide = 0;

if (state != state_cannon)
{
    hspd = -facing * 4;
    vspd = -12;
    state = state_hurt;
    timer[timer_reset_state] = 15;
    land_anim_delay = 5;
    anim_sprite = asset_get_index(string("spr_buster_pain{0}", irandom_range(0, 2)));
    anim_index = 0;
}

var _powerup = global.powerup;

if (_powerup != 0)
{
    global.powerup = 0;
}
else if (global.hp <= 1)
{
    var _inst = instance_create_layer(x, y, layer, obj_player_death);
    _inst.facing = facing;
    global.hp = 0;
    audio_stop_all();
    play_impact();
    global.goodnight = true;
    instance_destroy();
    exit;
}
else
{
    global.hp--;
}

global.hurt = id;

if (pit)
    global.freeze = 1;
else
    global.freeze = 25;

global.freeze_func = function()
{
    with (global.hurt)
    {
        timer[timer_invulnerable_flash] = 5;
        invulnerable_flash = true;
        timer[timer_become_vulnerable] = 120;
    }
    
    global.hurt = -4;
};

play_impact();
pit = false;
