function micro_instance_destroy_all(arg0)
{
    with (arg0)
    {
        if (ID == other.ID)
            instance_destroy();
    }
}
