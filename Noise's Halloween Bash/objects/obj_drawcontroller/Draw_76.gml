enum scaletype 
{
	fit = 0,
	fill = 1,
	pixelperfect = 2,
	exact = 3,
}

gpu_set_ztestenable(true);
windowwidth = window_get_width();
windowheight = window_get_height();

switch (global.scalemode)
{
    case scaletype.fit:
        appscalex = min(windowwidth / global.currentres[0], windowheight / global.currentres[1]);
        appscaley = min(windowwidth / global.currentres[0], windowheight / global.currentres[1]);
        break;
    
    case scaletype.fill:
        appscalex = windowwidth / global.currentres[0];
        appscaley = windowheight / global.currentres[1];
        break;
    
    case scaletype.pixelperfect:
        appscalex = floor(min(windowwidth / global.currentres[0], windowheight / global.currentres[1]));
        appscaley = floor(min(windowwidth / global.currentres[0], windowheight / global.currentres[1]));
        break;
    
    case scaletype.exact:
        appscalex = 1;
        appscaley = 1;
        break;
}

if (global.scalemode != scaletype.fill && global.scalemode != scaletype.exact)
{
    if (global.currentres[0] > windowwidth || global.currentres[1] > windowheight)
    {
        appscalex = min(windowwidth / global.currentres[0], windowheight / global.currentres[1]);
        appscaley = min(windowwidth / global.currentres[0], windowheight / global.currentres[1]);
    }
}
