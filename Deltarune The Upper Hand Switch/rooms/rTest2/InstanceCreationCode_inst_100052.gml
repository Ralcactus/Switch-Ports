text = "Camera X offset";
drawSelf = true;

func = function()
{
    if (op.cameX != 140)
        op.cameX += 20;
};

draw = function()
{
    print("CO X: " + string(op.cameX), 520, 520, undefined, undefined, ["bc2", "force_ENG"]);
};
