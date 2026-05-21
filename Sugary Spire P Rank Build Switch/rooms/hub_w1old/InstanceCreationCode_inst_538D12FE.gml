targetRoom = mines_1;
targetDoor = "A";
level = "mines";
details = 
[
	gate_createlayer(spr_mines_startgate, 0), 
	gate_createlayer(spr_mines_startgate, 1), 
	gate_createlayer(spr_mines_startgate, 2, 1), 
	gate_createlayer(spr_mines_startgate, 3, 0.66), 
	gate_createlayer(spr_mines_startgate, 4, 0.33)
];
info = 
{
    bginfo: [spr_entrycard_bg, cardtype.left, cardtype.linear, cardtype.none, 0, 0],
    titleinfo: [spr_entrycard_title, cardtype.up, cardtype.interp, cardtype.waving, 672, 160],
    song: mu_mines_title
};
