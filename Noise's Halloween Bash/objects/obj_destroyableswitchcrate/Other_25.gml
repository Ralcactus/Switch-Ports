if (!hit)
{
    hit = true;
    global.switchstate = !global.switchstate;
    squish = 1.2;
    var _ev = scr_fmod_soundeffectONESHOT("event:/sfx/misc/onoffcrate", x + (sprite_width / 2), y + (sprite_height / 2));
    fmod_studio_event_instance_set_parameter_by_name(_ev, "state", global.switchstate);
    scr_createparticle(true, x + (sprite_width / 2), y + (sprite_height / 2), obj_player.z + 1, spr_bangeffect, 1, 1, 0, 0.35, 0, 0, 0, 0, 0);
}
