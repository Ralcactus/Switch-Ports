targetRoom = mountain_intro;
targetDoor = "A";
level = "fudge";
var a = gate_createlayer(spr_fudge_startgate, 5, 0, 0);

with (a)
    drawy = 50;

details = 
[
	gate_createlayer(spr_fudge_startgate, 0), 
	gate_createlayer(spr_fudge_startgate, 1), 
	gate_createlayer(spr_fudge_startgate, 2, 1), 
	gate_createlayer(spr_fudge_startgate, 3, 0.66), 
	gate_createlayer(spr_fudge_startgate, 4, 0.33),
	a
];
info = 
{
    bginfo: [spr_fudgecard_bg, cardtype.left, cardtype.linear, cardtype.none, 0, 0],
    titleinfo: [spr_fudgecard_title, cardtype.up, cardtype.interp, cardtype.waving, 0, 0],
    song: mu_entryway_title
};
