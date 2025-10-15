function state_player_oilcutscene() //state_player_oilcutscene
{
    cutscene = true
    var frm = floor(image_index)
    if (!audio_is_playing(oil))
    {
        audio_play_sound(oil,1,0)
        audio_sound_gain(obj_music.musicID, 0, 2000)
    }
    if (frm == cutscene_frame)
        return;
    switch sprite_index
    {
        case spr_player_oilintro1:
            switch frm
            {
                case 8:
                    scr_soundeffect(sfx_rollgetup)
                    break
                case 16:
                    sprite_index = spr_player_oilintro2
                    image_index = 0
                    break
            }

            break
        case spr_player_oilintro2:
            switch frm
            {
                case 5:
                    audio_play_sound(sfx_oilup,1,0)
                    break
                case 30:
                    sprite_index = spr_player_oilintro3
                    image_index = 0
                    with (create_debris((x - 61), (y - 68), spr_debris_oilcan, false))
                    {
                        hsp = -5
                        vsp = -5
                        image_speed = 0
                        image_index = 0
                    }
                    break
            }

            break
        case spr_player_oilintro3:
            switch frm
            {
                case 71:
                    state = (2 << 0)
                    cutscene = false
                    sprite_index = spr_idle
                    image_index = 0
                    audio_sound_gain(obj_music.musicID, (0.6 * global.option_music_volume), 2000)
                    break
            }

            break
    }

    cutscene_frame = frm
}

