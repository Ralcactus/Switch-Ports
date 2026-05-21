function boss_attack_queue(state, timer)
{
    ds_queue_enqueue(atkqueue, state, timer);
}

// too lazy to write proper doc
// sets State, Intesity of Attack, and time between attacks
// Arg3 and arg4 are dependent based on state, ex: in Painter Dash, arg 3 sets if the attack ends in painter being stunned
// For the vunerable state, intensity is how long boss is vulnerable
function boss_create_attack(state, intensity, timer = 100, sub1 = noone, sub2 = noone)
{
    return 
    {
        atk: state,
        diff: intensity,
        time: timer,
        suba_1: sub1,
        suba_2: sub2
    };
}

function boss_next_attack()
{
    if (ds_queue_empty(atkqueue))
    {
        var b = obj_bosscontroller;
        var _atk = b.bossmaxhp - b.bosshp;
        var _length = array_length(phase_atks) - 1;
        _atk = clamp(_atk, 0, _length);
        show_debug_message(_length);
        
        for (var i = 0; i < array_length(phase_atks[_atk]); i++)
            ds_queue_enqueue(atkqueue, phase_atks[_atk][i]);
    }
    
    var _next = ds_queue_dequeue(atkqueue);
    show_debug_message(_next);
    state = _next.atk;
    intensity = _next.diff;
    max_intensity = intensity;
    delay = _next.time;
    max_delay = delay;
    subattack_1 = _next.suba_1;
    subattack_2 = _next.suba_2;
    
    if (state == bossstates.vulnerable)
        flash = true;
}

function face_center_room()
{
    var dir = sign((room_width / 2) - x);
    return dir;
}

function face_obj(object)
{
    var dir = sign(object.x - x);
    return dir;
}

function scr_grab_boss()
{
    with (obj_player)
    {
        if (state != states.finishingblow || baddiegrabbedID != other.id)
        {
            baddiegrabbedID = other.id;
            supergrabx = other.x - x;
            supergraby = other.y - y;
            sprite_index = spr_player_lungehit;
            image_index = 0;
            state = states.finishingblow;
        }
    }
    
    state = baddiestate.grabbed;
    image_xscale = -obj_player.xscale;
    sprite_index = grabbedspr;
}
