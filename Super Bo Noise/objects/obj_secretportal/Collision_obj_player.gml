if (active && sprite_index != spr_secretportal_open && (!instance_exists(obj_jumpscare)) && ds_list_find_index(global.saveroom, id) == -1)
{
    if (sprite_index != spr_secretportal_close)
    {
        sprite_index = spr_secretportal_close
        image_index = 0
        scr_soundeffect(sfx_secretenter)
    }
    if ((!touched) && (!soundtest))
    {
        if (!obj_music.secret)
        {
            obj_music.secret = true
            obj_music.secretend = false
        }
        else
        {
            obj_music.secret = false
            obj_music.secretend = true
        }
    }
    touched = 1
    playerid = other.id
    other.x = x
    other.y = y - 30
    other.vsp = 0
    other.hsp = 0
    other.cutscene = 1
    var fisharr = [(270 << 0), (271 << 0), (272 << 0), (273 << 0)]
    if (!(array_contains(fisharr, other.state)))
        other.sprite_index = other.spr_hurtjump
    with (obj_heatafterimage)
        visible = false
}
