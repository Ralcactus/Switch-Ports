namefadeout = false;
namefade = 1;
alarm[0] = 170;
roles = string_get("credits/roles");
var _rolelen = array_length(roles);
rolenames = array_create(_rolelen);

for (var i = 0; i < _rolelen; i++)
{
    if (i == 5)
    {
        var _contstr = string_get("credits/continue");
        var _names = string_get("pumpkins");
        var _nlen = array_length(_names);
        var _realroles = array_create(_nlen);
        var _role = 0;
        
        for (var _i = 0; _i < _nlen; _i++)
        {
            var _pumpkins = _names[_i];
            var _p = array_length(_pumpkins) - 1;
            var _continue = false;
            
            while (_p > 0)
            {
                var _amt = min(_p, 6);
                var _arr = array_create(_amt + 1);
                _arr[0] = _pumpkins[0];
                
                if (_continue)
                    _arr[0] += string(" {0}", _contstr);
                
                array_copy(_arr, 1, _pumpkins, array_length(_pumpkins) - _p, _amt);
                _realroles[_role++] = _arr;
                _p -= _amt;
                _continue = true;
            }
        }
        
        rolenames[i] = _realroles;
    }
    else
        rolenames[i] = string_get(string("credits/role{0}", i));
}

currrole = array_shift(roles);
currnamelist = array_shift(rolenames);
currname = array_shift(currnamelist);
cursorspr = spr_creditscursor;
cursorind = 0;
anim = 0;
anim2 = 0;
pumpkinind = 0;
baseanimspd = 0.01;
slowanimspd = 0.001;
animspd = baseanimspd;
animspd2 = baseanimspd;
slowrangea = 0.2;
slowrangeb = 0.5;
next = false;
endshot = false;
endfade = 0;
endtiptimer = 100;
endtipstr = string_get("credits/endshottip");
spawnnoisetimer = irandom_range(30, 200);
perfectrun = true;
perfectstrs = string_get("credits/perfect");
perfectwidths = array_create(2);
draw_set_font(global.font);

for (var _i = 0; _i < array_length(perfectwidths); _i++)
    perfectwidths[_i] = string_width_fancy(perfectstrs[_i]);

perfectstep = 1/15;
perfectfade = 0;
