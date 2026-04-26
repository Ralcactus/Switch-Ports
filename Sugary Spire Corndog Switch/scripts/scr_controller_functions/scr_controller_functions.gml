function p1Vibration(arg0, arg1)
{
    with (obj_gamepadder)
    {
        vibration1 = arg0;
        vibrationDecay1 = arg1;
    }
    
    //gamepad_set_vibration(global.player_input_device, obj_gamepadder.vibration1, obj_gamepadder.vibration1);
}
