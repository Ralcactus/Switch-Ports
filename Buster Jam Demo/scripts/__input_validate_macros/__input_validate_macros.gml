function __input_validate_macros()
{
    if (!is_bool(true))
        __input_error("INPUT_PC_KEYBOARD must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_PC_MOUSE must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_PC_GAMEPAD must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_WINDOWS_VIBRATION must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_MOBILE_GAMEPAD must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_MOBILE_MOUSE must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_MOBILE_WEB_KEYBOARD must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_ANDROID_KEYBOARD must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_SWITCH_KEYBOARD must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_SWITCH_MOUSE must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_SWITCH_TOUCH must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_SWITCH_VIBRATION must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_PS4_VIBRATION must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_PS5_VIBRATION must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_XBOX_VIBRATION must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_ALLOW_OUT_OF_FOCUS must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_TIMER_MILLISECONDS must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_ALLOW_STEAMWORKS must be either <true> or <false>");
    
    if (!is_numeric(10000) || false)
        __input_error("INPUT_BINDING_SCAN_TIMEOUT must be a number that is greater than or equal to 1000");
    
    if (!is_numeric(4) || false || false)
        __input_error("INPUT_MAX_ALTERNATE_BINDINGS must be an integer that is greater than or equal to 1");
    
    if (!is_bool(false))
        __input_error("INPUT_FLEXIBLE_VERB_IMPORT must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_FLEXIBLE_ALTERNATE_BINDING_IMPORT must be either <true> or <false>");
    
    if (!is_numeric(10) || false)
        __input_error("INPUT_REPEAT_DEFAULT_DELAY must be a number that is greater than or equal to 1");
    
    if (!is_numeric(30) || false)
        __input_error("INPUT_REPEAT_DEFAULT_PREDELAY must be a number that is greater than or equal to 1");
    
    if (!is_numeric(10) || false)
        __input_error("INPUT_LONG_DELAY must be a number that is greater than or equal to 1");
    
    if (!is_numeric(12) || false)
        __input_error("INPUT_DOUBLE_DELAY must be a number that is greater than or equal to 1");
    
    if (!is_numeric(3) || false)
        __input_error("INPUT_QUICK_BUFFER must be a number that is greater than or equal to 1");
    
    if (!is_numeric(4) || false)
        __input_error("INPUT_CHORD_DEFAULT_TIME must be a number that is greater than or equal to 1");
    
    if (!is_bool(true))
        __input_error("INPUT_2D_CLAMP must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_2D_XY_AXIS_BIAS_DIAGONALS must be either <true> or <false>");
    
    if (!is_string("keyboard_and_mouse") && !is_undefined("keyboard_and_mouse"))
        __input_error("INPUT_AUTO_PROFILE_FOR_KEYBOARD must be a string (or <undefined> if the profile is to be unavailable)");
    
    if (!is_string("keyboard_and_mouse") && !is_undefined("keyboard_and_mouse"))
        __input_error("INPUT_AUTO_PROFILE_FOR_KEYBOARD must be a string (or <undefined> if the profile is to be unavailable)");
    
    if (!is_string("gamepad") && !is_undefined("gamepad"))
        __input_error("INPUT_AUTO_PROFILE_FOR_GAMEPAD must be a string (or <undefined> if the profile is to be unavailable)");
    
    if (!is_string("touch") && !is_undefined("touch"))
        __input_error("INPUT_AUTO_PROFILE_FOR_TOUCH must be a string (or <undefined> if the profile is to be unavailable)");
    
    if (!is_string("mixed") && !is_undefined("mixed"))
        __input_error("INPUT_AUTO_PROFILE_FOR_MIXED must be a string (or <undefined> if the profile is to be unavailable)");
    
    if (!is_string("multidevice") && !is_undefined("multidevice"))
        __input_error("INPUT_AUTO_PROFILE_FOR_MULTIDEVICE must be a string (or <undefined> if the profile is to be unavailable)");
    
    if (!is_bool(true))
        __input_error("INPUT_ASSIGN_KEYBOARD_AND_MOUSE_TOGETHER must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_ALLOW_ASYMMETRIC_DEFAULT_PROFILES must be either <true> or <false>");
    
    if (!is_numeric(33) || false)
        __input_error("INPUT_HOTSWAP_DELAY must be a number that is greater than or equal to 1");
    
    if (!is_bool(true))
        __input_error("INPUT_HOTSWAP_ON_GAMEPAD_AXIS must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_HOTSWAP_ON_MOUSE_BUTTON must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_HOTSWAP_ON_MOUSE_MOVEMENT must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_HOTSWAP_AUTO_PROFILE must be either <true> or <false>");
    
    if (!is_numeric(2) || false || false)
        __input_error("INPUT_MAX_PLAYERS must be an integer that is greater than or equal to 1");
    
    if (!is_bool(true))
        __input_error("INPUT_SDL2_REMAPPING must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_SDL2_ALLOW_EXTERNAL must be either <true> or <false>");
    
    if (!is_string("Input/sdl2.txt") && !is_undefined("Input/sdl2.txt"))
        __input_error("INPUT_SDL2_DATABASE_PATH must be a string or <undefined>");
    
    if (!is_string("Input/controllertypes.csv") && !is_undefined("Input/controllertypes.csv"))
        __input_error("INPUT_CONTROLLER_TYPE_PATH must be a string or <undefined>");
    
    if (!is_string("Input/controllerblacklist.csv") && !is_undefined("Input/controllerblacklist.csv"))
        __input_error("INPUT_BLACKLIST_PATH must be a string or <undefined>");
    
    if (!is_bool(false))
        __input_error("INPUT_ANDROID_KEYBOARD_ALLOWED must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_SWITCH_KEYBOARD_ALLOWED must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_MERGE_CONTROL_KEYS must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_MOUSE_ALLOW_SCANNING must be either <true> or <false>");
    
    if (!is_numeric(2) || false)
        __input_error("INPUT_MOUSE_MOVE_DEADZONE must be a number that is greater than or equal to 0");
    
    if (!is_bool(true))
        __input_error("INPUT_MOUSE_ALLOW_VIRTUAL_BUTTONS must be either <true> or <false>");
    
    if (!is_numeric(11) || false || false)
        __input_error("INPUT_MAX_TOUCHPOINTS must be an integer that is greater than or equal to 1");
    
    if (!is_numeric(35) || false)
        __input_error("INPUT_TOUCH_EDGE_DEADZONE must be a number that is greater than or equal to 0");
    
    if (!is_numeric(10) || false || false)
        __input_error("INPUT_TOUCH_HISTORY_FRAMES must be an integer that is greater than or equal to 1");
    
    if (!is_numeric(50) || false || false)
        __input_error("INPUT_VIRTUAL_BUTTON_MIN_THRESHOLD must be a number greater than or equal to 0, and less than INPUT_VIRTUAL_BUTTON_MAX_THRESHOLD");
    
    if (!is_numeric(100) || false || false)
        __input_error("INPUT_VIRTUAL_BUTTON_MAX_THRESHOLD must be a number greater than or equal to 0, and greater than INPUT_VIRTUAL_BUTTON_MIN_THRESHOLD");
    
    if (!is_bool(false))
        __input_error("INPUT_VIRTUAL_KEYBOARD_PREDICTIVE_TEXT_ENABLED must be either <true> or <false>");
    
    if (!is_numeric(0.1) || false || false)
        __input_error("INPUT_DEFAULT_AXIS_MIN_THRESHOLD must be a number greater than or equal to 0, and lesser than INPUT_DEFAULT_AXIS_MAX_THRESHOLD");
    
    if (!is_numeric(0.95) || false || false)
        __input_error("INPUT_DEFAULT_AXIS_MAX_THRESHOLD must be a number less than or equal to 1, and greater than INPUT_DEFAULT_AXIS_MAX_THRESHOLD");
    
    if (!is_numeric(0.02) || false || false)
        __input_error("INPUT_DEFAULT_TRIGGER_MIN_THRESHOLD must be a number greater than or equal to 0, and lesser than INPUT_DEFAULT_TRIGGER_MAX_THRESHOLD");
    
    if (!is_numeric(1) || false || false)
        __input_error("INPUT_DEFAULT_TRIGGER_MAX_THRESHOLD must be a number less than or equal to 1, and greater than INPUT_DEFAULT_TRIGGER_MIN_THRESHOLD");
    
    if (!is_numeric(1000) || false)
        __input_error("INPUT_ANDROID_GAMEPAD_ENUMERATION_INTERVAL must be a number that is greater than or equal to 1");
    
    if (!is_bool(false))
        __input_error("INPUT_SWITCH_SWAP_AB must be either <true> or <false>");
    
    if (!is_bool(false))
        __input_error("INPUT_PS_REGION_SWAP_CONFIRM must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_SWITCH_HORIZONTAL_HOLDTYPE must be either <true> or <false>");
    
    if (!is_bool(true))
        __input_error("INPUT_SWITCH_JOYCON_MOTION_RIGHT_HAND must be either <true> or <false>");
    
    if (!is_numeric(2))
        __input_error("INPUT_GYRO_DEFAULT_SENSITIVITY_X must be a number");
    
    if (!is_numeric(-2))
        __input_error("INPUT_GYRO_DEFAULT_SENSITIVITY_Y must be a number");
    
    if (!is_string("aim_up") && !is_undefined("aim_up"))
        __input_error("INPUT_CURSOR_VERB_UP must be a string or <undefined>");
    
    if (!is_string("aim_down") && !is_undefined("aim_down"))
        __input_error("INPUT_CURSOR_VERB_DOWN must be a string or <undefined>");
    
    if (!is_string("aim_left") && !is_undefined("aim_left"))
        __input_error("INPUT_CURSOR_VERB_LEFT must be a string or <undefined>");
    
    if (!is_string("aim_right") && !is_undefined("aim_right"))
        __input_error("INPUT_CURSOR_VERB_RIGHT must be a string or <undefined>");
    
    if (!is_numeric(5) || false)
        __input_error("INPUT_CURSOR_START_SPEED must be a number that is greater than 0");
    
    if (!is_numeric(1))
        __input_error("INPUT_CURSOR_START_SPEED must be a number");
    
    if (!is_numeric(1) || false || false)
        __input_error("INPUT_VIBRATION_DEFAULT_STRENGTH must be a number between 0.0 and 1.0 (inclusive)");
    
    if (!is_numeric(0.4) || false || false)
        __input_error("INPUT_VIBRATION_JOYCON_STRENGTH must be a number between 0.0 and 1.0 (inclusive)");
    
    if (!is_numeric(1) || false || false)
        __input_error("INPUT_TRIGGER_EFFECT_DEFAULT_STRENGTH must be a number between 0.0 and 1.0 (inclusive)");
}
