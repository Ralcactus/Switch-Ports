var _temp_local_var_2;
if instance_exists(obj_optionNew)
    return;
var frame_current = floor(image_index)
with (obj_player)
{
    state = (114 << 0)
    x = obj_doorA.x
    y = obj_doorA.y
}
switch state
{
    case (0 << 0):
        var instant = (keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(global.player_input_device))
        var _temp_local_var_2 = sprite_index
        if (sprite_index == introArr[0])
        {
            if (image_speed == 0 && instant)
            {
                image_speed = 0.35
                scr_soundeffect(startthegamebuttonshit)
				audio_stop_sound(bo_noise_load)
				scr_music(bo_noise_title_final_uni_ver3_mmutefi)
            }
            else if (frame_current == 23 && introSoundBuffer != frame_current)
            {
                scr_soundeffect(sfx_groundpound)
                introSoundBuffer = frame_current
            }
            else if (image_index >= (image_number - 1))
            {
                sprite_index = introArr[1]
                image_index = 0
            }
        }
        else if (sprite_index == introArr[1])
        {
            if (image_index >= (image_number - 1) || instant)
            {
                state = (1 << 0)
                selected = 1
                moveBuffer = 10
                sprite_index = saves[selected].spr_hover
                image_index = 0
            }
            else if (introSoundBuffer != frame_current)
            {
                switch frame_current
                {
                    case 25:
                        scr_soundeffect(sfx_rollgetup)
                        break
                    case 73:
                    case 80:
                        scr_soundeffect(sfx_step)
                        break
                }

                introSoundBuffer = frame_current
            }
        }
        break
    case (3 << 0):
        saves[selected].step()
        if (frame_current != introSoundBuffer)
        {
            if (selected == 1)
            {
                switch frame_current
                {
                    case 1:
                        scr_soundeffect(sfx_cartoonystretch)
						audio_stop_all()
                        break
                }

            }
            else if (selected == 2)
            {
                switch frame_current
                {
                    case 2:
                    case 4:
                    case 6:
                        scr_soundeffect(sfx_step)
                        break
                    case 8:
						audio_stop_all()
                        scr_soundeffect(sfx_menuselect2)
                        break
                }

            }
            else if (selected == 3)
            {
                switch frame_current
                {
                    case 1:
                    case 11:
                    case 21:
                    case 26:
                    case 32:
                    case 36:
                        scr_soundeffect(sfx_rollgetup)
                        break
                    case 38:
						audio_stop_all()
                        scr_soundeffect(sfx_menuplane)
                        break
                }

            }
            introSoundBuffer = frame_current
        }
        if (frame_current == (image_number - 1))
        {
            image_speed = 0
            endFadeAlpha += 0.05
            if (endFadeAlpha >= 1)
                event_user(0)
        }
        break
    case (2 << 0):
        saves[selected].step()
        if (!input_check("taunt"))
        {
            state = (1 << 0)
            moveBuffer = 10
            deleteBuffer = deleteTime
            return;
        }
        deleteBuffer--
        if (deleteBuffer <= 0)
        {
            self.deleteSave(selected)
            scr_soundeffect(sfx_explosion)
            state = (1 << 0)
            moveBuffer = 10
            deleteBuffer = deleteTime
            image_index = 0
        }
        break
    case (1 << 0):
        var allow_movement = true
        var current_save = saves[selected]
        for (var i = 1; i < array_length(saves); i++)
            saves[i].step()
        if input_check_pressed("jump")
        {
            state = (3 << 0)
            introSoundBuffer = 0
            image_index = 0
            scr_soundeffect(Evil_leafy_teleport)
			audio_stop_sound(global.music)
        }
        if input_check_pressed("slap")
        {
            state = (4 << 0)
            select2 = 1
        }
        if (input_check("taunt") && current_save.percentage > 0)
        {
            state = (2 << 0)
            allow_movement = false
        }
        if (moveBuffer > 0)
        {
            moveBuffer--
            allow_movement = false
        }
        if (allow_movement && state == (1 << 0))
        {
            var move = input_check_pressed("right") - input_check_pressed("left")
            var selOld = selected
            selected += move
            selected = clamp(selected, 1, (array_length(saves) - 1))
            if (selected != selOld)
            {
                scr_soundeffect(sfx_step)
                moveBuffer = 10
            }
        }
        break
    case (4 << 0):
        saves[selected].step()
        var move2 = input_check_pressed("right") - input_check_pressed("left")
        var sel2Old = select2
        var quitGame = false
        var goBack = false
        select2 += move2
        select2 = clamp(select2, 0, 1)
        if input_check_pressed("jump")
        {
            if (select2 == 0)
                quitGame = true
            else
                goBack = true
        }
        else if input_check_pressed("slap")
            goBack = true
        if goBack
        {
            state = (1 << 0)
            select2 = 1
        }
        else if quitGame
            game_end()
        break
}

