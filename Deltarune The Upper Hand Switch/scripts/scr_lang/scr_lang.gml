function lang_amount()
{
    op.languageAmount = 3;
}

function lang_quit()
{
    if (room == rMainMenu)
    {
        if (op.language == 1)
            ext(sQuit, floor(escape / 10), 4, 4, undefined, undefined, undefined, undefined, escape / 10);
        
        if (op.language == 2)
            ext(sQuit_rus, floor(escape / 10), 4, 4, undefined, undefined, undefined, undefined, escape / 10);
        
        if (op.language == 3)
            ext(sQuit_ita, floor(escape / 10), 4, 4, undefined, undefined, undefined, undefined, escape / 10);
    }
}

function meme_music()
{
    op.meme_music = [mus_INTERSTELLAR_BOOGALOO, mus_space_jam_rus, mus_INTERSTELLAR_BOOGALOO];
}

function extras_smallTextOffset(arg0)
{
    if (op.language == 1)
        return 0;
    
    if (op.language == 2)
    {
        if (arg0 == 0)
            return -60;
        
        if (arg0 == 1)
            return 20;
        
        if (arg0 == 2)
            return -30;
        
        if (arg0 == 3)
            return 30;
        
        if (arg0 == 4)
            return 30;
        
        if (arg0 == 5)
            return 40;
    }
    
    if (op.language == 3)
    {
        if (arg0 == 0)
            return 10;
        
        if (arg0 == 1)
            return 0;
        
        if (arg0 == 2)
            return 30;
        
        if (arg0 == 3)
            return 30;
        
        if (arg0 == 4)
            return 0;
        
        if (arg0 == 5)
            return 20;
    }
    
    return 0;
}

function font_fixer()
{
    if (op.language == 2)
    {
        if (use_font[in] == sFont1)
            use_font[in] = sFont1_rus;
        
        if (use_font[in] == sFontPapyrus)
            use_font[in] = sFontPapyrus_rus;
        
        if (use_font[in] == sFontSans)
            use_font[in] = sFontSans_rus;
        
        if (use_font[in] == sFontSock)
            use_font[in] = sFontSock_rus;
    }
}
