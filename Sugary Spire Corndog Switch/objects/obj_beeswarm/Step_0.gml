invisFrames--;
angerTimer = max(angerTimer - 1, 0);

if (state == UnknownEnum.Value_0)
{
    if (riseTimer <= 0)
    {
        state = UnknownEnum.Value_1;
        var entity_to_follow = -4;
        var max_line_position = -1;
        
        if (instance_exists(obj_parent_player))
            entity_to_follow = obj_parent_player;
        
        with (obj_beeswarm)
        {
            if (true && linePosition != -1)
            {
                if (linePosition > max_line_position)
                {
                    max_line_position = linePosition;
                    entity_to_follow = self;
                }
            }
        }
        
        linePosition = max_line_position + 1;
        entityToFollow = entity_to_follow;
        sprite_index = spr_beeswarm;
        image_index = 0;
        state = UnknownEnum.Value_1;
        
        if (instance_exists(obj_parent_player))
        {
            var bees = [];
            
            with (obj_beeswarm)
            {
                if (linePosition != -1)
                    bees[array_length(bees)] = self;
            }
            
            array_sort(bees, function(arg0, arg1)
            {
                var dist1;
                
                with (arg0)
                    dist1 = distance_to_object(obj_parent_player);
                
                var dist2;
                
                with (arg1)
                    dist2 = distance_to_object(obj_parent_player);
                
                if (dist1 == dist2)
                    return 0;
                else if (dist1 > dist2)
                    return 1;
                else
                    return -1;
            });
            
            for (var i = 0; i < array_length(bees); i++)
            {
                with (bees[i])
                {
                    entityToFollow = (i == 0) ? obj_parent_player : bees[i - 1];
                    linePosition = i;
                }
            }
        }
    }
    else
    {
        riseTargetX = riseTargetXInitial + (50 * ((60 - riseTimer) / 60) * riseXOffsetSign);
        speed = min(ceil(riseTimer / 8), distance_to_point(riseTargetX, riseTargetY) / 4);
        direction = angle_rotate(direction, point_direction(x, y, riseTargetX, riseTargetY), 4);
        image_angle = direction;
        riseTimer--;
        sprite_index = spr_beeswarm_rise;
    }
}
else if (state == UnknownEnum.Value_1)
{
    if (entityToFollow == -4 || !instance_exists(entityToFollow))
    {
        if (instance_exists(obj_parent_player))
            entityToFollow = obj_parent_player;
        else
            exit;
    }
    
    speed = min(6, distance_to_point(entityToFollow.x, entityToFollow.y) / 8);
    
    if (angerTimer > 0)
        speed *= 1.65;
    
    direction = angle_rotate(direction, point_direction(x, y, entityToFollow.x, entityToFollow.y), 4);
    image_angle = direction;
    sprite_index = spr_beeswarm;
}
