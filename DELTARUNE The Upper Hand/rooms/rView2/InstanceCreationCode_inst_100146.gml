op.camMode = "player";
op.parameter = [0, 0, 0, 0];
ow_music(mus_Steam_Jams);
op.eggCounter++;
op.eggCounter = 0;

if (!array_contains(op.progress, "view"))
    array_push(op.progress, "view");
