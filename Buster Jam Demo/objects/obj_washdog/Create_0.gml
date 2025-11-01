global.game_music = "bgm_micro_puppy";
surf = -4;
surf2 = -4;
surf3 = -4;
anim_init();
anim_play(spr_br_washdog_sad);
dirty_ind = irandom_range(0, sprite_get_number(spr_br_washdog_dirty) - 1);
chunk = 0;
chunk_max = 8;
count = 0;
count_last = 0;
buffer = undefined;
data = 
{
    lives: 3,
    health: 10,
    coins: 100,
    username: "Player"
};
