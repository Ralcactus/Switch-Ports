var _values;
_values[0] = false;
var i = 0;

with (obj_parent_logicobjects)
{
    if (outputID == other.inputID)
        _values[i++] = logicOutput;
}

var _check = false;

for (i = 0; i < array_length(_values); i++)
{
    if (_values[i])
    {
        _check = true;
        break;
    }
}

logicOutput = _check;

with (obj_parent_logicobjects)
{
    if (inputID == other.outputID)
    {
        logicOutput = _check;
        break;
    }
}
