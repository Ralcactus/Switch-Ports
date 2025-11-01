trans[0] = obj_bosstrans_knives_lance;
trans[1] = obj_bosstrans_knives_snake;
trans[2] = obj_bosstrans_knives_jade;
trans[3] = obj_bosstrans_knives_dennis;
trans[4] = obj_bosstrans_knives_subway;
trans[5] = obj_bosstrans_knives_opening;
trans[6] = obj_bosstrans_knives_loss;
global.hp_spr = spr_trans_hp_boss;
global.hp_spr_lose = spr_trans_hp_boss_lost;

if (!audio_group_is_loaded(bgm_endless_jingleA))
    audio_group_load(bgm_endless_jingleA);

window_set_size(1920, 1080);
music_play = -4;
