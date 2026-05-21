targetRoom = steamy_1;
targetDoor = "A";
level = "steamy";
details = 
[
	gate_createlayer(spr_steamy_startgate, 0), 
	gate_createlayer(spr_steamy_startgate, 1), 
	gate_createlayer(spr_steamy_startgate, 2, 0.9), 
	gate_createlayer(spr_steamy_startgate, 3, 0.75), 
	gate_createlayer(spr_steamy_startgate, 4, 0.55), 
	gate_createlayer(spr_steamy_startgate, 5, 0.05), 
	gate_createlayer(spr_steamy_startgate, 6, 0.35), 
	gate_createlayer(spr_steamy_startgate, 7)
];
info = 
{
    bginfo: [spr_entrycard_bg, cardtype.left, cardtype.linear, cardtype.none, 0, 0],
    titleinfo: [spr_entrycard_title, cardtype.up, cardtype.interp, cardtype.waving, 672, 160],
    song: mu_cotton_title
};
