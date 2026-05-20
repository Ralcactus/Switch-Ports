if (An || End)
{
    if ((round(oAlways.Tyme / 2) * 2) == oAlways.Tyme)
    {
        with (instance_create_depth(x, y, -9999, oBoxEffect))
        {
            image_angle = oBox.image_angle;
            image_xscale = oBox.image_xscale - 0.5;
            image_yscale = oBox.image_yscale - 0.5;
        }
        
        if (End)
        {
            oMakeUI.HUDy += ((0 - oMakeUI.HUDy) / 3);
            oTP.ExtraX += ((0 - oTP.ExtraX) / 3);
            
            if (oMakeUI.Spare >= (100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100)))
            {
                if (oMakeUI.Spare > 14)
                    oSpamtonRig.AnMode = 1;
                
                if (oMakeUI.Spare > 40)
                    oSpamtonRig.TT = oMakeUI.Spare;
            }
            else
            {
                if ((100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100)) > 14)
                    oSpamtonRig.AnMode = 1;
                
                if ((100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100)) > 40)
                    oSpamtonRig.TT = 100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100);
            }
            
            if (!oMakeUI.BoxEEF)
                image_alpha = 0;
            
            image_xscale -= (oMakeUI.Box_Xscale / 15);
            image_yscale -= (oMakeUI.Box_Yscale / 15);
            image_angle -= 12;
            
            if (image_xscale <= 0)
            {
                oMakeUI.HUDy = 0;
                oTP.ExtraX = 0;
                oSpamtonRig.depth = 750;
                des(0);
            }
            
            if (oMakeUI.Pattern != "L1")
            {
                oSpamtonRig.BodX += HomeX;
                oSpamtonRig.BodY += HomeY;
            }
            else
            {
                oSpamtonRig.BodX = oSpamtonRig.SaveX;
                oSpamtonRig.BodY = oSpamtonRig.SaveY;
            }
        }
        else
        {
            image_xscale += (oMakeUI.Box_Xscale / 15);
            image_yscale += (oMakeUI.Box_Yscale / 15);
            image_angle += 12;
            
            if (image_xscale == oMakeUI.Box_Xscale)
            {
                An = false;
                image_angle = 0;
                instance_create_depth(0, 0, 0, oPattern);
            }
        }
    }
}

if (!An && !End)
{
    image_xscale = oMakeUI.Box_Xscale;
    image_yscale = oMakeUI.Box_Yscale;
    x = oMakeUI.Box_X;
    y = oMakeUI.Box_Y;
}
