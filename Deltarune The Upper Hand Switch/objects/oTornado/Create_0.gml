depth = -2000;
t = 0;
grab = false;

function drawtrash(arg0, arg1 = 0, arg2 = 0, arg3 = 25, arg4 = 10, arg5 = 10, arg6 = 0, arg7 = 2)
{
    ext(sTornadoTrash, arg0, x + arg1 + (dcos(arg6 + (t * arg3)) * arg4), y + arg2 + (dsin(arg6 + (t * arg3)) * arg5), arg7);
}
