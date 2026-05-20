if (funcDraw != -1)
    funcDraw();

if (seed == "gameOver")
{
    if (ty > 30)
    {
        ext(sGameOver, op.language, 320, 240, 2, 2, 0, 16777215, 1, 0);
        print(text[0], 320, 300, undefined, undefined, ["mid"]);
        print(text[1], 320, 330, undefined, undefined, ["mid"]);
        ext(sSymb, 7, 304 - (print_length(text[i], sFont1, 2) * 2), 310 + (30 * i), undefined, undefined, undefined, 255);
    }
    
    ext(sGameOver, 0, 320, 240, 2, 2, 0, 16777215, i2, 0);
}
