/// @desc Creates an object. Designed for compatibility with earlier versions of GameMaker.
/// @param {real} x The x position the object will be created at
/// @param {real} y The y position the object will be created at
/// @param {Asset.GMObject} obj The object index of the object to create an instance of
/// @param {struct} [var_struct]={} A structure that contains variables that are copied into the new instance before the Create Event is called
/// @returns {Id.Instance}
function instance_create(_x, _y, obj, var_struct = {})
{
	return instance_create_depth(_x, _y, 0, obj, var_struct);
}