/// @desc Returns the direction an instance should face when facing another instance
/// @param {Id.Instance} obj Object to face
/// @returns {real} -1 or 1
function face_obj(obj) {
	var dir = sign(obj.x - x)
	
	if (dir == 0)
		dir = 1
	
	return dir;
}
