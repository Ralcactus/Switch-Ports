time[0]++;
time[1]++;
glowWhite = 0;

if (oBUI.eNamesT && oBUI.cur == numb)
    glowWhite = 0.5 + (sin(op.ti * 0.05) * 0.5);

if (popWhite > 0)
    popWhite -= 0.1;

mw = glowWhite + popWhite;
mx = x + eX;
my = y + eY;
drawPlace = 0;

if (drawL == 0 || drawL == 2)
{
    drawStars("u");
    draw();
    drawStars("d");
}

if (!op.susieStuck && canChangeStats)
{
    canChangeStats = false;
    set_enemieStats("test_1", false);
}
