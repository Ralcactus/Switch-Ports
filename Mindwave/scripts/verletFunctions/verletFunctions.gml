function verletSystem(arg0, arg1) constructor
{
    verletGroups = ds_list_create();
    forceFields = ds_list_create();
    frict = 0;
    grav = 0;
    
    if (arg0 != undefined)
        frict = arg0;
    
    if (arg1 != undefined)
        grav = arg1;
    
    active = true;
    visible = true;
    
    simulate = function()
    {
        if (active)
        {
            var verletGroupAmount = ds_list_size(verletGroups);
            
            for (var i = 0; i < verletGroupAmount; i++)
            {
                var currentGroup = ds_list_find_value(verletGroups, i);
                
                if (currentGroup.active)
                    currentGroup.simulate(frict, grav);
            }
        }
    };
    
    addForceField = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
    {
        ds_list_add(forceFields, new forceField(arg0, arg1, arg2, arg3, arg4, arg5, arg6));
    };
    
    draw = function()
    {
        if (visible)
        {
            var verletGroupAmount = ds_list_size(verletGroups);
            
            for (var i = 0; i < verletGroupAmount; i++)
            {
                var currentGroup = ds_list_find_value(verletGroups, i);
                
                if (currentGroup.visible)
                    currentGroup.draw();
            }
        }
    };
    
    drawDebug = function()
    {
        var verletGroupAmount = ds_list_size(verletGroups);
        
        for (var i = 0; i < verletGroupAmount; i++)
        {
            var currentGroup = ds_list_find_value(verletGroups, i);
            
            if (currentGroup.visible)
                currentGroup.drawWireframe();
        }
        
        var forceFieldAmount = ds_list_size(forceFields);
        
        for (var i = 0; i < forceFieldAmount; i++)
        {
            var currentForceField = ds_list_find_value(forceFields, i);
            draw_rectangle(currentForceField.x1, currentForceField.y1, currentForceField.x2, currentForceField.y2, true);
            var cx = currentForceField.x1 + ((currentForceField.x2 - currentForceField.x1) * 0.5);
            var cy = currentForceField.y1 + ((currentForceField.y2 - currentForceField.y1) * 0.5);
            var len = 10;
            var s = 4;
            draw_arrow(cx + lengthdir_x(len, currentForceField.dir + 180), cy + lengthdir_y(len, currentForceField.dir + 180), cx + lengthdir_x(len, currentForceField.dir), cy + lengthdir_y(len, currentForceField.dir), s);
        }
    };
    
    cleanup = function()
    {
        if (!ds_list_empty(verletGroups))
        {
            repeat (ds_list_size(verletGroups))
            {
                var currentGroup = ds_list_find_value(verletGroups, 0);
                
                if (verletGroupExists(currentGroup))
                {
                    currentGroup.cleanup();
                    ds_list_set(verletGroups, 0, undefined);
                }
                
                ds_list_delete(verletGroups, 0);
            }
        }
        
        if (ds_exists(verletGroups, ds_type_list))
            ds_list_destroy(verletGroups);
        
        if (ds_exists(forceFields, ds_type_list))
            ds_list_destroy(forceFields);
    };
}

function verletSystemExists(arg0)
{
    return is_struct(arg0);
}

function verletGroup() constructor
{
    active = true;
    visible = true;
    type = undefined;
    stiffness = 1;
    maxTension = 10;
    aliveCounter = 0;
    spawnRipDelaySeconds = 2;
    system = -4;
    vertexList = ds_list_create();
    stickList = ds_list_create();
    attachmentList = ds_list_create();
    
    vertexAdd = function(arg0, arg1, arg2, arg3)
    {
        ds_list_add(vertexList, new vertex(arg0, arg1, arg2, arg3));
    };
    
    vertexChangeData = function(arg0, arg1, arg2, arg3, arg4)
    {
        if (arg0 == -4)
            arg0 = 0;
        else if (arg0 == -3)
            arg0 = ds_list_size(vertexList) - 1;
        
        var thisVertex = ds_list_find_value(vertexList, arg0);
        
        if (arg1 != undefined)
            thisVertex.x = arg1;
        
        if (arg2 != undefined)
            thisVertex.y = arg2;
        
        if (arg3 != undefined)
            thisVertex.radius = arg3;
        
        if (arg4 != undefined)
            thisVertex.fixed = arg4;
    };
    
    vertexAttachObject = function(arg0, arg1, arg2, arg3, arg4)
    {
        if (arg0 == -4)
            arg0 = 0;
        else if (arg0 == -3)
            arg0 = ds_list_size(vertexList) - 1;
        
        if (arg3 == undefined)
            arg3 = 0;
        
        if (arg4 == undefined)
            arg4 = 0;
        
        ds_list_add(attachmentList, new attachment(arg0, arg1, arg2, 0, arg3, arg4));
    };
    
    vertexAttachTo = function(arg0, arg1, arg2, arg3)
    {
        if (arg0 == -4)
            arg0 = 0;
        else if (arg0 == -3)
            arg0 = ds_list_size(vertexList) - 1;
        
        if (arg2 == undefined)
            arg2 = 0;
        
        if (arg3 == undefined)
            arg3 = 0;
        
        ds_list_add(attachmentList, new attachment(arg0, arg1, 0, 1, arg2, arg3));
    };
    
    stickAdd = function(arg0, arg1, arg2)
    {
        ds_list_add(stickList, new stick(arg0, arg1, arg2));
    };
    
    simulate = function(arg0, arg1)
    {
        var vertexAmount = ds_list_size(vertexList);
        
        for (var i = 0; i < vertexAmount; i++)
        {
            var currentVertex = ds_list_find_value(vertexList, i);
            
            if (!currentVertex.fixed)
            {
                var vx = (currentVertex.x - currentVertex.xLast) * arg0;
                var vy = (currentVertex.y - currentVertex.yLast) * arg0;
                currentVertex.xLast = currentVertex.x;
                currentVertex.yLast = currentVertex.y;
                currentVertex.x += vx;
                currentVertex.y += vy;
                
                if (!collide(currentVertex.x, currentVertex.y, currentVertex.radius))
                    currentVertex.y += arg1 * currentVertex.weight;
            }
        }
        
        var attachmentAmount = ds_list_size(attachmentList);
        
        for (var i = 0; i < attachmentAmount; i++)
        {
            var currentAttachment = ds_list_find_value(attachmentList, i);
            
            if (currentAttachment.hierarchy == 0)
            {
                if (currentAttachment.type != (1 << 0))
                {
                    currentAttachment.object.x = ds_list_find_value(vertexList, currentAttachment.index).x + currentAttachment.xoff;
                    currentAttachment.object.y = ds_list_find_value(vertexList, currentAttachment.index).y + currentAttachment.yoff;
                }
                
                if (currentAttachment.type != (0 << 0))
                {
                    if (currentAttachment.index == 0)
                        currentAttachment.object.image_angle = 0;
                    else
                        currentAttachment.object.image_angle = point_direction(ds_list_find_value(vertexList, currentAttachment.index - 1).x, ds_list_find_value(vertexList, currentAttachment.index - 1).y, ds_list_find_value(vertexList, currentAttachment.index).x, ds_list_find_value(vertexList, currentAttachment.index).y);
                }
            }
            else
            {
                ds_list_find_value(vertexList, currentAttachment.index).x = currentAttachment.object.x + currentAttachment.xoff;
                ds_list_find_value(vertexList, currentAttachment.index).y = currentAttachment.object.y + currentAttachment.yoff;
            }
        }
        
        if (system != -4)
        {
            var forceFieldAmount = ds_list_size(system.forceFields);
            vertexAmount = ds_list_size(vertexList);
            
            for (var i = 0; i < forceFieldAmount; i++)
            {
                var currentForceField = ds_list_find_value(system.forceFields, i);
                var dir = currentForceField.dir + 180;
                var str = currentForceField.str;
                
                if (currentForceField.useNoise)
                    str *= (sin(2 * current_time) + sin(pi * current_time));
                
                for (var j = 0; j < vertexAmount; j++)
                {
                    var currentVertex = ds_list_find_value(vertexList, j);
                    
                    if (point_in_rectangle(currentVertex.x, currentVertex.y, currentForceField.x1, currentForceField.y1, currentForceField.x2, currentForceField.y2))
                    {
                        currentVertex.xLast += lengthdir_x(str, dir);
                        currentVertex.yLast += lengthdir_y(str, dir);
                    }
                }
            }
        }
        
        repeat (stiffness)
        {
            var stickAmount = ds_list_size(stickList);
            
            for (var i = 0; i < stickAmount; i++)
            {
                var currentStick = ds_list_find_value(stickList, i);
                var dx = currentStick.v1.x - currentStick.v2.x;
                var dy = currentStick.v1.y - currentStick.v2.y;
                var dist = sqrt((dx * dx) + (dy * dy));
                var difference = currentStick.length - dist;
                var percent = (difference / dist) * 0.5;
                var offsetX = dx * percent;
                var offsetY = dy * percent;
                
                if (aliveCounter >= (room_speed * spawnRipDelaySeconds) && maxTension < 10 && abs(percent) > maxTension && !currentStick.v1.fixed && !currentStick.v2.fixed)
                {
                    ds_list_delete(stickList, i);
                    i--;
                    stickAmount--;
                }
                else if (currentStick.v1.fixed)
                {
                    if (!currentStick.v2.fixed)
                    {
                        currentStick.v2.x -= offsetX * 2;
                        currentStick.v2.y -= offsetY * 2;
                    }
                }
                else if (currentStick.v2.fixed)
                {
                    currentStick.v1.x += offsetX * 2;
                    currentStick.v1.y += offsetY * 2;
                }
                else
                {
                    currentStick.v1.x += offsetX;
                    currentStick.v1.y += offsetY;
                    currentStick.v2.x -= offsetX;
                    currentStick.v2.y -= offsetY;
                }
            }
            
            vertexAmount = ds_list_size(vertexList);
            
            for (var i = 0; i < vertexAmount; i++)
            {
                var currentVertex = ds_list_find_value(vertexList, i);
                
                if (!currentVertex.fixed)
                {
                    var vx = (currentVertex.x - currentVertex.xLast) * arg0;
                    var vy = (currentVertex.y - currentVertex.yLast) * arg0;
                    var inst = collide(currentVertex.x, currentVertex.y, currentVertex.radius);
                    
                    if (inst != -4)
                    {
                        var dir;
                        
                        if (inst.type == (0 << 0))
                        {
                            dir = 0;
                            
                            if (currentVertex.yLast < inst.bbox_top)
                                dir = 90;
                            else if (currentVertex.yLast > inst.bbox_bottom)
                                dir = 270;
                            else if (currentVertex.xLast < inst.bbox_left)
                                dir = 180;
                            else if (currentVertex.xLast > inst.bbox_right)
                                dir = 0;
                        }
                        else
                        {
                            dir = point_direction(inst.x, inst.y, currentVertex.x, currentVertex.y);
                        }
                        
                        while (collide(currentVertex.x, currentVertex.y, currentVertex.radius))
                        {
                            currentVertex.x += lengthdir_x(1, dir);
                            currentVertex.y += lengthdir_y(1, dir);
                        }
                        
                        var prec = 0.1;
                        
                        while (!collide(currentVertex.x + lengthdir_x(prec, dir + 180), currentVertex.y + lengthdir_y(prec, dir + 180), currentVertex.radius))
                        {
                            currentVertex.x += lengthdir_x(prec, dir + 180);
                            currentVertex.y += lengthdir_y(prec, dir + 180);
                        }
                        
                        currentVertex.xLast = currentVertex.x;
                        currentVertex.yLast = currentVertex.y;
                    }
                }
            }
        }
        
        if (aliveCounter <= (room_speed * spawnRipDelaySeconds))
            aliveCounter++;
    };
    
    drawWireframe = function()
    {
        var vertexAmount = ds_list_size(vertexList);
        var stickAmount = ds_list_size(stickList);
        draw_set_color(c_gray);
        
        for (var i = 0; i < stickAmount; i++)
        {
            var currentStick = ds_list_find_value(stickList, i);
            draw_line_width(currentStick.v1.x, currentStick.v1.y, currentStick.v2.x, currentStick.v2.y, 1);
        }
        
        draw_set_color(c_white);
        
        for (var i = 0; i < vertexAmount; i++)
        {
            var currentVertex = ds_list_find_value(vertexList, i);
            draw_circle(currentVertex.x, currentVertex.y, 1, false);
        }
    };
    
    draw = drawWireframe;
    
    cleanup = function()
    {
        if (system != -4 && verletSystemExists(system))
        {
            var verletGroupAmount = ds_list_size(system.verletGroups);
            
            for (var i = 0; i < verletGroupAmount; i++)
            {
                if (ds_list_find_value(system.verletGroups, i) == self)
                {
                    ds_list_delete(system.verletGroups, i);
                    break;
                }
            }
        }
        
        if (ds_exists(vertexList, ds_type_list))
            ds_list_destroy(vertexList);
        
        if (ds_exists(stickList, ds_type_list))
            ds_list_destroy(stickList);
        
        if (ds_exists(attachmentList, ds_type_list))
            ds_list_destroy(attachmentList);
    };
}

function verletGroupExists(arg0)
{
    return is_struct(arg0);
}

function verletGroupCreateRope(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    var newGroup = new verletGroup();
    newGroup.color = arg3;
    newGroup.width = arg4;
    newGroup.stiffness = arg7;
    newGroup.maxTension = arg8;
    
    with (newGroup)
    {
        for (var i = 0; i < (arg6 + 1); i++)
            vertexAdd(arg1, arg2 + (i * arg5), 1, arg4 / 2);
        
        for (var i = 1; i < (arg6 + 1); i++)
            stickAdd(ds_list_find_value(vertexList, i - 1), ds_list_find_value(vertexList, i), arg5);
        
        draw = function()
        {
            var stickAmount = ds_list_size(stickList);
            var wHalf = width * 0.5;
            draw_set_color(color);
            draw_primitive_begin(pr_trianglestrip);
            var currentStick, stickDir;
            
            for (var i = 0; i < stickAmount; i++)
            {
                currentStick = ds_list_find_value(stickList, i);
                stickDir = point_direction(currentStick.v1.x, currentStick.v1.y, currentStick.v2.x, currentStick.v2.y);
                draw_vertex(currentStick.v1.x + lengthdir_x(wHalf, stickDir - 90), currentStick.v1.y + lengthdir_y(wHalf, stickDir - 90));
                draw_vertex(currentStick.v1.x + lengthdir_x(wHalf, stickDir + 90), currentStick.v1.y + lengthdir_y(wHalf, stickDir + 90));
            }
            
            draw_vertex(currentStick.v2.x + lengthdir_x(wHalf, stickDir - 90), currentStick.v2.y + lengthdir_y(wHalf, stickDir - 90));
            draw_vertex(currentStick.v2.x + lengthdir_x(wHalf, stickDir + 90), currentStick.v2.y + lengthdir_y(wHalf, stickDir + 90));
            draw_primitive_end();
            draw_set_color(c_white);
        };
    }
    
    newGroup.vertexChangeData(-4, undefined, undefined, undefined, true);
    
    if (arg0 != undefined)
    {
        if (verletSystemExists(arg0))
        {
            newGroup.system = arg0;
            ds_list_add(arg0.verletGroups, newGroup);
        }
    }
    
    return newGroup;
}

function verletGroupCreateRopeTextured(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var newGroup = new verletGroup();
    newGroup.sprite = arg3;
    newGroup.stiffness = arg5;
    newGroup.maxTension = arg6;
    
    with (newGroup)
    {
        var segmentLength = sprite_get_height(arg3) - sprite_get_yoffset(arg3);
        
        for (var i = 0; i < (arg4 + 1); i++)
            vertexAdd(arg1, arg2 + (i * segmentLength), 1, sprite_get_width(arg3) / 2);
        
        for (var i = 1; i < (arg4 + 1); i++)
            stickAdd(ds_list_find_value(vertexList, i - 1), ds_list_find_value(vertexList, i), segmentLength);
        
        draw = function()
        {
            var stickAmount = ds_list_size(stickList);
            var texture = sprite_get_texture(sprite, 0);
            var swHalf = sprite_get_width(sprite) * 0.5;
            var yoff = sprite_get_yoffset(sprite);
            
            for (var i = 0; i < stickAmount; i++)
            {
                var currentStick = ds_list_find_value(stickList, i);
                var stickDir = point_direction(currentStick.v1.x, currentStick.v1.y, currentStick.v2.x, currentStick.v2.y);
                draw_primitive_begin_texture(pr_trianglestrip, texture);
                draw_vertex_texture(currentStick.v1.x + lengthdir_x(swHalf, stickDir - 90) + lengthdir_x(yoff, stickDir + 180), currentStick.v1.y + lengthdir_y(swHalf, stickDir - 90) + lengthdir_y(yoff, stickDir + 180), 0, 0);
                draw_vertex_texture(currentStick.v1.x + lengthdir_x(swHalf, stickDir + 90) + lengthdir_x(yoff, stickDir + 180), currentStick.v1.y + lengthdir_y(swHalf, stickDir + 90) + lengthdir_y(yoff, stickDir + 180), 1, 0);
                draw_vertex_texture(currentStick.v2.x + lengthdir_x(swHalf, stickDir - 90), currentStick.v2.y + lengthdir_y(swHalf, stickDir - 90), 0, 1);
                draw_vertex_texture(currentStick.v2.x + lengthdir_x(swHalf, stickDir + 90), currentStick.v2.y + lengthdir_y(swHalf, stickDir + 90), 1, 1);
                draw_primitive_end();
            }
        };
    }
    
    newGroup.vertexChangeData(-4, undefined, undefined, undefined, true);
    
    if (arg0 != undefined)
    {
        if (verletSystemExists(arg0))
        {
            newGroup.system = arg0;
            ds_list_add(arg0.verletGroups, newGroup);
        }
    }
    
    return newGroup;
}

function verletGroupCreateBox(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var newGroup = new verletGroup();
    newGroup.color = arg5;
    newGroup.stiffness = arg6;
    newGroup.maxTension = arg7;
    
    with (newGroup)
    {
        vertexAdd(arg1, arg2, 1, 1);
        vertexAdd(arg1 + arg3, arg2, 1, 1);
        vertexAdd(arg1, arg2 + arg4, 1, 1);
        vertexAdd(arg1 + arg3, arg2 + arg4, 1, 1);
        stickAdd(ds_list_find_value(vertexList, 0), ds_list_find_value(vertexList, 1), arg3);
        stickAdd(ds_list_find_value(vertexList, 2), ds_list_find_value(vertexList, 3), arg3);
        stickAdd(ds_list_find_value(vertexList, 0), ds_list_find_value(vertexList, 2), arg4);
        stickAdd(ds_list_find_value(vertexList, 1), ds_list_find_value(vertexList, 3), arg4);
        stickAdd(ds_list_find_value(vertexList, 0), ds_list_find_value(vertexList, 3), sqrt(sqr(arg3) + sqr(arg4)));
        
        draw = function()
        {
            draw_set_color(color);
            draw_primitive_begin(pr_trianglestrip);
            var v1 = ds_list_find_value(vertexList, 0);
            var v2 = ds_list_find_value(vertexList, 1);
            var v3 = ds_list_find_value(vertexList, 2);
            var v4 = ds_list_find_value(vertexList, 3);
            draw_vertex(v1.x, v1.y);
            draw_vertex(v2.x, v2.y);
            draw_vertex(v3.x, v3.y);
            draw_vertex(v4.x, v4.y);
            draw_primitive_end();
            draw_set_color(c_white);
        };
    }
    
    if (arg0 != undefined)
    {
        if (verletSystemExists(arg0))
        {
            newGroup.system = arg0;
            ds_list_add(arg0.verletGroups, newGroup);
        }
    }
    
    return newGroup;
}

function verletGroupCreateBoxTextured(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var newGroup = verletGroupCreateBox(arg0, arg1, arg2, arg3, arg4, 16777215, arg6, arg7);
    newGroup.sprite = arg5;
    
    with (newGroup)
    {
        draw = function()
        {
            var texture = sprite_get_texture(sprite, 0);
            draw_set_color(color);
            draw_primitive_begin_texture(pr_trianglestrip, texture);
            var v1 = ds_list_find_value(vertexList, 0);
            var v2 = ds_list_find_value(vertexList, 1);
            var v3 = ds_list_find_value(vertexList, 2);
            var v4 = ds_list_find_value(vertexList, 3);
            draw_vertex_texture(v1.x, v1.y, 0, 0);
            draw_vertex_texture(v2.x, v2.y, 1, 0);
            draw_vertex_texture(v3.x, v3.y, 0, 1);
            draw_vertex_texture(v4.x, v4.y, 1, 1);
            draw_primitive_end();
            draw_set_color(c_white);
        };
    }
    
    if (arg0 != undefined)
    {
        if (verletSystemExists(arg0))
        {
            newGroup.system = arg0;
            ds_list_add(arg0.verletGroups, newGroup);
        }
    }
    
    return newGroup;
}

function verletGroupCreateCloth(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    var newGroup = new verletGroup();
    newGroup.color = arg6;
    newGroup.stiffness = arg7;
    newGroup.maxTension = arg8;
    newGroup.subDivisions = arg5;
    
    with (newGroup)
    {
        var segmentWidth = arg3 / (1 + arg5);
        var segmentHeight = arg4 / (1 + arg5);
        
        for (var i = 0; i < (2 + arg5); i++)
        {
            for (var j = 0; j < (2 + arg5); j++)
                vertexAdd(arg1 + (i * segmentWidth), arg2 + (j * segmentHeight), 1, 1);
        }
        
        for (var i = 0; i < (2 + arg5); i++)
        {
            for (var j = 0; j < (2 + arg5); j++)
            {
                if (i > 0)
                    stickAdd(ds_list_find_value(vertexList, (i - 1) + (j * (2 + arg5))), ds_list_find_value(vertexList, i + (j * (2 + arg5))), segmentHeight);
                
                if (j > 0)
                    stickAdd(ds_list_find_value(vertexList, i + ((j - 1) * (2 + arg5))), ds_list_find_value(vertexList, i + (j * (2 + arg5))), segmentWidth);
            }
        }
        
        draw = function()
        {
            draw_set_color(color);
            draw_primitive_begin(pr_trianglestrip);
            
            for (var i = 0; i < (1 + subDivisions); i++)
            {
                for (var j = 1; j < (2 + subDivisions); j++)
                {
                    var v1 = ds_list_find_value(vertexList, ((i * (2 + subDivisions)) + j) - 1);
                    var v2 = ds_list_find_value(vertexList, (((i + 1) * (2 + subDivisions)) + j) - 1);
                    var v3 = ds_list_find_value(vertexList, (i * (2 + subDivisions)) + j);
                    var v4 = ds_list_find_value(vertexList, ((i + 1) * (2 + subDivisions)) + j);
                    draw_vertex(v1.x, v1.y);
                    draw_vertex(v2.x, v2.y);
                    draw_vertex(v3.x, v3.y);
                    draw_vertex(v4.x, v4.y);
                }
            }
            
            draw_primitive_end();
            draw_set_color(c_white);
        };
    }
    
    for (var i = 0; i < (2 + arg5); i++)
        newGroup.vertexChangeData(i * (2 + arg5), undefined, undefined, undefined, true);
    
    if (arg0 != undefined)
    {
        if (verletSystemExists(arg0))
        {
            newGroup.system = arg0;
            ds_list_add(arg0.verletGroups, newGroup);
        }
    }
    
    return newGroup;
}

function verletGroupCreateClothTextured(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    var newGroup = verletGroupCreateCloth(arg0, arg1, arg2, arg3, arg4, arg5, 16777215, arg7, arg8);
    newGroup.sprite = arg6;
    
    with (newGroup)
    {
        draw = function()
        {
            var texture = sprite_get_texture(sprite, 0);
            
            for (var i = 0; i < (1 + subDivisions); i++)
            {
                draw_primitive_begin_texture(pr_trianglestrip, texture);
                
                for (var j = 1; j < (2 + subDivisions); j++)
                {
                    var v1 = ds_list_find_value(vertexList, ((i * (2 + subDivisions)) + j) - 1);
                    var v2 = ds_list_find_value(vertexList, (((i + 1) * (2 + subDivisions)) + j) - 1);
                    var v3 = ds_list_find_value(vertexList, (i * (2 + subDivisions)) + j);
                    var v4 = ds_list_find_value(vertexList, ((i + 1) * (2 + subDivisions)) + j);
                    var m = 1 / (1 + subDivisions);
                    draw_vertex_texture(v1.x, v1.y, i * m, (j - 1) * m);
                    draw_vertex_texture(v2.x, v2.y, (i + 1) * m, (j - 1) * m);
                    draw_vertex_texture(v3.x, v3.y, i * m, j * m);
                    draw_vertex_texture(v4.x, v4.y, (i + 1) * m, j * m);
                }
                
                draw_primitive_end();
            }
            
            draw_set_color(c_white);
        };
    }
    
    return newGroup;
}

function vertex(arg0, arg1, arg2, arg3) constructor
{
    x = arg0;
    y = arg1;
    weight = arg2;
    xLast = x + random_range(-1, 1);
    yLast = y + random_range(-1, 1);
    radius = arg3;
    fixed = false;
}

function stick(arg0, arg1, arg2) constructor
{
    v1 = arg0;
    v2 = arg1;
    length = arg2;
    active = true;
}

function attachment(arg0, arg1, arg2, arg3, arg4, arg5) constructor
{
    index = arg0;
    object = arg1;
    type = arg2;
    hierarchy = arg3;
    xoff = arg4;
    yoff = arg5;
}

function forceField(arg0, arg1, arg2, arg3, arg4, arg5, arg6) constructor
{
    x1 = arg0;
    y1 = arg1;
    x2 = arg2;
    y2 = arg3;
    dir = arg4;
    str = arg5;
    useNoise = arg6;
}
