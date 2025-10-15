if (player == noone || pillar == noone || (!instance_exists(pillar)))
    return;
mail_trigger((10 << 0))
scr_soundeffect(sfx_punch)
punched = true
with (player)
{
    if (state == (109 << 0) || state == (273 << 0))
        return;
    alarm[8] = 100
    alarm[7] = 150
    hurted = 1
    scr_soundeffect(sfx_pephurt)
    xscale = (-sign(other.pillar.image_xscale))
    sprite_index = spr_hurtjump
    hsp = -3 * xscale
    movespeed = 3
    vsp = -10
    timeuntilhpback = 300
    instance_create(x, y, obj_spikehurteffect)
    if (state == (271 << 0) || state == (270 << 0) || state == (272 << 0))
        state = (273 << 0)
    else
        state = (109 << 0)
    image_index = 0
    flash = 1
}
