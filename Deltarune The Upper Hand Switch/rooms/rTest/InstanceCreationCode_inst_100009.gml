audio_stop_all();
ow_music_stop();
op.debug = true;
op.camMode = "player";
op.parameter = [0, 400, 0, 100];
op.cameX = 0;
op.cameY = 0;
oPlayer.move = true;
oPlayer.draw = true;
oPlayer.freeMove = false;
op.drawFollow = true;
op.gold = 790;
op.progress = [];
op.item = [];
spawn_follow();
op.eggCounter = 10;
fix_res();
ow_music(mus_Memories_Of_HQ);

funcDraw = function()
{
    print("Press escape at any time to return to this room.", 288, 208, undefined, undefined, ["bc2", "force_ENG"]);
    print("Music: ¤Memories Of HQ¤ from _cyCruelty Squad", 40, 340, undefined, undefined, ["bc2", "force_ENG"]);
};
