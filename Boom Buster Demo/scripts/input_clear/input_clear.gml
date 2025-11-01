function input_clear(arg0, arg1)
{
    with (arg0)
    {
        check[arg1] = false;
        pressed[arg1] = false;
        clear[arg1] = true;
    }
}
