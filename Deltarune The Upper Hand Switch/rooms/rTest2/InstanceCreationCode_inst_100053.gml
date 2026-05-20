text = "Camera Y offset";
drawSelf = true;

func = function()
{
    if (op.cameY != 140)
        op.cameY += 20;
};

draw = function()
{
    print("CO Y: " + string(op.cameY), 520, 540, undefined, undefined, ["bc2"]);
};
