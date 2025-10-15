function scr_playersounds() //scr_playersounds
{
    with (obj_player1)
    {
        var s = (state == (63 << 0) ? tauntstoredstate : state)
        var _state = s
        if (s == (106 << 0) || s == (123 << 0) || s == (39 << 0))
        {
            var m = 0
            if (s == (106 << 0) && sprite_index == spr_mach1 && grounded)
			{
				if !audio_is_playing(sfx_mach1)
				{
					audio_play_sound(sfx_mach1, 1, false)
				}
			}
                
            else if ((s == (106 << 0) && sprite_index == spr_mach) || state == (39 << 0))
			{
				if !audio_is_playing(sfx_mach2)
				{
					audio_play_sound(sfx_mach2, 1, false)
				}
			}
            else if (s == (123 << 0) && sprite_index != spr_crazyrun)
			{
				if !audio_is_playing(sfx_mach3)
				{
					audio_play_sound(sfx_mach3, 1, false)
				}
			}
            else if (s == (123 << 0) && sprite_index == spr_crazyrun)
			{
				if !audio_is_playing(sfx_mach4)
				{
					audio_play_sound(sfx_mach4, 1, false)
				}
			}
        }
        else
		{
            audio_stop_sound(sfx_mach1)
            audio_stop_sound(sfx_mach2)
            audio_stop_sound(sfx_mach3)
            audio_stop_sound(sfx_mach4)
		}
        if place_meeting(x, y, obj_waterCurrent)
        {
            if (!audio_is_playing(eerie_bubbles))
                audio_play_sound(eerie_bubbles,1,0)
        }
        else
            audio_stop_sound(eerie_bubbles)
        if (sprite_index == spr_machroll || sprite_index == spr_backslide || sprite_index == spr_backslideland)
        {
            if (!audio_is_playing(machroll))
                audio_play_sound(machroll,1,0)
        }
        else
            audio_stop_sound(machroll)
        if (audio_is_playing(sfx_suplexdash) && state != (44 << 0))
            audio_stop_sound(sfx_suplexdash)
        if (audio_is_playing(fishslap) && state != (271 << 0))
            audio_stop_sound(fishslap)
        if (audio_is_playing(oil) && room != water_1)
            audio_stop_sound(oil)
        if (audio_is_playing(sfx_oilup) && s != (276 << 0))
            audio_stop_sound(sfx_oilup)

        if (state == (101 << 0))
        {
			if (!sjumpprep) {
				scr_soundeffect(sfx_superjumpprep)
				sjumpprep = true;
			}
			if !audio_is_playing(sfx_superjumpprep)
			{
				if !audio_is_playing(sfx_superjumphold)
				{
				audio_play_sound(sfx_superjumphold,1,0)
				}
			}
			
        }
        else if (state == (99 << 0))
		{
			if audio_is_playing(sfx_superjumphold)
			{
				audio_stop_sound(sfx_superjumphold)
			}
			if !audio_is_playing(sfx_superjumphold)
			{
				if !sjumped {
					scr_soundeffect(sfx_superjumprelease)
					sjumped = true;
				}
				sjumpprep = false;
			}
		}
        else if (state != (99 << 0))
        {
			sjumped = false;
        }
        if ((state == (40 << 0) && grounded && vsp > 0) || state == (80 << 0))
        {
            if (!audio_is_playing(sfx_knightslide))
                audio_play_sound(sfx_knightslide,1,0)
        }
        else
            audio_stop_sound(sfx_knightslide)
        if (s == (110 << 0) || s == (124 << 0) || s == (78 << 0))
        {
            if (!audio_is_playing(sfx_freefall))
                audio_play_sound(sfx_freefall,1,0)
        }
        else
            audio_stop_sound(sfx_freefall)
        if (global.redcoin > 0)
        {
            if (!audio_is_playing(beepboop))
                audio_play_sound(beepboop,1,0)
        }
        else if audio_is_playing(beepboop)
        {
            trace("Stopping redcoin music")
            audio_stop_sound(beepboop)
        }
    }
    return;
}

function scr_playersound_init() //scr_playersound_init
{
	show_debug_message("lol")
}

