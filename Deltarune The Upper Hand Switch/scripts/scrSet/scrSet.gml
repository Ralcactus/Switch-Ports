function set_enemieStats(arg0, arg1 = true)
{
    port_info = arg0;
    pepOrder = 0;
    movesStore = 0;
    countNumbStore = 0;
    AA = 0;
    countFlavour = 0;
    
    if (arg0 == "test_1")
    {
        AA = 0;
        
        if (arg1)
            store_enemieStats(op.statsText[3], 15500);
        
        var actString = "act1";
        
        if (op.susieStuck)
            actString += ",actSusieHelp";
        else
            actString += ",actAlone,actAll";
        
        movesGive("kris", actString);
        movesGive("susie", "modifyS,rudeBuster,ultimatHeal");
        movesGive("ralsei", "modifyR,pacify,healPrayer");
        var flavourText = g_t("b_flavourText");
        var tutorialText = g_t("s_1");
        flavour(flavourText[0]);
        
        if (op.gamepad == 0)
            flavour("* " + tutorialText[0] + "[" + keysText2(op.keys[2][1]) + "]" + tutorialText[1]);
        
        if (op.gamepad != 0)
            flavour("* " + tutorialText[0] + op.gp1 + tutorialText[1]);
        
        flavour(flavourText[1]);
        flavour(flavourText[2]);
        flavour(flavourText[3]);
        flavour(flavourText[4]);
        flavour(flavourText[5]);
        flavour(flavourText[6]);
        flavour(flavourText[7]);
        flavour(flavourText[8]);
        flavour(flavourText[9]);
        flavour(flavourText[10]);
        flavour(flavourText[11]);
    }
}

function store_enemieStats(arg0, arg1)
{
    with (instance_create_depth(0, 0, 0, oManagerE))
    {
        inf_realName = other.port_info;
        numb = other.numb;
    }
    
    inf_realName = port_info;
    inf_writeName = arg0;
    inf_MAXhp = arg1;
    inf_hp = arg1;
    inf_spareP = 0;
}

function get_enemieStats(arg0)
{
    var i = 0;
    res_jam(0);
    jam_movesStore = 0;
    
    with (oEnemie)
    {
        if (inf_realName == arg0)
        {
            other.jam[0] = inf_realName;
            other.jam[1] = inf_writeName;
            other.jam[2] = AA;
            other.jam[3] = inf_MAXhp;
            other.jam[4] = inf_hp;
            other.jam[5] = inf_spareP;
            i = 0;
            
            while (pepOrder[i] != op.party[oBUI.pep])
                i++;
            
            other.jam_movesStore = string_split(movesStore[i], ",");
        }
    }
}

function movesGive(arg0, arg1)
{
    pepOrder[countNumbStore] = arg0;
    movesStore[countNumbStore] = arg1;
    countNumbStore++;
}

function flavour(arg0)
{
    _flavour[countFlavour] = arg0;
    countFlavour++;
}
