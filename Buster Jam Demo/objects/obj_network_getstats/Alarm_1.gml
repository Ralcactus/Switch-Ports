if (tries == 15)
{
    print("could not upload stats");
    failed = true;
    exit;
}

var _buff = buffer_create(256, buffer_fixed, 1);
buffer_write(_buff, buffer_s8, global.stats_pfp);
upload_ID = steam_upload_score_buffer_ext("endless_demo", global.stats_highscore_endless, _buff, true);

if (upload_ID == -1)
    alarm[1] = 20;

tries++;
