ext(sBoxOW, 0, 24, 312 + _y);
res_i();

if (cur == 0)
    i1 = 65535;
else
    i1 = 16777215;

print(text[0], 88, 382 + _y, undefined, i1, ["prop"]);
res_i();

if (cur == 1)
    i1 = 65535;
else
    i1 = 16777215;

print(text[1], 552, 382 + _y, undefined, i1, ["prop", "left"]);

if (cur == -1)
    _x = 320 + offset;

if (cur == 0)
    _x = 68;

if (cur == 1)
    _x = 532 - (print_length(text[1], sFont1, 1) * 2);

ext(sSymb, 7, _x, 392 + _y, undefined, undefined, undefined, 255);
