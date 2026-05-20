ext(sPixel, 0, 5, 5, 400, 300, 0, 0, 1);
res_i();

repeat (array_length(text))
{
    d_text(30, 10 + (i * 15), text[i]);
    
    if (i == 1)
    {
        if (oBUI.loop)
            d_text(200, 10 + (i * 15), "(true)");
        else
            d_text(200, 10 + (i * 15), "(false)");
    }
    
    i++;
}

ext(sSoul, 0, 20, 18 + (cur * 15), 0.5, 0.5);
d_text(200, 55, "attack: " + string(op.attackSel));
