if (!global.freezeframe)
{
    var _player = instance_nearest(x, y, obj_parent_player);
    
    if (place_meeting(x, y - 1, _player) && _player.grounded && !_player.cutscene && _player.state != UnknownEnum.Value_134 && _player.state != UnknownEnum.Value_0)
    {
        with (_player)
        {
            if (state == UnknownEnum.Value_150 || state == UnknownEnum.Value_152 || state == UnknownEnum.Value_153)
            {
                state = UnknownEnum.Value_151;
                
                if (move != 0)
                    xscale = move;
                else if (hsp != 0)
                    xscale = sign(hsp);
            }
            
            if (state != UnknownEnum.Value_151)
                state = UnknownEnum.Value_53;
            
            movespeed = clamp(movespeed, 12, 14);
        }
    }
}
