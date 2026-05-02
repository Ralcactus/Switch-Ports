targetRoom = licorice_1;
targetDoor = "A";
level = "licorice";
info = 
{
    bginfo: [spr_itsnotsugar_bg, UnknownEnum.Value_2, UnknownEnum.Value_4, UnknownEnum.Value_8, 0, 0],
    titleinfo: [spr_itsnotsugar_title, UnknownEnum.Value_0, UnknownEnum.Value_5, UnknownEnum.Value_6, 0, 0],
    song: "event:/music/w2/bee_titlecard"
};
details = [gate_createlayer(spr_bee_startgate, 0), gate_createlayer(spr_bee_startgate, 1), gate_createlayer(spr_bee_startgate, 2, 0.77), gate_createlayer(spr_bee_startgate, 3, 0.35), gate_createlayer(spr_bee_startgate, 4, 0.35)];

with (details[2])
{
    func = function()
    {
        y = wave(5, 18, 2, 0, x * 10);
    };
}
