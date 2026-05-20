ty++;

if (ty == 1)
{
    if (arrayContains(obj_seed, "ow"))
        oPlayer.move = false;
}

use_keys();

if (waitZ > 0)
    waitZ--;

if (arrayContains(obj_seed, "keysOff") || op.twait > 0)
    res_keys();

if (arrayContains(obj_seed, "noSkip"))
{
    KeyX = false;
    KeyC = false;
}

if (KeyX || KeyC)
    spell = use_text[in];

if ((TapZ || KeyC) && waitZ == 0)
{
    TapZ = false;
    des(oMiniFace);
    
    if (spell == use_text[in])
    {
        waitZ = 2;
        in++;
        spell = "";
        sp = 0;
        
        if (in == array_length(use_text))
        {
            if (arrayContains(obj_seed, "ago"))
                oAActor.go = true;
            
            if (arrayContains(obj_seed, "bb"))
                oAActor.boxes--;
            
            if (funcEnd != -1)
                funcEnd();
            
            op.talkN = 0;
            
            with (oInteract)
                picked = 0;
            
            des(0);
        }
        else
        {
        }
    }
}
