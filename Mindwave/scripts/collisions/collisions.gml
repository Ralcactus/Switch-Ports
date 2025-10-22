function get_rotated_corners_obj(arg0, arg1, arg2)
{
    var spr = arg0.sprite_index;
    var xorigin = sprite_get_xoffset(spr);
    var yorigin = sprite_get_yoffset(spr);
    var bleft = sprite_get_bbox_left(spr);
    var bright = sprite_get_bbox_right(spr);
    var btop = sprite_get_bbox_top(spr);
    var bbottom = sprite_get_bbox_bottom(spr);
    var rotation_center_x = arg1 + xorigin;
    var rotation_center_y = arg2 + yorigin;
    var angle_rad = (arg0.image_angle * pi) / 180;
    var cos_angle = cos(angle_rad);
    var sin_angle = -sin(angle_rad);
    var corner1_x = (arg1 + (cos_angle * (bleft - xorigin) * arg0.image_xscale)) - (sin_angle * (btop - yorigin) * arg0.image_yscale) - 0.9;
    var corner1_y = (arg2 + (sin_angle * (bleft - xorigin) * arg0.image_xscale) + (cos_angle * (btop - yorigin) * arg0.image_yscale)) - 0.9;
    var corner2_x = (arg1 + (cos_angle * (bright - xorigin) * arg0.image_xscale)) - (sin_angle * (btop - yorigin) * arg0.image_yscale) - 0.9;
    var corner2_y = (arg2 + (sin_angle * (bright - xorigin) * arg0.image_xscale) + (cos_angle * (btop - yorigin) * arg0.image_yscale)) - 0.9;
    var corner3_x = (arg1 + (cos_angle * (bright - xorigin) * arg0.image_xscale)) - (sin_angle * (bbottom - yorigin) * arg0.image_yscale) - 0.9;
    var corner3_y = (arg2 + (sin_angle * (bright - xorigin) * arg0.image_xscale) + (cos_angle * (bbottom - yorigin) * arg0.image_yscale)) - 0.9;
    var corner4_x = (arg1 + (cos_angle * (bleft - xorigin) * arg0.image_xscale)) - (sin_angle * (bbottom - yorigin) * arg0.image_yscale) - 0.9;
    var corner4_y = (arg2 + (sin_angle * (bleft - xorigin) * arg0.image_xscale) + (cos_angle * (bbottom - yorigin) * arg0.image_yscale)) - 0.9;
    return [corner1_x, corner1_y, corner2_x, corner2_y, corner3_x, corner3_y, corner4_x, corner4_y];
}

function collide_obj_fast(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var spr1 = arg0.sprite_index;
    var spr2 = arg3.sprite_index;
    var xorigin1 = sprite_get_xoffset(spr1);
    var yorigin1 = sprite_get_yoffset(spr1);
    var xorigin2 = sprite_get_xoffset(spr2);
    var yorigin2 = sprite_get_yoffset(spr2);
    var corner1_x = (arg1 - xorigin1) + sprite_get_bbox_left(spr1);
    var corner1_y = (arg2 - yorigin1) + sprite_get_bbox_top(spr1);
    var corner2_x = (arg1 - xorigin1) + sprite_get_bbox_right(spr1);
    var corner2_y = (arg2 - yorigin1) + sprite_get_bbox_bottom(spr1);
    var corner3_x = (arg4 - xorigin2) + sprite_get_bbox_left(spr2);
    var corner3_y = (arg5 - yorigin2) + sprite_get_bbox_top(spr2);
    var corner4_x = (arg4 - xorigin2) + sprite_get_bbox_right(spr2);
    var corner4_y = (arg5 - yorigin2) + sprite_get_bbox_bottom(spr2);
    
    if (rectangle_in_rectangle(corner1_x, corner1_y, corner2_x, corner2_y, corner3_x, corner3_y, corner4_x, corner4_y))
        return true;
    else
        return false;
}

function collide_obj(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var corners_obj1 = get_rotated_corners_obj(arg0, arg1, arg2);
    var corners_obj2 = get_rotated_corners_obj(arg3, arg4, arg5);
    var obj1_inside_obj2 = true;
    var obj2_inside_obj1 = true;
    var bbox1 = bbox_from_corners(corners_obj1[0], corners_obj1[1], corners_obj1[2], corners_obj1[3], corners_obj1[4], corners_obj1[5], corners_obj1[6], corners_obj1[7]);
    var bbox2 = bbox_from_corners(corners_obj2[0], corners_obj2[1], corners_obj2[2], corners_obj2[3], corners_obj2[4], corners_obj2[5], corners_obj2[6], corners_obj2[7]);
    
    if (rectangle_in_rectangle(bbox1[0], bbox1[1], bbox1[2], bbox1[3], bbox2[0], bbox2[1], bbox2[2], bbox2[3]))
    {
        for (var i = 0; i < 4; i++)
        {
            if (!point_in_polygon(corners_obj1[i * 2], corners_obj1[(i * 2) + 1], corners_obj2))
            {
                obj1_inside_obj2 = false;
                break;
            }
        }
        
        for (var i = 0; i < 4; i++)
        {
            if (!point_in_polygon(corners_obj2[i * 2], corners_obj2[(i * 2) + 1], corners_obj1))
            {
                obj2_inside_obj1 = false;
                break;
            }
        }
        
        if (obj1_inside_obj2 || obj2_inside_obj1)
            return true;
        
        for (var i = 0; i < 4; i++)
        {
            var j = (i + 1) % 4;
            var line1_x1 = corners_obj1[i * 2];
            var line1_y1 = corners_obj1[(i * 2) + 1];
            var line1_x2 = corners_obj1[j * 2];
            var line1_y2 = corners_obj1[(j * 2) + 1];
            
            for (var k = 0; k < 4; k++)
            {
                var l = (k + 1) % 4;
                var line2_x1 = corners_obj2[k * 2];
                var line2_y1 = corners_obj2[(k * 2) + 1];
                var line2_x2 = corners_obj2[l * 2];
                var line2_y2 = corners_obj2[(l * 2) + 1];
                
                if (line_segments_intersect(line1_x1, line1_y1, line1_x2, line1_y2, line2_x1, line2_y1, line2_x2, line2_y2))
                    return true;
            }
        }
    }
    
    return false;
}

function line_intersect_polygon(arg0, arg1, arg2, arg3, arg4)
{
    var n = array_length(arg4);
    var p1x = arg4[n - 1][0];
    var p1y = arg4[n - 1][1];
    
    for (var i = 0; i < n; i++)
    {
        var p2x = arg4[i][0];
        var p2y = arg4[i][1];
        
        if (line_segments_intersect(arg0, arg1, arg2, arg3, p1x, p1y, p2x, p2y))
            return true;
        
        p1x = p2x;
        p1y = p2y;
    }
    
    return false;
}

function line_segments_intersect(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var denom = ((arg0 - arg2) * (arg5 - arg7)) - ((arg1 - arg3) * (arg4 - arg6));
    
    if (denom == 0)
        return false;
    
    var t = (((arg0 - arg4) * (arg5 - arg7)) - ((arg1 - arg5) * (arg4 - arg6))) / denom;
    var u = (((arg0 - arg4) * (arg1 - arg3)) - ((arg1 - arg5) * (arg0 - arg2))) / denom;
    return t >= 0 && t <= 1 && u >= 0 && u <= 1;
}

function draw_bounding_box(arg0, arg1, arg2, arg3)
{
    var spritew = sprite_get_width(arg0);
    var spriteh = sprite_get_height(arg0);
    var x_offset = sprite_get_xoffset(arg0);
    var y_offset = sprite_get_yoffset(arg0);
    var top_left_x = arg1 - x_offset;
    var top_left_y = arg2 - y_offset;
    var top_right_x = (arg1 - x_offset) + spritew;
    var top_right_y = arg2 - y_offset;
    var bottom_left_x = arg1 - x_offset;
    var bottom_left_y = (arg2 - y_offset) + spriteh;
    var bottom_right_x = (arg1 - x_offset) + spritew;
    var bottom_right_y = (arg2 - y_offset) + spriteh;
    draw_set_color(arg3);
    draw_line(top_left_x, top_left_y, top_right_x, top_right_y);
    draw_line(top_right_x, top_right_y, bottom_right_x, bottom_right_y);
    draw_line(bottom_right_x, bottom_right_y, bottom_left_x, bottom_left_y);
    draw_line(bottom_left_x, bottom_left_y, top_left_x, top_left_y);
}

function bbox_from_corners(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var min_x = min(arg0, arg2, arg4, arg6);
    var max_x = max(arg0, arg2, arg4, arg6);
    var min_y = min(arg1, arg3, arg5, arg7);
    var max_y = max(arg1, arg3, arg5, arg7);
    return [min_x, min_y, max_x, max_y];
}

function draw_polygon_debug(arg0, arg1)
{
    draw_set_color(arg1);
    var n = array_length(arg0);
    
    for (var i = 0; i < n; i++)
    {
        var j = (i + 1) % n;
        draw_line(arg0[i][0], arg0[i][1], arg0[j][0], arg0[j][1]);
    }
}

function check_polygon_collision(arg0, arg1)
{
    var n1 = array_length(arg0);
    var n2 = array_length(arg1);
    
    for (var i = 0; i < n1; i++)
    {
        var p1_current = arg0[i];
        var p1_next = arg0[(i + 1) % n1];
        var edge = [p1_next[0] - p1_current[0], p1_next[1] - p1_current[1]];
        var axis = [-edge[1], edge[0]];
        
        if (!projections_overlap(arg0, arg1, axis))
            return false;
    }
    
    if (check_vertex_inside(arg0, arg1) || check_vertex_inside(arg1, arg0))
        return true;
    
    for (var i = 0; i < n1; i++)
    {
        var p1_current = arg0[i];
        var p1_next = arg0[(i + 1) % n1];
        
        for (var j = 0; j < n2; j++)
        {
            var p2_current = arg1[j];
            var p2_next = arg1[(j + 1) % n2];
            
            if (edges_intersect(p1_current, p1_next, p2_current, p2_next))
                return true;
        }
    }
    
    return false;
}

function check_collision_polygon_trianglelist(arg0, arg1)
{
}

function polygon_contains_point(arg0, arg1)
{
    var inside = false;
    var n = array_length(arg0);
    
    for (var i = 0; i < n; i++)
    {
        var p1 = arg0[i];
        var p2 = arg0[(i + 1) % n];
        
        if ((p1[1] > arg1[1]) != (p2[1] > arg1[1]) && arg1[0] < ((((p2[0] - p1[0]) * (arg1[1] - p1[1])) / (p2[1] - p1[1])) + p1[0]))
            inside = !inside;
    }
    
    return inside;
}

function check_vertex_inside(arg0, arg1)
{
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (polygon_contains_point(arg1, arg0[i]))
            return true;
    }
    
    return false;
}

function edges_intersect(arg0, arg1, arg2, arg3)
{
    var o1 = orientation(arg0, arg1, arg2);
    var o2 = orientation(arg0, arg1, arg3);
    var o3 = orientation(arg2, arg3, arg0);
    var o4 = orientation(arg2, arg3, arg1);
    return o1 != o2 && o3 != o4;
}

function orientation(arg0, arg1, arg2)
{
    var val = ((arg1[1] - arg0[1]) * (arg2[0] - arg1[0])) - ((arg1[0] - arg0[0]) * (arg2[1] - arg1[1]));
    
    if (val == 0)
        return 0;
    else if (val > 0)
        return 1;
    else
        return 2;
}

function projections_overlap(arg0, arg1, arg2)
{
    var projection1 = polygon_projection(arg0, arg2);
    var projection2 = polygon_projection(arg1, arg2);
    return !(projection1[1] < projection2[0] || projection2[1] < projection1[0]);
}

function polygon_projection(arg0, arg1)
{
    var min_proj = dot(arg0[0][0], arg0[0][1], arg1[0], arg1[1]);
    var max_proj = min_proj;
    
    for (var i = 1; i < array_length(arg0); i++)
    {
        var proj = dot(arg0[i][0], arg0[i][1], arg1[0], arg1[1]);
        min_proj = min(proj, min_proj);
        max_proj = max(proj, max_proj);
    }
    
    return [min_proj, max_proj];
}

function dot(arg0, arg1, arg2, arg3)
{
    return (arg0 * arg2) + (arg1 * arg3);
}

function rectangle_in_triangle_list(arg0, arg1, arg2, arg3, arg4)
{
    for (var i = 0; i < array_length(arg4); i++)
    {
        var _triangle = arg4[i];
        var _tx1 = _triangle[0];
        var _ty1 = _triangle[1];
        var _tx2 = _triangle[2];
        var _ty2 = _triangle[3];
        var _tx3 = _triangle[4];
        var _ty3 = _triangle[5];
        
        if (rectangle_in_triangle(arg0, arg1, arg2, arg3, _tx1, _ty1, _tx2, _ty2, _tx3, _ty3))
            return true;
    }
    
    return false;
}

function points_to_triangulated_polygon(arg0, arg1 = true, arg2 = false)
{
    var verticies = [];
    
    if (arg1)
    {
        for (var i = 0; i < array_length(arg0); i++)
        {
            var _point = arg0[i];
            array_push(verticies, new triangulation_vertex(_point[0], _point[1]));
        }
    }
    else
    {
        for (var i = 0; i < array_length(arg0); i += 2)
        {
            var _point_x = arg0[i];
            var _point_y = arg0[i + 1];
            array_push(verticies, new triangulation_vertex(_point_x, _point_y));
        }
    }
    
    var _triangles = triangulate_polygon(verticies);
    
    if (!arg2)
    {
        for (var i = 0; i < array_length(_triangles); i++)
        {
            var _triangle = _triangles[i];
            var _tri_arr = [0, 0, 0, 0, 0, 0];
            _tri_arr[0] = _triangle.v0.x;
            _tri_arr[1] = _triangle.v0.y;
            _tri_arr[2] = _triangle.v1.x;
            _tri_arr[3] = _triangle.v1.y;
            _tri_arr[4] = _triangle.v2.x;
            _tri_arr[5] = _triangle.v2.y;
            _triangles[i] = _tri_arr;
        }
    }
    
    return _triangles;
}

function triangulate_polygon(arg0)
{
    var st = triangulation_get_super_triangle(arg0);
    var triangles = [st];
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        var _vertex = arg0[i];
        
        if (!(is_nan(_vertex.x) || is_nan(_vertex.y)))
            triangles = triangulation_add_vertex(_vertex, triangles);
    }
    
    for (var i = 0; i < array_length(triangles); i++)
    {
        var _triangle = triangles[i];
        
        if (_triangle.v0 == st.v0 || _triangle.v0 == st.v1 || _triangle.v0 == st.v2 || _triangle.v1 == st.v0 || _triangle.v1 == st.v1 || _triangle.v1 == st.v2 || _triangle.v2 == st.v0 || _triangle.v2 == st.v1 || _triangle.v2 == st.v2)
        {
            array_delete(triangles, i, 1);
            i--;
        }
    }
    
    return triangles;
}

function triangulation_vertex(arg0, arg1) constructor
{
    self.x = arg0;
    self.y = arg1;
    
    equals = function(arg0)
    {
        return x == arg0.x && y == arg0.y;
    };
}

function triangulation_edge(arg0, arg1) constructor
{
    self.v0 = arg0;
    self.v1 = arg1;
    
    equals = function(arg0)
    {
        return (v0.equals(arg0.v0) && v1.equals(arg0.v1)) || (v0.equals(arg0.v1) && v1.equals(arg0.v0));
    };
}

function triangulation_triangle(arg0, arg1, arg2) constructor
{
    self.v0 = arg0;
    self.v1 = arg1;
    self.v2 = arg2;
    self.circumCirc = triangulation_calculate_circumcircle(arg0, arg1, arg2);
    
    self.inCircumcircle = function(arg0)
    {
        var dx = self.circumCirc.c.x - arg0.x;
        var dy = self.circumCirc.c.y - arg0.y;
        return sqrt((dx * dx) + (dy * dy)) <= self.circumCirc.r;
    };
}

function triangulation_add_vertex(arg0, arg1)
{
    var _edges = [];
    var triangles = [];
    array_copy(triangles, 0, arg1, 0, array_length(arg1));
    
    for (var i = 0; i < array_length(triangles); i++)
    {
        var _triangle = triangles[i];
        
        if (_triangle.inCircumcircle(arg0))
        {
            array_push(_edges, new triangulation_edge(_triangle.v0, _triangle.v1), new triangulation_edge(_triangle.v1, _triangle.v2), new triangulation_edge(_triangle.v2, _triangle.v0));
            array_delete(triangles, i, 1);
            i--;
        }
    }
    
    _edges = triangulation_unique_edges(_edges);
    
    for (var i = 0; i < array_length(_edges); i++)
    {
        var _edge = _edges[i];
        array_push(triangles, new triangulation_triangle(_edge.v0, _edge.v1, arg0));
    }
    
    return triangles;
}

function triangulation_unique_edges(arg0)
{
    var unique_edges = [];
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        var is_unique = true;
        
        for (var j = 0; j < array_length(arg0); j++)
        {
            if (i != j && arg0[i].equals(arg0[j]))
                is_unique = false;
        }
        
        if (is_unique)
            array_push(unique_edges, arg0[i]);
    }
    
    return unique_edges;
}

function triangulation_get_super_triangle(arg0)
{
    var minx = infinity;
    var miny = infinity;
    var maxx = -infinity;
    var maxy = -infinity;
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        var _point = arg0[i];
        minx = min(minx, _point.x);
        miny = min(miny, _point.y);
        maxx = max(maxx, _point.x);
        maxy = max(maxy, _point.y);
    }
    
    var _pw = maxx - minx;
    var _ph = maxy - miny;
    var _v0 = new triangulation_vertex(minx - (_pw * 0.1), miny - _ph);
    var _v1 = new triangulation_vertex(minx - (_pw * 0.1), miny + (_ph * 2));
    var _v2 = new triangulation_vertex(minx + (_pw * 1.7), miny + (_ph * 0.5));
    return new triangulation_triangle(_v0, _v1, _v2);
}

function calculate_super_triangle_from_points(arg0)
{
    var point_x_min = infinity;
    var point_y_min = infinity;
    var point_x_max = -infinity;
    var point_y_max = -infinity;
    
    for (var i = 0; i < (array_length(arg0) - 1); i += 2)
    {
        var _px = arg0[i];
        var _py = arg0[i + 1];
        var _point = [_px, _py];
        array_push(arg0, _point);
        point_x_min = min(point_x_min, _px);
        point_x_max = max(point_x_max, _px);
        point_y_min = min(point_y_min, _py);
        point_y_max = max(point_y_max, _py);
    }
    
    var points_w = point_x_max - point_x_min;
    var points_h = point_y_max - point_y_min;
    var _pxmin = point_x_min;
    var _pxmax = point_x_max;
    var _pymin = point_y_min;
    var _pymax = point_y_max;
    var _pw = points_w;
    var _ph = points_h;
    var _super_tri = 
    {
        p1: 
        {
            x: _pxmin - (_pw * 0.1),
            y: _pymin - _ph
        },
        p2: 
        {
            x: _pxmin - (_pw * 0.1),
            y: _pymin + (_ph * 2)
        },
        p3: 
        {
            x: _pxmin + (_pw * 1.7),
            y: _pymin + (_ph * 0.5)
        }
    };
    return _super_tri;
}

function triangulation_calculate_circumcircle(arg0, arg1, arg2)
{
    var x1 = arg0.x;
    var y1 = arg0.y;
    var x2 = arg1.x;
    var y2 = arg1.y;
    var x3 = arg2.x;
    var y3 = arg2.y;
    var xc = 0;
    var yc = 0;
    var r = 0;
    var _circumcircle = 
    {
        c: 
        {
            x: x1,
            y: y1
        },
        r: 0
    };
    var EPSILON = math_get_epsilon();
    
    if (abs(y1 - y2) < EPSILON && abs(y2 - y3) < EPSILON)
    {
        return _circumcircle;
    }
    else
    {
        if (abs(y2 - y1) < EPSILON || y2 == y1)
        {
            var m2 = -(x3 - x2) / (y3 - y2);
            var mx2 = (x2 + x3) / 2;
            var my2 = (y2 + y3) / 2;
            xc = (x2 + x1) / 2;
            yc = (m2 * (xc - mx2)) + my2;
        }
        else if (abs(y3 - y2) < EPSILON || y3 == y2)
        {
            var m1 = -(x2 - x1) / (y2 - y1);
            var mx1 = (x1 + x2) / 2;
            var my1 = (y1 + y2) / 2;
            xc = (x3 + x2) / 2;
            yc = (m1 * (xc - mx1)) + my1;
        }
        else
        {
            var m1 = -(x2 - x1) / (y2 - y1);
            var m2 = -(x3 - x2) / (y3 - y2);
            var mx1 = (x1 + x2) / 2;
            var mx2 = (x2 + x3) / 2;
            var my1 = (y1 + y2) / 2;
            var my2 = (y2 + y3) / 2;
            xc = ((((m1 * mx1) - (m2 * mx2)) + my2) - my1) / (m1 - m2);
            yc = (m1 * (xc - mx1)) + my1;
        }
        
        var dx = x2 - xc;
        var dy = y2 - yc;
        var rsqr = (dx * dx) + (dy * dy);
        show_debug_message(rsqr);
        r = sqrt(rsqr);
        _circumcircle.c.x = xc;
        _circumcircle.c.y = yc;
        _circumcircle.r = r;
        return _circumcircle;
    }
}
