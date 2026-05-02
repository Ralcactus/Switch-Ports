function scr_savelevelDetails()
{
    var all_confecti = global.MallowFollow && global.ChocoFollow && global.CrackFollow && global.WormFollow && global.CandyFollow;
    global.rank = "d";
    
    if (global.Collect >= global.srank)
    {
        if (!global.ComboLost && global.secretfound > 2 && global.lapcount >= 1 && global.Treasure)
            global.rank = "p";
        else
            global.rank = "s";
    }
    else
    {
        var ranks = ["a", "b", "c"];
        var rank_cutoffs = [global.arank, global.brank, global.crank];
        
        for (var i = 0; i < array_length(ranks); i++)
        {
            if (global.Collect >= rank_cutoffs[i])
            {
                global.rank = ranks[i];
                break;
            }
        }
    }
    
    ini_open("saveData.ini");
    ini_update_stat("Secret", string(global.levelname), global.secretfound);
    ini_update_stat("Treasure", string(global.levelname), global.Treasure);
    ini_update_stat("Highscore", string(global.levelname), global.Collect);
    ini_update_stat("Laps", string(global.levelname), global.lapcount);
    ini_update_stat("Confecti", string(global.levelname) + "1", global.MallowFollow);
    ini_update_stat("Confecti", string(global.levelname) + "2", global.ChocoFollow);
    ini_update_stat("Confecti", string(global.levelname) + "3", global.CrackFollow);
    ini_update_stat("Confecti", string(global.levelname) + "4", global.WormFollow);
    ini_update_stat("Confecti", string(global.levelname) + "5", global.CandyFollow);
	ini_write_string("Ranks", string(global.levelname), global.rank);
	
    if (string(global.levelname) == "tutorial")
        ini_update_stat("Misc", "completedtutorial", true);
	
    ini_close();
    fmod_event_play(global.RankMusicInst);
    fmod_event_setPause(global.RankMusicInst, false);
    var rank_as_num = clamp(5 - rank_checker(), 0, 5);
    fmod_event_setParameter(global.RankMusicInst, "state", rank_as_num, true);
}

function ini_update_stat(arg0, arg1, arg2)
{
    if (ini_read_string(arg0, arg1, 0) < arg2)
        ini_write_string(arg0, arg1, arg2);
}

function confecti_count_level(arg0)
{
    var confecti_count = 0;
    ini_open("saveData.ini");
    
    for (var i = 1; i < 6; i++)
    {
        var c = string(arg0) + string(i);
        
        if (ini_read_string("Confecti", c, 0) == 1)
            confecti_count++;
    }
    
    ini_close();
    return confecti_count;
}
