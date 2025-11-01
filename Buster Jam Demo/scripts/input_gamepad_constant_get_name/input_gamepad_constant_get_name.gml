function input_gamepad_constant_get_name(arg0)
{
    switch (arg0)
    {
        case 32769:
            return "gp_face1";
            break;
        
        case 32770:
            return "gp_face2";
            break;
        
        case 32771:
            return "gp_face3";
            break;
        
        case 32772:
            return "gp_face4";
            break;
        
        case 32782:
            return "gp_padd";
            break;
        
        case 32781:
            return "gp_padu";
            break;
        
        case 32783:
            return "gp_padl";
            break;
        
        case 32784:
            return "gp_padr";
            break;
        
        case 32773:
            return "gp_shoulderl";
            break;
        
        case 32774:
            return "gp_shoulderr";
            break;
        
        case 32775:
            return "gp_shoulderlb";
            break;
        
        case 32776:
            return "gp_shoulderrb";
            break;
        
        case 32785:
            return "gp_axislh";
            break;
        
        case 32786:
            return "gp_axislv";
            break;
        
        case 32787:
            return "gp_axisrh";
            break;
        
        case 32788:
            return "gp_axisrv";
            break;
        
        case 32778:
            return "gp_start";
            break;
        
        case 32777:
            return "gp_select";
            break;
        
        case 32779:
            return "gp_stickl";
            break;
        
        case 32780:
            return "gp_stickr";
            break;
        
        case __input_global().__gp_guide:
            return "gp_guide";
            break;
        
        case __input_global().__gp_misc1:
            return "gp_misc1";
            break;
        
        case __input_global().__gp_touchpad:
            return "gp_touchpad";
            break;
        
        case __input_global().__gp_paddle1:
            return "gp_paddle1";
            break;
        
        case __input_global().__gp_paddle2:
            return "gp_paddle2";
            break;
        
        case __input_global().__gp_paddle3:
            return "gp_paddle3";
            break;
        
        case __input_global().__gp_paddle4:
            return "gp_paddle4";
            break;
        
        default:
            return "unknown";
            break;
    }
}
