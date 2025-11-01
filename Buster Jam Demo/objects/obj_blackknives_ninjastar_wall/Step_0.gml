testvariablenothing = false;
var _amnt = 20;
var _xshake = irandom_range(-_amnt, _amnt) * shake;
var _yshake = irandom_range(-_amnt, _amnt) * shake;
x = xstart + _xshake;
y = ystart + _yshake;
shake = approach(shake, 0, 0.125);
