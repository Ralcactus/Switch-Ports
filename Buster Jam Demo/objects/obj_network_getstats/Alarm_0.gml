if (tries == 15)
{
    failed = true;
    exit;
}

myhighscore_request_id = steam_download_scores_around_user("endless_demo", 0, 0);

if (myhighscore_request_id <= 0)
    alarm[0] = 20;

tries++;
print(string("tries: {0}", tries));
print(string("id: {0}", myhighscore_request_id));
