testvariablenothing = false;

if (instance_exists(obj_frenzy) && obj_frenzy.games_done)
    exit;

var _pick;

if (loss)
    _pick = trans_lose;
else
    _pick = trans_order[trans_done];

var _inst = instance_create_layer(0, 0, layer, _pick);
trans_done++;
hp_x = _inst.hp_x;
hp_y = _inst.hp_y;
score_x = _inst.score_x;
score_y = _inst.score_y;
hp_beat = 0;
