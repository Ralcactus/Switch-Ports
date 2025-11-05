function Vec2(xx, yy) constructor
{
    static Add = function(val)
    {
        return new Vec2(x + val.x, y + val.y);
    };
    
    static Subtract = function(val)
    {
        return new Vec2(x - val.x, y - val.y);
    };
    
    static Multiply = function(val)
    {
        return new Vec2(x * val, y * val);
    };
    
    static Divide = function(val)
    {
        return new Vec2(x / val, y / val);
    };
    
    static Length = function()
    {
        return sqrt((x * x) + (y * y));
    };
    
    static Normalize = function()
    {
        return Divide(Length());
    };
    
    x = xx;
    y = yy;
}

function Vec3(xx, yy, zz) constructor
{
    static Add = function(val)
    {
        return new Vec3(x + val.x, y + val.y, z + val.z);
    };
    
    static Subtract = function(val)
    {
        return new Vec3(x - val.x, y - val.y, z - val.z);
    };
    
    static Multiply = function(val)
    {
        return new Vec3(x * val, y * val, z * val);
    };
    
    static Divide = function(val)
    {
        return new Vec3(x / val, y / val, z / val);
    };
    
    static Length = function()
    {
        return sqrt((x * x) + (y * y) + (z * z));
    };
    
    static Normalize = function()
    {
        return Divide(Length());
    };
    
    static Cross = function(val)
    {
        return new Vec3((y * val.z) - (z * val.y), (z * val.x) - (x * val.z), (x * val.y) - (y * val.x));
    };
    
    x = xx;
    y = yy;
    z = zz;
}
