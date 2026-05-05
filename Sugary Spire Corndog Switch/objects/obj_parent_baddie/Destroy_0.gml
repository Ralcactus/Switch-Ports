if (ds_list_find_index(global.BaddieRoom, id) != -1 && !importantEnemy)
    exit;
	
if (instance_exists(obj_sucroseTimer))
	obj_sucroseTimer.addseconds += 3;
		
repeat (3)
{
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddieGibs);
}

create_particle(x, y + 30, spr_bangEffect);
camera_shake_add(3, 3);
spawnBaddieDeadParticle();

if (chance(0.05))
    event_play_oneshot("event:/SFX/enemies/deathscream", x, y);

event_play_oneshot("event:/SFX/player/punch");
event_play_oneshot("event:/SFX/enemies/kill");

if (importantEnemy)
    exit;

if (giveScore)
{
    obj_parent_player.superTauntBuffer++;
    global.Combo++;
    var _score = 10 + floor(global.Combo / 2);
    create_small_number(x, y, string(_score));
    global.Collect += _score;
    global.ComboScore += _score;
    global.ComboTime = 60;
    global.style += 4;
    global.ComboFreeze = 30;
    
    if (obj_parent_player.state == UnknownEnum.Value_159)
        obj_parent_player.vampireBlood++;
}

ds_list_add(global.BaddieRoom, id);

if (escapeEnemy)
    ds_list_add(global.EscapeRoom, id);
