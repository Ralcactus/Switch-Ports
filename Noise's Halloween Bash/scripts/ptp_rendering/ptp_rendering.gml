function reset_resolution()
{
    var _width = global.currentinternalres[0];
    var _height = global.currentinternalres[1];
    var _width2 = global.currentres[0];
    var _height2 = global.currentres[1];
    var _width3 = global.maxscreenwidth;
    var _height3 = global.maxscreenheight;
    view_wport[0] = _width;
    view_hport[0] = _height;
    camera_set_view_size(view_camera[0], _width, _height);
    surface_resize(application_surface, _width, _height);
   
    
    display_reset(0, global.vsync);
}

function apply_videoglobals()
{
    global.currentres = global.screensizes[global.resmode][global.resnumb];
    global.currentinternalres = global.screensizes[global.resmode][1];
    reset_resolution();
}

function get_game_width()
{
    return global.currentinternalres[0];
}

function get_game_height()
{
    return global.currentinternalres[1];
}
