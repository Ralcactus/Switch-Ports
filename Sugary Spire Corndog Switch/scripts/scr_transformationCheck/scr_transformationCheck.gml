function scr_transformationCheck(arg0)
{
    var transfo = undefined;
    
    if (arg0 == UnknownEnum.Value_132)
        arg0 = tauntStored.state;
    
    switch (arg0)
    {
        case UnknownEnum.Value_95:
            transfo = "Ball";
            break;
        
        case UnknownEnum.Value_87:
        case UnknownEnum.Value_96:
        case UnknownEnum.Value_97:
            transfo = "Cottoncoated";
            break;
        
        case UnknownEnum.Value_150:
        case UnknownEnum.Value_152:
        case UnknownEnum.Value_151:
        case UnknownEnum.Value_153:
            transfo = "Frostburn";
            break;
        
        case UnknownEnum.Value_45:
        case UnknownEnum.Value_47:
            transfo = "UFO";
            break;
        
        case UnknownEnum.Value_146:
        case UnknownEnum.Value_147:
        case UnknownEnum.Value_148:
            transfo = "SeaCream";
            break;
        
        case UnknownEnum.Value_78:
        case UnknownEnum.Value_79:
        case UnknownEnum.Value_80:
        case UnknownEnum.Value_81:
            transfo = "Marshdog";
            break;
        
        case UnknownEnum.Value_139:
            transfo = "Rocket";
            break;
        
        case UnknownEnum.Value_98:
            transfo = "Flingfrog";
            break;
        
        case UnknownEnum.Value_127:
        case UnknownEnum.Value_128:
            transfo = "Mini";
            break;
        
        case UnknownEnum.Value_1:
        case UnknownEnum.Value_55:
            if (sprite_index == spr_player_PZ_flinged_up_start || sprite_index == spr_player_PZ_flinged_up)
                transfo = "Flingfrog";
            
            break;
    }
    
    return transfo;
}
