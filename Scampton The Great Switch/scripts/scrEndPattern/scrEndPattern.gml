function scrEndPattern()
{
    oMakeUI.Turns++;
    oSpamtonRig.MoveMode = true;
    oSpamtonRig.AnMode = oSpamtonRig.LastAn;
    
    with (oParryWalk)
    {
        oTP.TP += _TP;
        _TP = 0;
    }
    
    instance_destroy(oBlueAttack);
    instance_destroy(oWhiteAttack);
    instance_destroy(oParryAttack);
    instance_destroy(oBA_Destroy);
    instance_destroy(oBigBulletEffect);
    instance_destroy(oBigBullet);
    instance_destroy(oBullet);
    instance_destroy(oChield);
    instance_destroy(oChield_2);
    
    with (instance_create_depth(0, 0, 0, oEEF))
        Seed = "BlackB2_2";
    
    oSoul.EndX = oSoul.x;
    oSoul.EndY = oSoul.y;
    oSoul.Seed = "EndPattern";
    oSoul.CanShot = false;
    oSoul.CanMove = false;
    oBox.End = true;
    oSpamtonRig.Animation = "Dang_A";
    oSpamtonRig.AnSpeed = 0.25;
    oSpamtonRig.Index_Head = 15;
    oBox.HomeX = (oSpamtonRig.SaveX - oSpamtonRig.BodX) / 15;
    oBox.HomeY = (oSpamtonRig.SaveY - oSpamtonRig.BodY) / 15;
    oAlways.SoulSpez = false;
    instance_destroy();
}
