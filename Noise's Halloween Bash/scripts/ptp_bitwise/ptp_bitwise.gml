function bit_set(_bit, _pos, _clear_bit = false)
{
    if (_clear_bit) return _bit & ~(1 << _pos);
    if (!_clear_bit) return _bit | (1 << _pos);
}

function bit_get(_bit, _pos)
{
    return (_bit >> _pos) & 1;
}

function bit_toggle(_bit, _pos)
{
    return _bit ^ (1 << _pos);
}

function bit_flip(_bit)
{
    return ~_bit;
}

function bit_mask(_bit, _mask)
{
    return _mask & _bit;
}

function bit_count(_bit)
{
	var _ones = 0;
    for (; _bit != 0; _ones++)// because its spooky season kinda not really
        _bit &= (_bit - 1);
    
    return _ones;
}
