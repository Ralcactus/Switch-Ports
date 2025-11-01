function __input_binding_get_label(arg0, arg1, arg2)
{
    if (!__input_global().__on_desktop)
    {
        if (arg0 == "mouse button" && arg1 == 1)
            return "touchscreen press";
    }
    
    switch (arg0)
    {
        case "key":
            return __input_key_get_name(arg1);
            break;
        
        case "mouse button":
            switch (arg1)
            {
                case 1:
                    return "mouse button left";
                    break;
                
                case 3:
                    return "mouse button middle";
                    break;
                
                case 2:
                    return "mouse button right";
                    break;
                
                case 4:
                    return "mouse button back";
                    break;
                
                case 5:
                    return "mouse button forward";
                    break;
                
                default:
                    return "mouse button unknown";
                    break;
            }
            
            break;
        
        case "mouse wheel up":
            return "mouse wheel up";
            break;
        
        case "mouse wheel down":
            return "mouse wheel down";
            break;
        
        case "gamepad button":
        case "gamepad axis":
            switch (arg1)
            {
                case 32769:
                    return "gamepad face south";
                    break;
                
                case 32770:
                    return "gamepad face east";
                    break;
                
                case 32771:
                    return "gamepad face west";
                    break;
                
                case 32772:
                    return "gamepad face north";
                    break;
                
                case 32773:
                    return "gamepad shoulder l";
                    break;
                
                case 32774:
                    return "gamepad shoulder r";
                    break;
                
                case 32775:
                    return "gamepad trigger l";
                    break;
                
                case 32776:
                    return "gamepad trigger r";
                    break;
                
                case 32778:
                    return "gamepad start";
                    break;
                
                case 32779:
                    return "gamepad thumbstick l click";
                    break;
                
                case 32780:
                    return "gamepad thumbstick r click";
                    break;
                
                case 32781:
                    return "gamepad dpad up";
                    break;
                
                case 32782:
                    return "gamepad dpad down";
                    break;
                
                case 32783:
                    return "gamepad dpad left";
                    break;
                
                case 32784:
                    return "gamepad dpad right";
                    break;
                
                case __input_global().__gp_guide:
                    return "gamepad guide";
                    break;
                
                case __input_global().__gp_misc1:
                    return "gamepad misc 1";
                    break;
                
                case __input_global().__gp_touchpad:
                    return "gamepad touchpad click";
                    break;
                
                case __input_global().__gp_paddle1:
                    return "gamepad paddle 1";
                    break;
                
                case __input_global().__gp_paddle2:
                    return "gamepad paddle 2";
                    break;
                
                case __input_global().__gp_paddle3:
                    return "gamepad paddle 3";
                    break;
                
                case __input_global().__gp_paddle4:
                    return "gamepad paddle 4";
                    break;
                
                case 32785:
                    return arg2 ? "gamepad thumbstick l left" : "gamepad thumbstick l right";
                    break;
                
                case 32786:
                    return arg2 ? "gamepad thumbstick l up" : "gamepad thumbstick l down";
                    break;
                
                case 32787:
                    return arg2 ? "gamepad thumbstick r left" : "gamepad thumbstick r right";
                    break;
                
                case 32788:
                    return arg2 ? "gamepad thumbstick r up" : "gamepad thumbstick r down";
                    break;
                
                case 32777:
                    return "gamepad select";
                    break;
                
                default:
                    return "gamepad input unknown";
                    break;
            }
            
            break;
        
        case "virtual button":
            return "virtual button";
            break;
        
        default:
            return "binding unknown";
            break;
    }
}
