if (global.martian_alarmed == true)
{
    instance_create(x, y, content);
    
    with (content)
        use_heat();
    
    instance_destroy();
}
