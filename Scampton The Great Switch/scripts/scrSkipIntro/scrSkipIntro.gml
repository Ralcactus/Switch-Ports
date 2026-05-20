function scrSkipIntro()
{
    oAlways.MM_Cursor = 0;
    oKris.Tyme = 0;
    oSusie.Tyme = 0;
    oRalsei.Tyme = 0;
    oSpamtonRig.Animation = "Dang_A";
    oAlways.BCspeed = 1;
    oSpamtonRig.Index_Head = 15;
    oSpamtonRig.Index_Arms = 18;
    oSpamtonRig.Index_Halo = 26;
    oSpamtonRig.Index_Torso = 39;
    oSpamtonRig.AnSpeed = 0.25;
    oSpamtonRig.Index_String1 = 13;
    oSpamtonRig.String_Arms = true;
    oSpamtonRig.FallY = 500;
    oSpamtonRig.Needle = 3;
    oSpamtonRig.StringShake = 4;
    instance_create_depth(0, 0, -1000, oMakeUI);
    instance_destroy(oTextEngine);
    instance_destroy(oCC);
    
    with (instance_create_depth(0, 0, 0, oCC))
        Seed = "SetWings";
}
