function scr_reset_save_data()
{
    global.save_data = 
    {
        cutscenes_watched: [],
        puzzles_solved: [],
        frenzies_beaten: []
    };
    global.coins = 0;
    global.frenzy_name = undefined;
}
