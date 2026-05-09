if (room == rm_battle || room == rm_battle_flowey_phase_2)
{
    if (!global.sound_carry_overworld)
        audio_stop_sound(bgm);
    
    exit;
}

switch (room)
{
    case rm_death_screen:
    case rm_ruins00:
    case rm_ruins01:
    case rm_darkruins_01:
    case rm_darkruins_03:
    case rm_darkruins_18:
    case rm_darkruins_19:
    case rm_snowdin_01_yellow:
    case rm_dalvExit:
    case rm_dalvExit_pacifist:
    case rm_dalvExit_genocide:
    case rm_darkruins_14b:
    case rm_dunes_elevator:
    case rm_mew_mew:
    case rm_steamworks_13b:
    case rm_steamworks_21b:
    case rm_steamworks_factory_elevator:
    case rm_dunes_43:
    case rm_dunes_41:
    case rm_steamworks_35:
    case rm_steamworks_36:
    case rm_steamworks_37:
    case rm_steamworks_38:
    case rm_newhome_03:
    case rm_castle_pre_barrier:
    case rm_dunes_secret:
        bgm = noone;
        break;
    
    case rm_ruins02:
    case rm_ruins03:
    case rm_ruins04:
        bgm = mus_ruins_yellow;
        break;
    
    case rm_darkruins_02:
    case rm_darkruins_15:
    case rm_darkruins_11:
    case rm_dunes_24:
    case rm_dunes_39:
        bgm = mus_wind;
        break;
    
    case rm_darkruins_05:
    case rm_darkruins_10:
    case rm_darkruins_16:
    case rm_darkruins_12:
    case rm_darkruins_08:
    case rm_darkruins_08b:
    case rm_darkruins_13:
        bgm = mus_darkruins;
        break;
    
    case rm_darkruins_14:
        bgm = mus_coolestcave;
        break;
    
    case rm_dalvshouse:
    case rm_dalvsroom:
    case rm_dalvroomhall:
        if (global.flag[17] == 1 && global.route != 3)
            bgm = mus_spook;
        else
            bgm = mus_null;
        
        break;
    
    case rm_snowdin_02_yellow:
    case rm_snowdin_03_yellow:
    case rm_snowdin_06_yellow:
    case rm_snowdin_08_yellow:
    case rm_snowdin_10_yellow:
    case rm_snowdin_11_yellow:
    case rm_snowdin_12_yellow:
    case rm_snowdin_13_yellow:
    case rm_snowdin_15_yellow:
    case rm_snowdin_20_yellow:
        bgm = mus_snowfall;
        break;
    
    case rm_snowdin_secret_to_everybody:
        bgm = noone;
        break;
    
    case rm_battle_flashback_07:
        bgm = mus_snow;
        break;
    
    case rm_snowdin_09_yellow:
        if (global.snowdin_flag[5] == 0 || global.snowdin_flag[5] == 2 || global.geno_complete[2])
            bgm = mus_snowfall;
        else
            bgm = mus_gimme_ur_cash_yellow;
        
        break;
    
    case rm_snowdin_14_yellow:
    case rm_snowdin_14c_yellow:
    case rm_snowdin_14d_yellow:
        bgm = mus_relaxation;
        
        if (global.geno_complete[2])
            bgm = mus_mart_geno_wind_yellow;
        
        break;
    
    case rm_snowdin_14e_yellow:
        bgm = mus_funsized_yellow;
        
        if (global.geno_complete[2])
            bgm = mus_mart_geno_wind_yellow;
        
        break;
    
    case rm_snowdin_14b_yellow:
        if (audio_is_playing(mus_honeydew_bark))
            song = mus_honeydew_bark;
        else if (audio_is_playing(mus_honeydew_dalv))
            song = mus_honeydew_dalv;
        else if (audio_is_playing(mus_honeydew_snow))
            song = mus_honeydew_snow;
        else if (audio_is_playing(mus_honeydew_ruins))
            song = mus_honeydew_ruins;
        else
            bgm = mus_honeydew_lodge;
        
        if (global.snowdin_flag[13] != 0)
            bgm = mus_relaxation;
        
        if (global.geno_complete[2])
            bgm = mus_mart_geno_wind_yellow;
        
        break;
    
    case rm_snowdin_21_yellow:
        if (global.snowdin_flag[13] == 1)
            bgm = mus_birdsofafeather;
        else if (!global.geno_complete[2] || global.dunes_flag[0] > 0)
            bgm = mus_snowfall;
        else
            bgm = mus_mart_geno_wind_yellow;
        
        break;
    
    case rm_waterfall_og:
        if (global.snowdin_flag[13] == 1)
            bgm = mus_aviation;
        else
            bgm = mus_quietstray;
        
        break;
    
    case rm_dunes_01:
    case rm_dunes_02:
        bgm = mus_wind;
        break;
    
    case rm_dunes_03:
    case rm_dunes_06:
    case rm_dunes_05:
    case rm_dunes_08:
    case rm_dunes_11:
    case rm_dunes_28:
    case rm_dunes_28b:
    case rm_dunes_29:
    case rm_dunes_29b:
        bgm = mus_vigorous_terrain;
        break;
    
    case rm_dunes_06b:
        bgm = mus_funsized_yellow;
        break;
    
    case rm_dunes_32:
    case rm_dunes_34:
    case rm_dunes_35:
    case rm_dunes_36:
        bgm = mus_vigorous_terrain;
        
        if (global.dunes_flag[41] == 1)
            bgm = mus_the_trek;
        
        break;
    
    case rm_dunes_30c:
    case rm_mansion_chujins_grave:
        bgm = mus_mart_geno_wind_yellow;
        break;
    
    case rm_mansion_entrance:
    case rm_mansion_kotatsu:
        bgm = mus_trapdoor;
        break;
    
    case rm_mansion_study:
        bgm = mus_computer_ambience;
        
        if (instance_exists(obj_ceroba_phase_2_overworld_cutscene_2))
            bgm = noone;
        
        break;
    
    case rm_dunes_18:
        if (global.route == 3)
        {
            bgm = mus_mart_geno_wind_yellow;
        }
        else
        {
            if (!audio_is_playing(mus_dunes_cave_outdoors))
            {
                dynamic_song = audio_play_sound(mus_dunes_cave_outdoors, 1, 1);
                var dynamic_mus_pos = audio_sound_get_track_position(current_song);
                audio_sound_set_track_position(dynamic_song, dynamic_mus_pos);
                audio_sound_gain(dynamic_song, 0, 0);
            }
            
            audio_sound_gain(dynamic_song, 1, 400);
            audio_sound_gain(current_song, 0, 600);
            exit;
        }
        
        break;
    
    case rm_dunes_08b:
        if (global.dunes_flag[3] == 0 || global.dunes_flag[3] == 2)
            bgm = mus_vigorous_terrain;
        else
            bgm = mus_gimme_ur_cash_yellow;
        
        break;
    
    case rm_dunes_12:
    case rm_dunes_13:
    case rm_dunes_14:
    case rm_dunes_16:
    case rm_dunes_17:
    case rm_dunes_19:
    case rm_dunes_20:
    case rm_dunes_22:
    case rm_dunes_23:
        bgm = mus_dunes_cave;
        
        if (global.route == 3)
            bgm = mus_mart_geno_wind_yellow;
        
        break;
    
    case rm_dunes_25:
    case rm_dunes_25b:
    case rm_dunes_26:
        bgm = mus_apex;
        break;
    
    case rm_dunes_35b:
        if (global.geno_complete[3] == true && global.route == 3)
            bgm = noone;
        else
            bgm = mus_cafe;
        
        break;
    
    case rm_dunes_21:
        bgm = noone;
        break;
    
    case rm_dunes_28c:
        bgm = mus_gemstone_fever;
        break;
    
    case rm_dunes_30:
        bgm = mus_oasis;
        
        if (global.dunes_flag[41] == 1)
            bgm = mus_the_trek;
        
        if (global.route == 3)
            bgm = mus_vigorous_terrain;
        
        if (global.geno_complete[3])
            bgm = mus_mart_geno_wind_yellow;
        
        break;
    
    case rm_dunes_37:
    case rm_dunes_38:
        if (global.dunes_flag[41] >= 1 && global.dunes_flag[41] <= 2)
            bgm = mus_the_trek;
        else if (global.dunes_flag[20] == 0 || global.dunes_flag[20] == 8)
            bgm = noone;
        else if (global.dunes_flag[20] == 9 && (global.dunes_flag[24] == 0 || global.dunes_flag[24] == 2))
            bgm = mus_getting_the_thoughts_out;
        else
            bgm = mus_the_wild_east;
        
        if (room == rm_dunes_37 && global.route == 2 && global.sworks_flag[40] == 2 && global.dunes_flag[41] == 0)
            bgm = noone;
        
        break;
    
    case rm_dunes_40:
        bgm = noone;
        break;
    
    case rm_dunes_42:
        bgm = mus_sunnyside_ranch;
        break;
    
    case rm_dunes_37_saloon:
        if (global.route == 3)
            bgm = noone;
        else if (global.dunes_flag[20] == 9 && (global.dunes_flag[24] == 0 || global.dunes_flag[24] == 2))
            bgm = mus_getting_the_thoughts_out;
        else if (global.route == 1 && global.sworks_flag[0] > 0 && global.dunes_flag[24] == 1 && global.sworks_flag[61] == 0)
            bgm = mus_after_hours;
        else
            bgm = mus_happy_hour;
        
        break;
    
    case rm_steamworks_01:
    case rm_steamworks_02:
    case rm_steamworks_03:
        bgm = mus_abandoned;
        break;
    
    case rm_steamworks_04:
    case rm_steamworks_04b:
    case rm_steamworks_04c:
    case rm_steamworks_05:
    case rm_steamworks_05b:
    case rm_steamworks_05c:
    case rm_steamworks_05d:
    case rm_steamworks_06:
    case rm_steamworks_07:
    case rm_steamworks_08:
    case rm_steamworks_19:
    case rm_steamworks_18:
    case rm_steamworks_30:
    case rm_steamworks_31:
        if (global.sworks_flag[1] < 3)
            bgm = mus_abandoned;
        else
            bgm = mus_steamworks_overworld;
        
        break;
    
    case rm_steamworks_macro_froggit_room:
        bgm = mus_golden_opportunity;
        break;
    
    case rm_steamworks_factory_01:
        bgm = mus_abandoned;
        break;
    
    case rm_steamworks_factory_02:
    case rm_steamworks_factory_04:
        bgm = mus_corner_of_a_circle;
        break;
    
    case rm_steamworks_factory_03:
        bgm = noone;
        break;
    
    case rm_steamworks_chem_01:
        bgm = mus_abandoned;
        break;
    
    case rm_steamworks_chem_02:
    case rm_steamworks_chem_03:
    case rm_steamworks_chem_04:
    case rm_steamworks_chem_05:
    case rm_steamworks_chem_06:
    case rm_steamworks_chem_07:
        if (global.route != 3)
            bgm = mus_corner_of_a_circle;
        else
            bgm = mus_treading_lightly;
        
        break;
    
    case rm_steamworks_chem_hermit:
        bgm = mus_greenhouse;
        break;
    
    case rm_steamworks_09:
    case rm_steamworks_10:
    case rm_steamworks_20:
    case rm_steamworks_21:
    case rm_steamworks_32:
    case rm_steamworks_33:
        bgm = mus_treading_lightly;
        break;
    
    case rm_steamworks_22:
        if (global.sworks_flag[13] >= 2 || global.route == 3)
            bgm = mus_treading_lightly;
        else
            bgm = noone;
        
        break;
    
    case rm_steamworks_18b:
        if (global.sworks_flag[10] == 1)
            bgm = mus_gimme_ur_cash_yellow;
        else
            bgm = mus_steamworks_overworld;
        
        break;
    
    case rm_steamworks_13:
        bgm = mus_detainment;
        break;
    
    case rm_steamworks_14:
        bgm = noone;
        
        if (global.sworks_flag[3] >= 3)
            bgm = mus_treading_lightly;
        
        break;
    
    case rm_steamworks_27:
    case rm_steamworks_28:
    case rm_steamworks_29:
        if (global.sworks_flag[18] == 0)
            bgm = noone;
        else
            bgm = mus_greenhouse;
        
        break;
    
    case rm_steamworks_15:
        bgm = mus_steamworks_overworld;
        break;
    
    case rm_steamworks_23:
    case rm_steamworks_24:
    case rm_steamworks_25:
    case rm_steamworks_25_b:
    case rm_steamworks_26:
        bgm = mus_abandoned;
        
        if (global.sworks_flag[14] == 1 || global.route == 1)
            bgm = mus_corner_of_a_circle;
        
        break;
    
    case rm_hotland_01:
    case rm_hotland_02:
        if (global.hotland_flag[1] == 1)
            bgm = mus_flock_together;
        
        if (global.hotland_flag[9] >= 3)
            bgm = mus_honest_days_work;
        
        bgm = mus_medium;
        
        if (global.route == 3)
            bgm = mus_UNDERTALE_oogloop;
        
        break;
    
    case rm_hotland_03:
    case rm_hotland_03b:
    case rm_hotland_roof:
        bgm = -4;
        
        if (global.hotland_flag[1] == 1)
            bgm = mus_flock_together;
        
        if (global.hotland_flag[9] >= 3)
            bgm = mus_honest_days_work;
        
        break;
    
    case rm_hotland_complex_1:
        bgm = mus_complex;
        
        if (global.hotland_flag[1] == 1)
            bgm = mus_flock_together;
        
        if (global.hotland_flag[9] >= 3)
            bgm = mus_honest_days_work;
        
        if (global.route == 3)
        {
            if (global.hotland_flag[9] < 3)
                bgm = snd_light_loop;
            else
                bgm = noone;
        }
        
        break;
    
    case rm_newhome_01:
    case rm_newhome_02:
        bgm = mus_flock_together;
        
        if (global.hotland_flag[9] >= 3)
            bgm = mus_honest_days_work;
        
        if (global.hotland_flag[3] == 2)
            bgm = noone;
        
        break;
    
    case rm_castle_02:
        if (global.hotland_flag[9] >= 3)
            bgm = mus_honest_days_work;
        
        break;
    
    case rm_castle_03:
        bgm = noone;
        break;
    
    case rm_castle_throne_room:
        bgm = mus_birdnoise;
        break;
    
    case rm_castle_barrier:
        bgm = mus_barrier;
        break;
}

if (!audio_is_playing(bgm) && bgm != -4)
{
    audio_stop_sound(current_song);
    
    if (!audio_is_playing(bgm))
        current_song = audio_play_sound(bgm, 10, 1);
    
    audio_sound_gain(current_song, 1, 0);
    
    if (music_position != 0)
    {
        audio_sound_set_track_position(current_song, music_position);
        music_position = 0;
    }
}

var world_current = scr_determine_world_value_yellow();

if (global.geno_complete[world_current])
{
    if ((world_current == 2 || world_current == 3) && bgm == 154)
        audio_sound_pitch(current_song, 1);
    else
        audio_sound_pitch(current_song, 0.25);
}
else if (global.route == 3)
{
    audio_sound_pitch(current_song, 0.5);
}

if (room == rm_waterfall_og || room == rm_castle_throne_room || room == rm_hotland || room == rm_lava_tubes || room == rm_wildeast_cave || bgm == 609)
    audio_sound_pitch(current_song, 1);

