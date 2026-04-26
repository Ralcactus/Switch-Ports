fade = (distance_to_object(obj_parent_player) - 50) / 250;
showtext = false;

if (distance_to_object(obj_parent_player) < 50)
{
    showtext = true;
    
    switch (level)
    {
        default:
            with (obj_tv)
            {
                message = string_upper(other.level);
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "tutorial":
            with (obj_tv)
            {
                message = "TUTORIAL";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "entryway":
            with (obj_tv)
            {
                message = "ENTRYWAY";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "steamy":
            with (obj_tv)
            {
                message = "COTTONTOWN";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "mines":
            with (obj_tv)
            {
                message = "SUGARSHACK MINES";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "molasses":
            with (obj_tv)
            {
                message = "MOLASSES SWAMP";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "fudge":
            with (obj_tv)
            {
                message = "MT FUDGETOP";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "dance":
            with (obj_tv)
            {
                message = "DANCE OFF";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "sucrose":
            with (obj_tv)
            {
                message = "SUCROSE SNOWSTORM";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "martian":
            with (obj_tv)
            {
                message = "MARTIAN FREEZER";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "bee":
            with (obj_tv)
            {
                message = "STING OPERATION";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "stormy":
            with (obj_tv)
            {
                message = "COTTONSTORM";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
        
        case "dragonlair":
            with (obj_tv)
            {
                message = "DRAGON ZONE";
                showtext = 1;
                alarm[0] = 2;
            }
            
            break;
    }
}
