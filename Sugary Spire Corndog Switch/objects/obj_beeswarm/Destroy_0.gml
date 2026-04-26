var prev_bee = -4;
var next_bee = -4;

with (obj_beeswarm)
{
    if (true && linePosition != -1)
    {
        if (linePosition == (other.linePosition - 1))
            next_bee = self;
        else if (linePosition == (other.linePosition + 1))
            prev_bee = self;
        
        if (linePosition > other.linePosition)
            linePosition = max(linePosition - 1, 0);
    }
}

if (prev_bee != -4)
{
    if (next_bee != -4)
        prev_bee.entityToFollow = next_bee;
    else
        prev_bee.entityToFollow = obj_parent_player;
}

if (ds_list_find_index(global.BaddieRoom, id) != -1 && !importantEnemy)
    exit;

repeat (3)
{
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddieGibs);
}

instance_create(x, y + 30, obj_bangEffect);
camera_shake_add(3, 3);
spawnBaddieDeadParticle();

if (chance(0.05))
    event_play_oneshot("event:/SFX/enemies/deathscream", x, y);

event_play_oneshot("event:/SFX/player/punch");

if (importantEnemy)
    exit;

event_play_oneshot("event:/SFX/enemies/kill");
obj_parent_player.superTauntBuffer++;
global.Combo++;
var _score = 10 + floor(global.Combo / 2);
create_small_number(x, y, string(_score));
global.Collect += _score;
global.ComboTime = 60;
global.style += 4;
global.ComboFreeze = 30;

with (obj_sucroseTimer)
    timer += time_in_frames(0, 3);

ds_list_add(global.BaddieRoom, id);

if (escapeEnemy)
    ds_list_add(global.EscapeRoom, id);
