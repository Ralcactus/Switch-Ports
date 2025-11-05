function lerpAngle(_angleA, _angleB, _amount)
{
    var _return = _angleA + (angle_difference(_angleB, _angleA) * _amount);
    
    while (_return < 0) 
		_return += 360;
    while (_return > 360) 
		_return -= 360;
    
    return _return;
}

function wrap(_val, _min, _max)
{
    var range = (_max + 1) - _min;
    var _wrapped = ((((_val - _min) % range) + range) % range) + _min;
    
    if (_wrapped > _max)
        _wrapped = _min + frac(_wrapped);
    
    return _wrapped;
}

function approach(_value1, _value2, _amount)
{
    return median(_value1 - _amount, _value2, _value1 + _amount);
}

function wave(_min, _max, _wavelength, _offset = 0, _time = current_time)
{
    var _half = (_max - _min) * 0.5;
    return _min + _half + (sin(((((_time + _offset) * 0.001) + _wavelength) / _wavelength) * (2 * pi)) * _half);
}

function easy_sin(_val)
{
    return sin(_val * pi);
}

function calculate_projectile_motion(_startX, _startY, _targetX, _targetY, _grav, _time)
{
    _targetY = _startY - (_targetY - _startY);
    var _hsp = (_targetX - _startX) / _time;
    var _vsp = ((_targetY - _startY) + (0.5 * _grav * sqr(_time))) / _time;
    return 
    {
        hsp: _hsp,
        vsp: -_vsp
    };
}

function calculate_jump(_value1, _value2)
{
    return -sqrt(2 * _value2 * _value1);
}

function calculate_jump_height(_value1, _value2)
{
    return sqr(_value1) / (2 * _value2);
}
