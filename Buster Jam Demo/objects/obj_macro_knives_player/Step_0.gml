testvariablenothing = false;
x += (hspd * global.delta_game_factor);

if (place_meeting(x, y + 30, obj_macro_knives_ground))
{
    while (place_meeting(x, y, obj_macro_knives_ground))
        y--;
    
    while (!place_meeting(x, y + 1, obj_macro_knives_ground))
        y++;
}

var _side_press;

if (deac)
{
    xAxis = 0;
    _side_press = 0;
}
else
{
    xAxis = input_check("right") - input_check("left");
    _side_press = input_check_pressed("down") - input_check_pressed("up");
}

if (input_check_pressed("jump") && action == action_free && !deac)
{
    action = action_spin;
    timer[0] = spin_length;
    coyote_spin = coyote_spin_length;
    audio_play_sound(snd_spin, 0, 0);
}

if (_side_press != 0 && !side_flip && _side_press != side && (action == action_free || action == action_spin))
{
    if (action == action_spin)
    {
        action = action_free;
        timer[0] = -1;
        coyote_spin = 0;
    }
    
    var _side = side;
    
    if (_side_press == 1)
        anim_sprite = spr_macro_buster_turn_down;
    else
        anim_sprite = spr_macro_buster_turn_up;
    
    anim_speed = 0;
    side_to = _side_press;
    side_flip = true;
    flip_yto = down_yoff;
    action = action_turn;
    obj_macro_knives_controller.side = side_to;
}

if (side_flip)
{
    flip_yoff = approach(flip_yoff, flip_yto, flip_yto / 10);
    
    if (flip_yoff == flip_yto)
    {
        side_flip = false;
        side = side_to;
        flip_yoff = 0;
        anim_speed = 1;
        action = action_free;
        anim_play(spr_macro_buster_run);
    }
}

var _hurt = false;

if (side == 1)
    y += down_yoff;

var _inst = instance_place(x, y, par_macro_knives_spinnable);

if (place_meeting(x, y, _inst) && !side_flip)
{
    if (coyote_spin)
    {
        with (_inst)
            event_spun();
    }
    else
    {
        _hurt = true;
        
        if (_inst.object_index == obj_macro_knives_bom)
        {
            with (_inst)
                event_fail();
            
            _hurt = false;
        }
    }
}

if (place_meeting(x, y, par_macro_knives_hurt) && !side_flip)
    _hurt = true;

if (side == 1)
    y -= down_yoff;

if (_hurt)
    event_user(0);

timer_logic(0);

if (action != action_spin)
    coyote_spin = approach(coyote_spin, 0, 1);

catch_ymove = approach(catch_ymove, 0, 0.08333333333333333);
shake = approach(shake, 0, 0.05);
