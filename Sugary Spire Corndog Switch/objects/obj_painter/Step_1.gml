switch (state)
{
    case UnknownEnum.Value_3:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_0:
    case UnknownEnum.Value_1:
        scr_painter_walk();
        break;
    
    case UnknownEnum.Value_26:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_5:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_2:
        scr_enemy_charge();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_9:
        scr_enemy_frozen();
        break;
    
    case UnknownEnum.Value_10:
        hsp = 0;
        vsp = 0;
        break;
    
    case UnknownEnum.Value_18:
        scr_enemy_float();
        break;
    
    case UnknownEnum.Value_19:
        scr_enemy_thief();
        break;
    
    case UnknownEnum.Value_11:
        scr_enemy_panicWait();
        break;
    
    case UnknownEnum.Value_12:
        scr_enemy_secretWait();
        break;
    
    case UnknownEnum.Value_6:
        scr_enemy_throw();
        break;
    
    case UnknownEnum.Value_7:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_8:
        scr_enemy_scared();
        break;
    
    case UnknownEnum.Value_25:
        scr_enemy_inhaled();
        break;
    
    case UnknownEnum.Value_13:
        scr_enemy_cherrywait();
        break;
    
    case UnknownEnum.Value_14:
        scr_enemy_charcherry();
        break;
    
    case UnknownEnum.Value_27:
        break;
    
    case UnknownEnum.Value_16:
        scr_enemy_slugjump();
        break;
    
    case UnknownEnum.Value_17:
        scr_enemy_slugparry();
        break;
    
    case UnknownEnum.Value_24:
        scr_enemy_kick();
        break;
    
    case UnknownEnum.Value_20:
        scr_enemy_eyescreamwait();
        break;
    
    case UnknownEnum.Value_21:
        scr_enemy_eyescream();
        break;
    
    case UnknownEnum.Value_22:
        scr_enemy_rage();
        break;
    
    case UnknownEnum.Value_15:
        break;
}
