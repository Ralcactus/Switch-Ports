if (Add)
{
    Add = false;
    jRow += 1;
}

if (StickExist != 0)
{
    StickExist -= 1;
}
else if (alph != 0)
{
    if ((round(Tyme / 2) * 2) == Tyme)
        alph -= 0.1;
}
else
{
    oActionSET.Stop = true;
    instance_destroy(oFightStick);
    instance_destroy();
}

draw_sprite_ext(sFightHuds, 3, 79, 403, 1.78, 1, 0, c_white, alph);
draw_sprite_ext(sFightHuds, 3, 79, 441, 1.78, 1, 0, c_white, alph);

if (oMakeUI.Actions[0] == "1_1_NAME")
{
    scrSha_RGBa(Wh, Wh, Wh, 0);
    draw_sprite_ext(sFightHuds, 0, 79, 365, 1, 1, 0, c_white, alph);
    shader_reset();
    draw_sprite_ext(sFightHuds, 4, -49, 368, 1, 1, 0, c_white, alph);
    draw_sprite_ext(sFightHuds, 8, 79, 365, 1, 1, 0, c_white, alph);
}

if (oMakeUI.Actions[1] == "2_1_NAME")
{
    scrSha_RGBa(Wh, Wh, Wh, 0);
    draw_sprite_ext(sFightHuds, 1, 79, 403, 1, 1, 0, c_white, alph);
    shader_reset();
    draw_sprite_ext(sFightHuds, 5, -49, 406, 1, 1, 0, c_white, alph);
    draw_sprite_ext(sFightHuds, 9, 79, 403, 1, 1, 0, c_white, alph);
}

if (oMakeUI.Actions[2] == "3_1_NAME")
{
    scrSha_RGBa(Wh, Wh, Wh, 0);
    draw_sprite_ext(sFightHuds, 2, 79, 441, 1, 1, 0, c_white, alph);
    shader_reset();
    draw_sprite_ext(sFightHuds, 6, -49, 444, 1, 1, 0, c_white, alph);
    draw_sprite_ext(sFightHuds, 10, 79, 441, 1, 1, 0, c_white, alph);
}

if (Wh != 0)
    Wh -= 0.1;
