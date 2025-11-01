print("download success");
print(string("highscore: {0}", global.stats_highscore_endless));
print(string("pfp: {0}", global.stats_pfp));

if (global.debug)
    print(string("need_upload:{0}", need_upload));

if (need_upload)
    alarm[1] = 1;
else
    alarm[2] = 1;

tries = 0;
