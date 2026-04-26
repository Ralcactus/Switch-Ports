if (collected == false)
{
    visible = false;
    global.keyPiece += 1;
    scr_controlprompt("[spr_promptfont]You have found " + string(global.keyPiece) + ((global.keyPiece > 1) ? " keys out of 1?" : " key out of 1?"), -4, 150);
    collected = true;
    event_user(0);
}
