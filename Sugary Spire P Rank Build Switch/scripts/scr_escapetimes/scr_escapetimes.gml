function scr_escapetimes(_room = room)
{
    var seconds = 0;
    var minutes = 0;
    
    switch (_room)
    {
        case steamy_12:
            minutes = 4;
            seconds = 0;
            break;
        
        case entryway_11:
            minutes = 3;
            seconds = 0;
            break;
        
        case molasses_9:
            minutes = 5;
            seconds = 0;
            break;
        
        case mines_11:
            minutes = 4;
            seconds = 50;
            break;
        
        case dragonlair_2:
            minutes = 15;
            seconds = 30;
            break;
        
        case mountain_11:
            minutes = 5;
            seconds = 0;
            break;
        
        case entryway_1:
            minutes = 5;
            seconds = 0;
            break;
        
        case sucrose_2:
            minutes = 7;
            seconds = 30;
            break;
        
        case dance_pillar:
            minutes = 4;
            seconds = 0;
            break;
        
        case estate_7:
            minutes = 4;
            seconds = 55;
            break;
        
        case bee_12:
            minutes = 4;
            seconds = 0;
            break;
        
        default:
            minutes = 99124871759815;
            seconds = 59;
            break;
    }
    
    var time_array;
    time_array[0] = minutes;
    time_array[1] = seconds;
    return time_array;
}

function scr_laptimes(_room = room)
{
    var seconds = 0;
    var minutes = 0;
    
    switch (_room)
    {
        case entryway_portal:
            minutes = 0;
            seconds = 45;
            break;
        
        case steamy_portal:
            minutes = 1;
            seconds = 0;
            break;
        
        case molasses_1:
            minutes = 1;
            seconds = 20;
            break;
        
        case mines_1:
            minutes = 1;
            seconds = 45;
            break;
        
        case sucrose_portal:
            minutes = 2;
            seconds = 30;
            break;
        
        default:
            minutes = 0;
            seconds = 45;
            break;
    }
    
    var time_array;
    time_array[0] = minutes;
    time_array[1] = seconds;
    return time_array;
}
