var m = menuarr[menu]
var bgArr = [[(0 << 0)], [(1 << 0)], [(2 << 0)], [(3 << 0)], [(4 << 0), (5 << 0), (6 << 0), (7 << 0)], [(8 << 0)]]
for (var i = 0; i < array_length(bgArr); i++)
{
    var target = 1
    if (!(array_contains(bgArr[i], menu)))
        target = 0
    for (var j = 0; j < array_length(bgArr[i]); j++)
    {
        var mn = menuarr[bgArr[i][j]]
        mn.alpha = approach(mn.alpha, target, (target == 1 ? 0.1 : 0.05))
    }
}
bg_x--
bg_y--
var move = input_check_pressed("down") - input_check_pressed("up")
var move2 = input_check_pressed("right") - input_check_pressed("left")
var key_confirm = input_check_pressed("jump")
var key_back = (input_check_pressed("slap") || keyboard_check_pressed(vk_escape))
if (backbuffer > 0)
{
    backbuffer--
    key_back = false
    key_confirm = false
}
if (move != 0)
    slidebuffer = 0
moveslide = input_check("right") - input_check("left")
var sel = selected
selected += move
selected = clamp(selected, 0, (array_length(m.options) - 1))
var option = m.options[selected]
if (sel != selected)
{
    scr_soundeffect(choose(sfx_pausesounds_01, sfx_pausesounds_02, sfx_pausesounds_03, sfx_pausesounds_04, sfx_pausesounds_05, sfx_pausesounds_06))
    if (option.type == (5 << 0))
        slidevalue = option.value
    if (m.options[sel].type == (5 << 0))
        m.options[sel].silence()
}
switch option.type
{
    case (1 << 0):
    case (2 << 0):
        if key_confirm
        {
            option.onPress()
            scr_soundeffect(choose(wackySound__01, wackySound__02, wackySound__03, wackySound__04, wackySound__05, wackySound__06, wackySound__07, wackySound__08, wackySound__09, wackySound__10, wackySound__11, wackySound__14, wackySound__16, wackySound__17, wackySound__18, wackySound__19, wackySound__20, wackySound__21))
        }
        break
    case (3 << 0):
        if (key_confirm || move2 != 0)
        {
            option.onPress()
            scr_soundeffect(choose(wackySound__01, wackySound__02, wackySound__03, wackySound__04, wackySound__05, wackySound__06, wackySound__07, wackySound__08, wackySound__09, wackySound__10, wackySound__11, wackySound__14, wackySound__16, wackySound__17, wackySound__18, wackySound__19, wackySound__20, wackySound__21))
        }
        break
    case (4 << 0):
        if (move2 != 0)
        {
            option.onPress(move2)
            scr_soundeffect(choose(wackySound__01, wackySound__02, wackySound__03, wackySound__04, wackySound__05, wackySound__06, wackySound__07, wackySound__08, wackySound__09, wackySound__10, wackySound__11, wackySound__14, wackySound__16, wackySound__17, wackySound__18, wackySound__19, wackySound__20, wackySound__21))
        }
        break
    case (5 << 0):
        if (moveslide != 0 && slidebuffer <= 0 && (option.value + moveslide) != 101 && (option.value + moveslide) != -1)
        {
            slidebuffer = 1
            option.onChange(moveslide)
            if (menu == (1 << 0))
			{
                if audio_is_playing(global.music)
					audio_sound_gain(global.music, (0.6 * global.option_music_volume), 0)
				set_master_gain(global.option_master_volume)
			}
        }
        else if (moveslide == 0 && slidevalue != option.value)
        {
            option.doSet()
            slidevalue = option.value
        }
        else
        {
            option.moving = false
            option.silence()
        }
        break
}

if (slidebuffer > 0)
    slidebuffer--
if (key_back && (!instance_exists(obj_option_keyconfig)))
{
    scr_soundeffect(page_flip_47177)
    if (menu == (0 << 0))
    {
        if (room == rm_mainmenu)
        {
            with (obj_pauseNew)
                state = (1 << 0)
        }
        instance_destroy()
    }
    else
    {
        for (i = 0; i < array_length(m.options); i++)
        {
            var b = m.options[i]
            if (b.type == (5 << 0))
                b.silence()
        }
        m.options[0].onPress()
    }
}
if (keyboard_string != "")
{
    keystring += string_lower(keyboard_string)
    keyboard_string = ""
}
if string_ends_with(keystring, "awesome")
{
	show_message_async("not even sure how you got here in the first place but shoo go away")
}
