targetRoom = casino_1;
targetDoor = "A";
level = "casino";
depth = 101;
var a = gate_createlayer(spr_fudge_startgate, 5, 0, 0);

with (a)
    y = 50;

details = [gate_createlayer(spr_fudge_startgate, 0), gate_createlayer(spr_fudge_startgate, 1), gate_createlayer(spr_fudge_startgate, 2, 1), gate_createlayer(spr_fudge_startgate, 3, 0.66), gate_createlayer(spr_fudge_startgate, 4, 0.33), a];
info = 
{
    bginfo: [spr_placeholdercard_bg, UnknownEnum.Value_2, UnknownEnum.Value_4, UnknownEnum.Value_8, 0, 0],
    titleinfo: [spr_placeholdercard_title, UnknownEnum.Value_0, UnknownEnum.Value_5, UnknownEnum.Value_6, 0, 0],
    song: "event:/music/w2/mountain_titlecard"
};
