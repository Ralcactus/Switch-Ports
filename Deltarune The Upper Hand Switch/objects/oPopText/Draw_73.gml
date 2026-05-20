res_i();

repeat (string_length(text))
{
    i++;
    cl = string_char_at(text, i);
    
    if (cl == "+" || cl == "-" || cl == "%")
    {
        if (cl == "+")
            ext(sprite, 10, x + i1, y, xSc, ySc, 0, color, alpha, 0);
        
        if (cl == "-")
            ext(sprite, 11, x + i1, y, xSc, ySc, 0, color, alpha, 0);
        
        if (cl == "%")
            ext(sprite, 12, x + i1, y, xSc, ySc, 0, color, alpha, 0);
    }
    else
    {
        ext(sprite, real(cl) + ((op.language - 1) * 4 * (sprite != sPopRed && sprite != sPopWhite && sprite != sPopYellow)), x + i1, y, xSc, ySc, 0, color, alpha, 0);
    }
    
    i1 += 20;
}
