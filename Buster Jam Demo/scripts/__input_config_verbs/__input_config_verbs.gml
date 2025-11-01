function __input_config_verbs()
{
    return 
    {
        keyboard_and_mouse: 
        {
            up: [input_binding_key(38)],
            down: [input_binding_key(40)],
            left: [input_binding_key(37)],
            right: [input_binding_key(39)],
            up_strict: [input_binding_key(38)],
            down_strict: [input_binding_key(40)],
            left_strict: [input_binding_key(37)],
            right_strict: [input_binding_key(39)],
            up_menu: [input_binding_key(38), input_binding_key(87)],
            down_menu: [input_binding_key(40), input_binding_key(83)],
            left_menu: [input_binding_key(37), input_binding_key(65)],
            right_menu: [input_binding_key(39), input_binding_key(68)],
            menu_confirm: [input_binding_key(90), input_binding_key(74), input_binding_key(32), input_binding_key(13)],
            cancel: [input_binding_key(88), input_binding_key(75), input_binding_key(27)],
            menu_extra: input_binding_key(67),
            jump: input_binding_key(90),
            action: input_binding_key(88),
            swap: input_binding_key(32),
            pause: [input_binding_key(27), input_binding_key(13)]
        },
        gamepad: 
        {
            up: [input_binding_gamepad_axis(32786, true), input_binding_gamepad_button(32781)],
            down: [input_binding_gamepad_axis(32786, false), input_binding_gamepad_button(32782)],
            left: [input_binding_gamepad_axis(32785, true), input_binding_gamepad_button(32783)],
            right: [input_binding_gamepad_axis(32785, false), input_binding_gamepad_button(32784)],
            dpad_right: input_binding_gamepad_button(32784),
            dpad_left: input_binding_gamepad_button(32783),
            dpad_up: input_binding_gamepad_button(32781),
            dpad_down: input_binding_gamepad_button(32782),
            up_free: [input_binding_gamepad_axis(32786, true), input_binding_gamepad_button(32781)],
            down_free: [input_binding_gamepad_axis(32786, false), input_binding_gamepad_button(32782)],
            left_free: [input_binding_gamepad_axis(32785, true), input_binding_gamepad_button(32783)],
            right_free: [input_binding_gamepad_axis(32785, false), input_binding_gamepad_button(32784)],
            up_strict: [input_binding_gamepad_axis(32786, true), input_binding_gamepad_button(32781)],
            down_strict: [input_binding_gamepad_axis(32786, false), input_binding_gamepad_button(32782)],
            left_strict: [input_binding_gamepad_axis(32785, true), input_binding_gamepad_button(32783)],
            right_strict: [input_binding_gamepad_axis(32785, false), input_binding_gamepad_button(32784)],
            up_menu: [input_binding_gamepad_axis(32786, true), input_binding_gamepad_button(32781)],
            down_menu: [input_binding_gamepad_axis(32786, false), input_binding_gamepad_button(32782)],
            left_menu: [input_binding_gamepad_axis(32785, true), input_binding_gamepad_button(32783)],
            right_menu: [input_binding_gamepad_axis(32785, false), input_binding_gamepad_button(32784)],
            jump: input_binding_gamepad_button(32769),
            action: input_binding_gamepad_button(32771),
            swap: input_binding_gamepad_button(32770),
            menu_confirm: input_binding_gamepad_button(32769),
            cancel: input_binding_gamepad_button(32770),
            menu_extra: input_binding_gamepad_button(32772),
            pause: input_binding_gamepad_button(32778)
        },
        touch: 
        {
            up: input_binding_virtual_button(),
            down: input_binding_virtual_button(),
            left: input_binding_virtual_button(),
            right: input_binding_virtual_button(),
            accept: input_binding_virtual_button(),
            cancel: input_binding_virtual_button(),
            action: input_binding_virtual_button(),
            special: input_binding_virtual_button(),
            pause: input_binding_virtual_button()
        }
    };
}
