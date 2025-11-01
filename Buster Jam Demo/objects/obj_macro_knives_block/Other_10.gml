var _vertices = [[-1, -1, -1], [-1, -1, 1], [-1, 1, -1], [-1, 1, 1], [1, -1, -1], [1, -1, 1], [1, 1, -1], [1, 1, 1]];
var _pointH = pi + turnX;
var _pointV = pi + turnY;
var sinX = sin(_pointH);
var cosX = cos(_pointH);
var sinY = sin(_pointV);
var cosY = cos(_pointV);

for (var i = 0; i < 8; i++)
{
    var node = _vertices[i];
    var _x = node[0];
    var _y = node[1];
    var _z = node[2];
    node[0] = (_x * cosX) - (_z * sinX);
    node[2] = (_z * cosX) + (_x * sinX);
    _z = node[2];
    node[1] = (_y * cosY) - (_z * sinY);
    node[2] = (_z * cosY) + (_y * sinY);
    _vertices[i] = node;
}

var _faces_idx = [[0, 2, 3, 1], [7, 6, 4, 5], [0, 1, 5, 4], [2, 6, 7, 3], [7, 3, 1, 5], [6, 2, 0, 4]];
var _projected_faces = [];

for (var f = 0; f < array_length(_faces_idx); f++)
{
    var _face = _faces_idx[f];
    var _sum_z = 0;
    var _coords = [];
    
    for (var v = 0; v < 4; v++)
    {
        var _vert = _vertices[_face[v]];
        _sum_z += _vert[2];
        _coords[v] = [x + (_vert[0] * cube_size), cube_y + (_vert[1] * cube_size)];
    }
    
    var _averageZ = _sum_z / 4;
    _projected_faces[f] = 
    {
        coords: _coords,
        z: _averageZ,
        index: f
    };
}

for (var i = 0; i < (array_length(_projected_faces) - 1); i++)
{
    var j = i + 1;
    
    while (j < array_length(_projected_faces))
    {
        if (_projected_faces[i].z > _projected_faces[j].z)
        {
            var tmp = _projected_faces[i];
            _projected_faces[i] = _projected_faces[j];
            _projected_faces[j] = tmp;
        }
        
        j++;
    }
}

for (var f = 0; f < array_length(_projected_faces); f++)
{
    var _face = _projected_faces[f];
    var c = _face.coords;
    var _x1 = c[0][0];
    var _y1 = c[0][1];
    var _x2 = c[1][0];
    var _y2 = c[1][1];
    var _x3 = c[2][0];
    var _y3 = c[2][1];
    var _x4 = c[3][0];
    var _y4 = c[3][1];
    var __x1 = _x1;
    var __x2 = _x2;
    var __x3 = _x3;
    var __x4 = _x4;
    var __y1 = _y1;
    var __y2 = _y2;
    var __y3 = _y3;
    var __y4 = _y4;
    var _w = __x2 - __x1;
    var _hoff = __y2 - __y1;
    var _flipX;
    
    if (_face.index == 5)
        _flipX = false;
    else
        _flipX = false;
    
    if (_flipX)
    {
        _x2 -= (_w * 2);
        _x3 -= (_w * 2);
        _y1 += _hoff;
        _y2 += _hoff;
    }
    
    var _subimg = 0;
    var _sides = [0, 1, 4, 5];
    
    if (array_contains(_sides, _face.index))
        _subimg = 1;
    else if (_face.index == 2)
        _subimg = 2;
    else if (_face.index == 3)
        _subimg = 0;
    
    if (_face.index == 0)
        _subimg = 3;
    
    draw_sprite_pos(cube_sprite, _subimg, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, 1);
}
