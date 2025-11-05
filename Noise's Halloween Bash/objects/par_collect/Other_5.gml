if (collected && splitcounter < splitfactor)
{
    repeat (splitfactor - splitcounter)
        event_user(1);
}

if (magnetised)
{
    event_user(0);
    
    repeat (splitfactor)
        event_user(1);
}
