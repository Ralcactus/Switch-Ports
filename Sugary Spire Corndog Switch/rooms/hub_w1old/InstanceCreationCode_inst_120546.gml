targetRoom = mines_1;
targetDoor = "A";
level = "mines";
details = [gate_createlayer(spr_mines_startgate, 0), gate_createlayer(spr_mines_startgate, 1), gate_createlayer(spr_mines_startgate, 2, 1), gate_createlayer(spr_mines_startgate, 3, 0.66), gate_createlayer(spr_mines_startgate, 4, 0.33)];
info = 
{
    bginfo: [spr_entrycard_bg, UnknownEnum.Value_2, UnknownEnum.Value_4, UnknownEnum.Value_8, 0, 0],
    titleinfo: [spr_entrycard_title, UnknownEnum.Value_0, UnknownEnum.Value_5, UnknownEnum.Value_6, 672, 160],
    song: "event:/music/w1/mines_titlecard"
};
