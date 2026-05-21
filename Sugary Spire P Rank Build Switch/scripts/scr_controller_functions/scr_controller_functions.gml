function p1Vibration(intensity, decay)
{
    with (obj_gamepadder)
    {
        vibration1 = intensity;
        vibrationDecay1 = decay;
    }
    
    gamepad_set_vibration(global.player_input_device, obj_gamepadder.vibration1, obj_gamepadder.vibration1);
}
