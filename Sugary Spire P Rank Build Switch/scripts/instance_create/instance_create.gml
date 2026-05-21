/// @desc With this function you can create a new instance of the specified object at any given point within the room. 
/// @param {Real} x The x position the object will be created at
/// @param {Real} y The y position the object will be created at
/// @param {Asset.GMObject} obj The object index of the object to create an instance of
/// @param {Struct} [var_struct] A struct with variables to assign to the new instance
/// @returns {id.Instance} 
function instance_create(x, y, obj, var_struct = {})
{
	return instance_create_depth(x, y, 0, obj, var_struct);
}