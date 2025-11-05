if (obj_player.ondeathplatform == id)
{
    var _col;
    
    do
    {
        _col = instance_place(path_get_x(pathB, 1), path_get_y(pathB, 1), obj_deathplatform);
        
        if (_col)
            instance_destroy(_col);
    }
    until (!_col);
    
    persistent = !((returnTrip && room == obj_player.beforedeathroute.room) || room == startingroom);
}
