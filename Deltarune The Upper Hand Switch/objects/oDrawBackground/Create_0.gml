depth = 250;
surf = -1;
surf2 = -1;
draw = true;
fogAlpha = 1;
circles = [sBBGglow, sBBGglow2nd, sBBGglow3rd];
style = 0;

if (op.challengeMode)
    style = 1;

if (op.superMode || op.customMode)
    style = 2;
