global.startingseed = random_get_seed();

function reroll()
{
    randomise();
    global.startingseed = random_get_seed();
}

function chance(_val)
{
    return random(100) <= _val;
}

function do_specific(_func)
{
    random_set_seed(global.startingseed + real(room) + x + y);
    _func();
    random_set_seed(global.startingseed);
}
