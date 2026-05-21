targetRoom = dance_1;
targetDoor = "A";
level = "dance";
targetRoom = dance_1;
info = 
{
    bginfo: [spr_dancecard_bg, cardtype.left, cardtype.linear, cardtype.none, 0, 0],
    titleinfo: [spr_dancecard_title, cardtype.up, cardtype.interp, cardtype.waving, 0, 0],
    song: mu_bee_title
};
details = 
[
	gate_createlayer(spr_dance_startgate, 0), 
	gate_createlayer(spr_dance_startgate, 1), 
	gate_createlayer(spr_dance_startgate, 4, 1), 
	gate_createlayer(spr_dance_startgate, 3, 0.66), 
	gate_createlayer(spr_dance_startgate, 2, 0.33)
];
