function scr_savelevelDetails()
{
	//Rank Decide
	#region Ranks
    if (global.collect >= global.srank)
    {
        if (global.combolost == 0 && global.secretfound > 2 && global.lapcount >= 1 && global.treasure)
            global.rank = "p";
        else
            global.rank = "s";
    }
    else if (global.collect > global.arank)
        global.rank = "a";
    else if (global.collect > global.brank)
        global.rank = "b";
    else if (global.collect > global.crank)
        global.rank = "c";
    else
        global.rank = "d";
    #endregion
	#region Rank Music
    switch (global.rank)
    {
        case "e":
        case "p":
        case "s":
            scr_musicnoloop(mu_ranks);
            break;
        
        case "a":
            scr_musicnoloop(mu_ranka);
            break;
        
        case "b":
            scr_musicnoloop(mu_rankb);
            break;
        
        case "c":
            scr_musicnoloop(mu_rankc);
            break;
        
        case "d":
            scr_musicnoloop(mu_rankd);
            break;
    }
    #endregion
	#region Save File Stuff
    ini_open("saveData.ini");
    //Secrets
    if (ini_read_string("Secret", string(global.levelname), 0) < global.secretfound)
        ini_write_string("Secret", string(global.levelname), global.secretfound);
    //Treasure
    if (ini_read_string("Treasure", string(global.levelname), 0) == 0)
        ini_write_string("Treasure", string(global.levelname), global.treasure);
    //Highscore
    if (ini_read_string("Highscore", string(global.levelname), 0) < global.collect)
        ini_write_string("Highscore", string(global.levelname), global.collect);
    //Laps
    if (ini_read_string("Laps", string(global.levelname), 0) < global.lapcount)
        ini_write_string("Laps", string(global.levelname), global.lapcount);
    #region Confecti
    if (ini_read_string("Confecti", string(global.levelname) + "1", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "1", global.mallowfollow);
    if (ini_read_string("Confecti", string(global.levelname) + "2", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "2", global.chocofollow);
    if (ini_read_string("Confecti", string(global.levelname) + "3", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "3", global.crackfollow);
    if (ini_read_string("Confecti", string(global.levelname) + "4", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "4", global.wormfollow);
    if (ini_read_string("Confecti", string(global.levelname) + "5", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "5", global.candyfollow);
    #endregion
	//Ranks
    if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", string(global.levelname), "none")))
        ini_write_string("Ranks", string(global.levelname), global.rank);
    ini_close();
	#endregion
}

function confecti_count_level(level)
{
    var cnt = 0;
    ini_open("saveData.ini");
    
    for (var i = 1; i <= 5; i++)
    {
        var _c = string(level) + string(i);
        
        if (ini_read_string("Confecti", _c, 0) == 1)
            cnt++;
    }
    
    ini_close();
    return cnt;
}
