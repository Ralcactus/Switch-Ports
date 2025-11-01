function __input_global()
{
    static _struct = {};
    
    __input_initialize();
    return _struct;
}
