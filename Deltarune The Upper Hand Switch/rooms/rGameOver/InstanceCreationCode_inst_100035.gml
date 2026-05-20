op.camMode = 0;
op.cameX = 0;
op.cameY = 0;
op.camX = 0;
op.camY = 0;
op.item = [];
res_i();

repeat (array_length(op.saveItem))
{
    array_push(op.item, op.saveItem[i]);
    i++;
}

res_i();
seed = "gameOver";
audio_stop_all();
screenShake(0, 0);
snd(snd_breakSoul);

with (instance_create_depth(op.soulX, op.soulY, 0, oDieParticle))
{
    mx = -5;
    my = -5;
}

with (instance_create_depth(op.soulX, op.soulY, 0, oDieParticle))
{
    mx = 6;
    my = -9;
}

with (instance_create_depth(op.soulX, op.soulY, 0, oDieParticle))
{
    mx = -2;
    my = -2;
}

with (instance_create_depth(op.soulX, op.soulY, 0, oDieParticle))
{
    mx = 3;
    my = 3;
}

with (instance_create_depth(op.soulX, op.soulY, 0, oDieParticle))
{
    mx = 7;
    my = -4;
}

if (op.alexMode)
    snd(mus_gameover_buster);
