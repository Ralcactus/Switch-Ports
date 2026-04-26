var values;
values[0] = false;
var i = 0;

with (obj_parent_logicobjects)
{
    if (outputID == other.inputID)
        values[i++] = logicOutput;
}

var check = true;

for (i = 0; i < array_length(values); i++)
{
    if (!values[i])
    {
        check = false;
        break;
    }
}

logicOutput = check;

with (obj_parent_logicobjects)
{
    if (inputID == other.outputID)
    {
        logicOutput = check;
        break;
    }
}
