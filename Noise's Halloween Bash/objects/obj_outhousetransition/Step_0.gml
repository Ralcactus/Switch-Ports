anim = min(anim + 0.1, 2);
show_debug_message(anim);

if (anim >= 1 && !roomchanged)
{
    finish_explosion_chains();
    room_goto(obj_player.targetroom);
    roomchanged = true;
}

if (anim >= 2)
    instance_destroy();
