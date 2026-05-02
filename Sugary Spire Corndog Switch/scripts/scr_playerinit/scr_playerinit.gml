function scr_player_changeCharacter(arg0 = obj_player1, arg1, arg2 = false)
{
    with (arg0)
    {
        previousCharacter = character;
        character = arg1;
        
        if (!arg2)
            mainPlayerCharacter = arg1;
        
        scr_characterSprite();
    }
}

function scr_playerrespawn(arg0 = true)
{
    if (!arg0)
    {
        if (state != UnknownEnum.Value_49 && state != UnknownEnum.Value_110 && state != UnknownEnum.Value_98 && !place_meeting(x, y + 32, obj_vertical_hallway) && !instance_exists(obj_fadeoutTransition) && room != outer_room2 && room != timesuproom && room != rank_room)
        {
            var _checkpoint = instance_nearest(x, y, obj_checkpoint_invis);
            var _checkpointReal = -4;
            
            with (obj_checkpoint)
            {
                if (Checkpointactivated)
                    _checkpointReal = id;
            }
            
            if (instance_exists(_checkpoint) && _checkpoint.Checkpointactivated)
            {
                x = _checkpoint.x;
                y = _checkpoint.y;
                instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
            }
            else if (instance_exists(_checkpointReal) && _checkpointReal.Checkpointactivated)
            {
                x = _checkpointReal.x;
                y = _checkpointReal.y;
                instance_create(_checkpointReal.x, _checkpointReal.y, obj_poofeffect);
            }
            else
            {
                x = roomStartX;
                y = roomStartY;
                instance_create(roomStartX, roomStartY, obj_poofeffect);
            }
            
            if (instance_exists(obj_train))
            {
                with (obj_train)
                {
                    x = xstart;
                    y = ystart;
                    image_xscale = start_xscale;
                    image_index = 0;
                    sprite_index = spr_spray;
                    vsp = 0;
                    movespeed = 10;
                    state = UnknownEnum.Value_0;
                }
            }
            
            if (instance_exists(obj_traingo))
            {
                with (obj_traingo)
                    triggered = false;
            }
            
            state = UnknownEnum.Value_68;
            alarm[8] = 30;
            alarm[7] = 60;
            hurted = true;
            sprite_index = spr_hurt;
            movespeed = 0;
            vsp = -3;
        }
    }
    else if (!instance_exists(obj_techdiff))
    {
        event_play_oneshot("event:/SFX/player/groundpound", camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]));
        instance_create(x, y, obj_techdiff);
    }
}

function scr_playerstate()
{
    var state_function = undefined;
    
    switch (state)
    {
        case UnknownEnum.Value_1:
            state_function = state_player_normal;
            break;
        
        case UnknownEnum.Value_3:
            state_function = state_player_run;
            break;
        
        case UnknownEnum.Value_2:
            state_function = state_player_titlescreen;
            break;
        
        case UnknownEnum.Value_4:
            break;
        
        case UnknownEnum.Value_5:
            state_function = state_player_charge;
            break;
        
        case UnknownEnum.Value_6:
            break;
        
        case UnknownEnum.Value_8:
            break;
        
        case UnknownEnum.Value_9:
            break;
        
        case UnknownEnum.Value_10:
            break;
        
        case UnknownEnum.Value_11:
            state_function = state_player_climbwall;
            break;
        
        case UnknownEnum.Value_12:
            state_function = state_player_climbdownwall;
            break;
        
        case UnknownEnum.Value_13:
            break;
        
        case UnknownEnum.Value_14:
            break;
        
        case UnknownEnum.Value_15:
            break;
        
        case UnknownEnum.Value_16:
            state_function = state_player_grabdash;
            break;
        
        case UnknownEnum.Value_17:
            break;
        
        case UnknownEnum.Value_18:
            break;
        
        case UnknownEnum.Value_19:
            break;
        
        case UnknownEnum.Value_20:
            state_function = state_player_bombpep;
            break;
        
        case UnknownEnum.Value_21:
            break;
        
        case UnknownEnum.Value_22:
            break;
        
        case UnknownEnum.Value_23:
            break;
        
        case UnknownEnum.Value_24:
            break;
        
        case UnknownEnum.Value_25:
            break;
        
        case UnknownEnum.Value_26:
            break;
        
        case UnknownEnum.Value_27:
            state_function = state_player_timesup;
            break;
        
        case UnknownEnum.Value_28:
            state_function = state_player_machroll;
            break;
        
        case UnknownEnum.Value_29:
            break;
        
        case UnknownEnum.Value_30:
            state_function = state_player_swingclub;
            break;
        
        case UnknownEnum.Value_31:
            break;
        
        case UnknownEnum.Value_32:
            break;
        
        case UnknownEnum.Value_33:
            state_function = state_player_superslam;
            break;
        
        case UnknownEnum.Value_34:
            break;
        
        case UnknownEnum.Value_35:
            break;
        
        case UnknownEnum.Value_36:
            state_function = state_player_grind;
            break;
        
        case UnknownEnum.Value_71:
            state_function = state_player_hang;
            break;
        
        case UnknownEnum.Value_37:
            state_function = state_player_grab;
            break;
        
        case UnknownEnum.Value_38:
            break;
        
        case UnknownEnum.Value_39:
            break;
        
        case UnknownEnum.Value_40:
            break;
        
        case UnknownEnum.Value_41:
            break;
        
        case UnknownEnum.Value_42:
            state_function = state_player_taunt;
            break;
        
        case UnknownEnum.Value_43:
            break;
        
        case UnknownEnum.Value_44:
            break;
        
        case UnknownEnum.Value_45:
            state_function = state_player_ufofloat;
            break;
        
        case UnknownEnum.Value_46:
            state_function = state_player_ufospinout;
            break;
        
        case UnknownEnum.Value_47:
            state_function = state_player_ufodash;
            break;
        
        case UnknownEnum.Value_48:
            break;
        
        case UnknownEnum.Value_49:
            state_function = state_player_gameover;
            break;
        
        case UnknownEnum.Value_50:
            state_function = state_player_Sjumpland;
            break;
        
        case UnknownEnum.Value_51:
            state_function = state_player_freefallprep;
            break;
        
        case UnknownEnum.Value_52:
            state_function = state_player_tackle;
            break;
        
        case UnknownEnum.Value_53:
            state_function = state_player_slipnslide;
            break;
        
        case UnknownEnum.Value_54:
            state_function = state_player_ladder;
            break;
        
        case UnknownEnum.Value_55:
            state_function = state_player_jump;
            break;
        
        case UnknownEnum.Value_56:
            state_function = state_player_victory;
            break;
        
        case UnknownEnum.Value_57:
            state_function = state_player_comingoutdoor;
            break;
        
        case UnknownEnum.Value_58:
            state_function = state_player_Sjump;
            break;
        
        case UnknownEnum.Value_59:
            state_function = state_player_Sjumpprep;
            break;
        
        case UnknownEnum.Value_60:
            state_function = state_player_crouch;
            break;
        
        case UnknownEnum.Value_61:
            state_function = state_player_crouchjump;
            break;
        
        case UnknownEnum.Value_62:
            state_function = state_player_machroll;
            break;
        
        case UnknownEnum.Value_63:
            state_function = state_player_mach1;
            break;
        
        case UnknownEnum.Value_64:
            state_function = state_player_mach2;
            break;
        
        case UnknownEnum.Value_65:
            state_function = state_player_mach3;
            break;
        
        case UnknownEnum.Value_66:
            state_function = state_player_machslide;
            break;
        
        case UnknownEnum.Value_67:
            state_function = state_player_bump;
            break;
        
        case UnknownEnum.Value_68:
            state_function = state_player_hurt;
            break;
        
        case UnknownEnum.Value_69:
            state_function = state_player_freefall;
            break;
        
        case UnknownEnum.Value_70:
            state_function = state_player_freefallland;
            break;
        
        case UnknownEnum.Value_72:
            state_function = state_player_door;
            break;
        
        case UnknownEnum.Value_73:
            break;
        
        case UnknownEnum.Value_74:
            break;
        
        case UnknownEnum.Value_75:
            break;
        
        case UnknownEnum.Value_76:
            break;
        
        case UnknownEnum.Value_77:
            break;
        
        case UnknownEnum.Value_78:
            state_function = state_player_doughmount;
            break;
        
        case UnknownEnum.Value_79:
            state_function = state_player_doughmountspin;
            break;
        
        case UnknownEnum.Value_81:
            state_function = state_player_doughmountballoon;
            break;
        
        case UnknownEnum.Value_82:
            state_function = state_player_doughmountpancake;
            break;
        
        case UnknownEnum.Value_83:
            break;
        
        case UnknownEnum.Value_84:
            break;
        
        case UnknownEnum.Value_85:
            state_function = state_player_current;
            break;
        
        case UnknownEnum.Value_86:
            state_function = state_player_finishingblow;
            break;
        
        case UnknownEnum.Value_87:
            state_function = state_player_cotton;
            break;
        
        case UnknownEnum.Value_88:
            state_function = state_player_uppercut;
            break;
        
        case UnknownEnum.Value_89:
            state_function = state_player_pal;
            break;
        
        case UnknownEnum.Value_90:
            state_function = state_player_shocked;
            break;
        
        case UnknownEnum.Value_91:
            state_function = state_player_bushdisguise;
            break;
        
        case UnknownEnum.Value_131:
            state_function = state_player_rocketlauncher;
            break;
        
        case UnknownEnum.Value_92:
            state_function = state_player_parry;
            break;
        
        case UnknownEnum.Value_95:
            state_function = state_player_tumble;
            break;
        
        case UnknownEnum.Value_93:
            state_function = state_player_talkto;
            break;
        
        case UnknownEnum.Value_94:
            state_function = state_player_puddle;
            break;
        
        case UnknownEnum.Value_96:
            state_function = state_player_cottondrill;
            break;
        
        case UnknownEnum.Value_97:
            state_function = state_player_cottonroll;
            break;
        
        case UnknownEnum.Value_98:
            state_function = state_player_fling;
            break;
        
        case UnknownEnum.Value_99:
            state_function = state_player_breakdance;
            break;
        
        case UnknownEnum.Value_117:
            state_function = state_gumbob_propeller;
            break;
        
        case UnknownEnum.Value_118:
            state_function = scr_gumbob_mixnbrew;
            break;
        
        case UnknownEnum.Value_119:
            state_function = state_player_gumbob_bounce;
            break;
        
        case UnknownEnum.Value_121:
            state_function = state_player_gumbob_dash;
            break;
        
        case UnknownEnum.Value_122:
            state_function = state_player_gumbob_pound;
            break;
        
        case UnknownEnum.Value_100:
            state_function = state_player_minecart;
            break;
        
        case UnknownEnum.Value_107:
            state_function = state_player_fireass;
            break;
        
        case UnknownEnum.Value_108:
            state_function = state_player_fireassdash;
            break;
        
        case UnknownEnum.Value_101:
            state_function = state_player_squished;
            break;
        
        case UnknownEnum.Value_102:
            state_function = state_player_machtumble;
            break;
        
        case UnknownEnum.Value_104:
            state_function = scr_mach_pizzano;
            break;
        
        case UnknownEnum.Value_103:
            state_function = scr_rocketfist_pizzano;
            break;
        
        case UnknownEnum.Value_105:
            state_function = scr_pizzano_kungfu;
            break;
        
        case UnknownEnum.Value_106:
            state_function = scr_pizzano_pummel;
            break;
        
        case UnknownEnum.Value_113:
            state_function = scr_coneboy_inhale;
            break;
        
        case UnknownEnum.Value_114:
            state_function = scr_coneboy_inhale;
            break;
        
        case UnknownEnum.Value_115:
            state_function = scr_coneboy_inhale;
            break;
        
        case UnknownEnum.Value_116:
            state_function = scr_coneboy_kick;
            break;
        
        case UnknownEnum.Value_109:
            state_function = state_player_geyser;
            break;
        
        case UnknownEnum.Value_123:
            state_function = scr_pizzano_twirl;
            break;
        
        case UnknownEnum.Value_124:
            state_function = scr_pizzano_machtwirl;
            break;
        
        case UnknownEnum.Value_125:
            state_function = scr_pizzano_shoulderbash;
            break;
        
        case UnknownEnum.Value_126:
            state_function = scr_pizzano_wallcling;
            break;
        
        case UnknownEnum.Value_110:
            state_function = state_player_actor;
            break;
        
        case UnknownEnum.Value_112:
            state_function = state_player_changing;
            break;
        
        case UnknownEnum.Value_111:
            state_function = state_player_donothing;
            break;
        
        case UnknownEnum.Value_127:
            state_function = state_player_mini_normal;
            break;
        
        case UnknownEnum.Value_128:
            state_function = state_player_mini_pummel;
            break;
        
        case UnknownEnum.Value_130:
            state_function = state_player_flushed;
            break;
        
        case UnknownEnum.Value_144:
            state_function = state_player_drown;
            break;
        
        case UnknownEnum.Value_0:
            state_function = state_player_frozen;
            break;
        
        case UnknownEnum.Value_132:
            state_function = state_player_hooks;
            break;
        
        case UnknownEnum.Value_133:
            state_function = state_player_trick;
            break;
        
        case UnknownEnum.Value_134:
            state_function = state_player_noclip;
            break;
        
        case UnknownEnum.Value_135:
            state_function = state_player_costumenormal;
            break;
        
        case UnknownEnum.Value_136:
            state_function = state_player_costumegrab;
            break;
        
        case UnknownEnum.Value_138:
            state_function = state_player_costumechuck;
            break;
        
        case UnknownEnum.Value_137:
            state_function = state_player_costumebreeze;
            break;
        
        case UnknownEnum.Value_139:
            state_function = state_player_bottlerocket;
            break;
        
        case UnknownEnum.Value_143:
            state_function = state_player_donut;
            break;
        
        case UnknownEnum.Value_140:
            state_function = state_player_holdbomb;
            break;
        
        case UnknownEnum.Value_145:
            state_function = state_player_climbceiling;
            break;
        
        case UnknownEnum.Value_146:
            state_function = state_player_seacream;
            break;
        
        case UnknownEnum.Value_147:
            state_function = state_player_seacreamjump;
            break;
        
        case UnknownEnum.Value_148:
            state_function = state_player_seacreamstick;
            break;
        
        case UnknownEnum.Value_149:
            state_function = state_player_gumballoon;
            break;
        
        case UnknownEnum.Value_150:
            state_function = state_player_frostburnnormal;
            break;
        
        case UnknownEnum.Value_151:
            state_function = state_player_frostburnslide;
            break;
        
        case UnknownEnum.Value_152:
            state_function = state_player_frostburnjump;
            break;
        
        case UnknownEnum.Value_153:
            state_function = state_player_frostburnstick;
            break;
        
        case UnknownEnum.Value_155:
            state_function = state_player_honey;
            break;
        
        case UnknownEnum.Value_156:
            state_function = state_player_supergrab;
            break;
        
        case UnknownEnum.Value_80:
            state_function = state_player_doughmountjump;
            break;
        
        case UnknownEnum.Value_129:
            break;
        
        case UnknownEnum.Value_120:
            state_function = scr_player_gumbobroll;
            break;
        
        case UnknownEnum.Value_159:
            state_function = state_player_vampire;
            break;
        
        case UnknownEnum.Value_160:
            state_function = state_player_wallkick;
            break;
    }
    
    stateName = "states.undefined";
    
    if (!is_undefined(state_function))
    {
        state_function();
        stateName = "states." + string_extract(script_get_name(state_function), "_", 1) + string_extract(script_get_name(state_function), "_", 3);
    }
}
