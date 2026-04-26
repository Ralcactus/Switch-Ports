targetRoom = dance_1;
targetDoor = "A";
level = "dance";
targetRoom = dance_1;
info = 
{
    bginfo: [spr_dancecard_bg, UnknownEnum.Value_2, UnknownEnum.Value_4, UnknownEnum.Value_8, 0, 0],
    titleinfo: [spr_dancecard_title, UnknownEnum.Value_0, UnknownEnum.Value_5, UnknownEnum.Value_6, 0, 0],
    song: "event:/music/w2/danceoff_titlecard"
};
details = [gate_createlayer(spr_dance_startgate, 0), gate_createlayer(spr_dance_startgate, 1), gate_createlayer(spr_dance_startgate, 4, 1), gate_createlayer(spr_dance_startgate, 3, 0.66), gate_createlayer(spr_dance_startgate, 2, 0.33)];
