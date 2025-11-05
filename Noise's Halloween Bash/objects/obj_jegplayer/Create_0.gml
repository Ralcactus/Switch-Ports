stop_music();
walls = -1;
yaw = -90;
cursorrange = 128;
cursorspr = spr_creditscursor;
cursorind = 0;
showcursor = false;
showjeg = false;
jegtransition = 0;
jegposx = 0;
jegposy = 0;
jegscale = 0;
secretstr = string_get("experience");

for (var _i = 0; _i < array_length(secretstr); _i++)
    secretstr[_i] = string_shift(secretstr[_i], 10132);

collided = ds_list_create();
subx = 0;
suby = 0;
noclip = false;
