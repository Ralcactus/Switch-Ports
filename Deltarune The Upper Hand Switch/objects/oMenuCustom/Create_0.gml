res_keys();
thic = 30;
plus = 4;
extraY = 0;
page = 0;
cur = 1;
curSave = cur;
special = -1;
val = [0, 0, 0];
updateText = true;
title_color = 255;

if (room == rCustomMode)
{
    op.customMode = true;
    
    while (array_length(op.party) < 3)
        array_push(op.party, 0);
    
    while (array_length(op.custom_item) < 12)
        array_push(op.custom_item, 0);
    
    op.itemsON = [0, 0];
}

if (room == rMusicPlayer)
{
    page = 3;
    cur = 0;
}

gt_offOn = g_t("m_1e");
op.itemsText = g_t("text_items");
gt_mainMenu = g_st("cm_mainMenu") + "_sg";
gt_back = g_st("cm_back") + "_sg";
gt_cm = g_t("cm_cm");
gt_party = g_st("cm_party");
gt_item = g_st("cm_item");
gt_mp = g_t("mp_mp");
startPage = page;

function spinX()
{
    return round(dcos(op.ty * 5) * 4);
}

function spinY()
{
    return round(dsin(op.ty * 5) * 4);
}

function drawCur(arg0 = 0, arg1 = 0)
{
    ext(sPixel, 0, 0, (arg1 - 10) + plus, 999, 22, undefined, 16777215, 0.1);
    ext(sSymb, 7, (arg0 - 14) + spinX(), arg1 + plus + spinY(), undefined, undefined, undefined, title_color, 0.25);
    ext(sSymb, 7, arg0 - 14, arg1 + plus, undefined, undefined, undefined, title_color);
}

function drawArrows(arg0 = 0)
{
    if (cur == i)
    {
        ext(sSymb, 8, 586 + arg0 + spinX(), 72 + plus + ((cur - extraY) * thic), 1, 1);
        ext(sSymb, 8, (566 + arg0) - spinX(), 72 + plus + ((cur - extraY) * thic), -1, 1);
    }
}

function getFace(arg0 = "")
{
    if (arg0 == "kris")
        return "_sa";
    
    if (arg0 == "susie")
        return "_sb";
    
    if (arg0 == "ralsei")
        return "_sc";
    
    return "";
}

function add_option(arg0 = "Skip", arg1 = -1, arg2 = -1)
{
    array_push(text, arg0);
    array_push(run, arg1);
    array_push(func, arg2);
}

gt_titels = g_t("m_4");
text_title = [gt_titels[5], gt_cm[2], gt_cm[3], gt_titels[6], gt_mp[0], gt_mp[1], gt_mp[2], "Alex Mode", "Ben Mode"];
sep_text = "";
sep_color = 16777215;
sep_seed = [];
cre_use = -1;
mus_use = -1;
name_winter = "The Winterer";
name_alex = "Alex";
name_ben = "ben";
cre_tuh = [name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter, name_winter];
mus_tuh = [mus_title, mus_trouble_at_hand_old, mus_Steam_Jams, mus_Sockswald_strings, mus_Sockswald_loop, mus_Socks_World, mus_Socks_world_8bit, mus_puppetshow_1, mus_puppetshow_2, mus_puppetshow_3, mus_puppetshow_4, mus_play_transition1, mus_play_transition2, mus_stars_of_destiny, mus_crystal, mus_trouble_at_hand, mus_INTERSTELLAR_ASCENSION, mus_ASCENSION, mus_constellation];
cre_cm = [name_alex, "Anvil", name_alex, "Anvil", "Elwood"];
mus_cm = [mus_evilChallenge, mus_path_to_nowhere, mus_san_Shain, mus_backwaters, mus_dead_lock];
cre_m = ["Toby Fox", "Creepa-Bot Inc £and £Local H00ligan", name_winter, name_winter, "Geefel", "Consumer £Softproducts", "Its by £big nostalgia"];
mus_m = [mus_star, mus_handy_manny_old, mus_sockswald_old, mus_INTERSTELLAR_BOOGALOO, mus_space_jam_rus, mus_Memories_Of_HQ, mus_deltarune_critic];
cre_alex = [name_alex, name_alex, name_alex, name_alex, name_alex, name_alex, name_alex, name_alex + " and " + name_ben, name_alex, name_alex, name_alex, name_ben, name_alex, name_alex, name_alex, name_alex, name_alex];
mus_alex = [mus_title_down_under, mus_delta2018buster, mus_horrorbuster, mus_lukas_cant_make_up_his_mind_buster_bensorship, mus_sweepstakesbuster, mus_theorybuster, mus_retrobuster2, mus_arguebuster, mus_chapterbuster, mus_fentbuster, mus_boredbuster, mus_tobybuster_r, mus_tomorrowbuster, mus_memoryleakbuster, mus_interloperbuster, mus_endingbuster, mus_gameover_buster];
cre_ben = [name_ben, name_ben];
mus_ben = [mus_sigma_hickcore, mus_hickcore];
