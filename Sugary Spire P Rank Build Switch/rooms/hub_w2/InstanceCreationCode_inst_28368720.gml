targetRoom = sucrose_1;
targetDoor = "A";
level = "sucrose";
details = 
[
	gate_createlayer(spr_sucrose_startgate, 0),
	gate_createlayer(spr_sucrose_startgate, 1),
	gate_createlayer(spr_sucrose_startgate, 2, 1),
	gate_createlayer(spr_sucrose_startgate, 3, 0.66),
	gate_createlayer(spr_sucrose_startgate, 4, 0.33),
	gate_createlayer(spr_sucrose_startgatebg, 0, 0, 0, 0.35)
];
info = 
{
    bginfo: [spr_sucrosecard_bg, cardtype.left, cardtype.linear, cardtype.none, 0, 0],
    titleinfo: [spr_sucrosecard_title, cardtype.up, cardtype.interp, cardtype.waving, 0, 0],
    song: mu_bee_title
};
