function scr_levelstart(arg0, arg1)
{
    switch (arg0)
    {
        case "entryway":
            global.srank = 19500;
            break;
        
        case "steamy":
            global.srank = 23000;
            break;
        
        case "molasses":
            global.srank = 23500;
            break;
        
        case "mines":
            global.srank = 26500;
            break;
        
        case "fudge":
            global.srank = 28000;
            break;
        
        case "dance":
            global.srank = 21000;
            break;
        
        case "sucrose":
            global.srank = 18000;
            break;
        
        case "estate":
            global.srank = 26500;
            break;
        
        case "bee":
            global.srank = 28800;
            break;
        
        default:
            global.srank = 99999;
            break;
    }
    
    global.levelname = arg0;
    global.firstlvlRoom = arg1;
    global.arank = global.srank * 0.75;
    global.brank = global.srank * 0.5;
    global.crank = global.srank * 0.25;
}
