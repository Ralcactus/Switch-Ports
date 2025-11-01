function timer_logic(arg0)
{
    if (timer[arg0] > -1)
    {
        timer[arg0]--;
        
        if (timer[arg0] == 0)
            timer_func[arg0]();
    }
}
