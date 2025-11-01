function __input_clear_all()
{
    static _global = __input_global();
    
    _global.__cleared = true;
    input_verb_consume(-3, -3);
}
