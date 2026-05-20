function get_stats(arg0)
{
    port_info = arg0;
    res_jam(1);
    jam[0] = 0;
    jam[1] = 0;
    jam[2] = rgb(255, 255, 255);
    store_stats("kris", op.statsText[0], 0, "0,1,2,3,4", rgb(0, 255, 255), rgb(0, 255, 255), sFaceKris, "opt_ACT");
    store_stats2("kris", rgb(0, 0, 255), sKrisH_Slash, sKrisA_Idle, sKrisB_Fight, sKrisC_Act, sKrisD_Item, sKrisE_Defend, sKrisC_Act, sKrisC_Act, sKrisF_Damage, sKrisG_Intro);
    store_stats("susie", op.statsText[1], 0, "0,5,2,3,4", rgb(255, 0, 255), rgb(255, 128, 255), sFaceSusie, "opt_MAG");
    store_stats2("susie", rgb(128, 0, 128), sSusieI_Slash, sSusieA_Idle, sSusieB_Fight, sSusieC_Act, sSusieD_Item, sSusieE_Defend, sSusieF_MagicIdle, sSusieG_MagicUse, sSusieH_Damage, sSusieB_Fight);
    store_stats("ralsei", op.statsText[2], 0, "0,5,2,3,4", rgb(0, 255, 0), rgb(128, 255, 128), sFaceRalsei, "opt_MAG");
    store_stats2("ralsei", rgb(0, 128, 0), sRalseiJ_Slash, sRalseiA_Idle, sRalseiB_Fight, sRalseiC_Act, sRalseiD_Item, sRalseiE_Defend, sRalseiF_MagicIdle, sRalseiG_MagicUse, sRalseiH_Damage, sRalseiI_Intro);
}

function store_stats(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    if (port_info == arg0)
    {
        res_jam(0);
        jamOptions = 0;
        jam[0] = arg1;
        jam[1] = arg2;
        jam[2] = arg4;
        jam[3] = arg5;
        jam[4] = arg6;
        jamOptions = string_split(arg3, ",");
        jamSeed = string_split(arg7, ",");
    }
}

function store_stats2(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
{
    if (port_info == arg0)
    {
        jam2 = 0;
        jam2[0] = arg1;
        jam2[1] = arg2;
        jam2[2] = arg3;
        jam2[3] = arg4;
        jam2[4] = arg5;
        jam2[5] = arg6;
        jam2[6] = arg7;
        jam2[7] = arg8;
        jam2[8] = arg9;
        jam2[9] = arg10;
        jam2[10] = arg11;
    }
}

function get_moves(arg0)
{
    port_info = arg0;
    res_jam(1);
    jam[0] = 0;
    jam[1] = 0;
    jam[2] = 0;
    kris = g_t("b_actionTextKris");
    susie = g_t("b_actionTextSusie");
    ralsei = g_t("b_actionTextRalsei");
    store_moves("act1", kris[0], 0, "", 0, "NP");
    store_moves("actAlone", kris[1], 0, kris[2], 50, "NP");
    store_moves("actAll", kris[3], 0, kris[4], 100, "SA,needsEveryone");
    store_moves("actSusieHelp", kris[5], 0, kris[6], 100, "SA,needsNotSusie");
    store_moves("modifyS", susie[0], 1, susie[1], 25, "AA");
    store_moves("rudeBuster", susie[2], 0, susie[3], 50, "EP");
    store_moves("ultimatHeal", susie[4], 0, susie[5], 100, "PP");
    store_moves("modifyR", ralsei[0], 1, ralsei[1], 25, "AA");
    store_moves("pacify", ralsei[2], 0, ralsei[3], 16, "EP");
    store_moves("healPrayer", ralsei[4], 0, ralsei[5], 32, "PP");
    store_moves("sAction", "S-Action", 1, "_cgWHAT", 0, "AA");
    store_moves("rAction", "R-Action", 1, "_cgWHAT", 0, "AA");
}

function store_moves(arg0, arg1, arg2, arg3, arg4, arg5)
{
    if (port_info == arg0)
    {
        res_jam(0);
        jam[0] = arg1;
        jam[1] = arg2;
        jam[2] = arg3;
        jam[3] = arg4;
        jamSeed = string_split(arg5, ",");
    }
}

function get_items(arg0)
{
    port_info = arg0;
    res_jam(1);
    jam[0] = "Skip";
    store_items("item1", "Item 1", 20, "_cgWHAT", "eatOne");
    store_items("item2", "Item 2", 999, "_cgWHAT", "eatAll");
    store_items("yolkPudd", op.itemsText[0], 10, op.itemsText[1], "eatOne");
    store_items("sockRoll", op.itemsText[2], 50, op.itemsText[3], "eatOne");
    store_items("starfruit", op.itemsText[4], 100, op.itemsText[5], "eatOne");
    store_items("amperSand", op.itemsText[6], 80, op.itemsText[7], "eatOne,randomEffect");
    store_items("podCake", op.itemsText[8], 200, op.itemsText[9], "eatAll");
    store_items("brakPot", op.itemsText[10], 130, op.itemsText[11], "eatOne");
    store_items("bonemeal", op.itemsText[12], 100, op.itemsText[13], "eatOne");
}

function store_items(arg0, arg1, arg2, arg3, arg4)
{
    if (port_info == arg0)
    {
        res_jam(0);
        jam[0] = arg1;
        jam[1] = arg2;
        jam[2] = arg3;
        jamSeed = string_split(arg4, ",");
    }
}
