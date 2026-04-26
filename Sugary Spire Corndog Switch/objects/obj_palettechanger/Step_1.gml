inputbuffer = max(inputbuffer - 1, 0);
deletebuffer = max(deletebuffer - 1, 0);

with (ImportButton)
{
    buffertimer = max(buffertimer - 1, 0);
    
    if (buffertimer <= 0)
    {
        buffertimer = 0;
        activated = false;
    }
}

with (ExportButton)
{
    buffertimer = max(buffertimer - 1, 0);
    
    if (buffertimer <= 0)
    {
        buffertimer = 0;
        activated = false;
    }
}
