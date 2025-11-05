optionstack = ds_stack_create();
var _debug = false;

#region Check Game Launch Parameters
for (var i = 0; i < parameter_count(); i++)
{
    var _param = string_lower(parameter_string(i));
    
    if (_param == "-debug" || _param == "--debug" || _param == "-devmode")
    {
        _debug = true;
        break;
    }
}

if (!_debug)
{
    global.visiblesolids = false;
    instance_destroy();
    exit;
}
#endregion
#region Debug Menu Functions
function DEBUGMenuItem(_name, _func) constructor
{
    static draw = function(_x, _y, _col_dark)
    {
        var _c = c_white;
        if (_col_dark) 
			_c = c_black;
        
        __draw_text_colour_hook(round(_x), round(_y), name, _c, _c, _c, _c, 1);
    };
    
    static jump = function(_parent, _option)
    {
        func(_parent, _option);
    };
    
    static atk = function(_parent, _option) { };
    
    name = _name;
    func = _func;
    parent = noone;
}

function DEBUGFolder(_name, _options) : DEBUGMenuItem(_name) constructor
{
    static enterfolder = function(_folder)
    {
        var _memyselfandi = self;
        
        with (_folder)
            ds_stack_push(optionstack, _memyselfandi);
    };
    
    static exitfolder = function(_folder)
    {
        if (ds_stack_size(_folder.optionstack) > 1)
            ds_stack_pop(_folder.optionstack);
        else
            _folder.open = false;
    };
    
    static drawoptions = function()
    {
        var _gy = 32;
        var _maxoptions = 7;
        draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, 220, 32, #D54368, 1);
        __draw_text_colour_hook(10, 16, name, c_white, c_white, c_white, c_white, 1);
        
        for (var _i = 0; _i < array_length(options); _i++)
        {
            var _scrollop = optionselected - 3;
            
            if (_scrollop < 0)
                _scrollop = 0;
            
            if (_scrollop > (array_length(options) - _maxoptions))
                _scrollop = array_length(options) - _maxoptions;
            
            if (_i < _scrollop || (_i - _scrollop) >= _maxoptions)
                continue;
            
            draw_sprite_stretched_ext(spr_1x1, 0, 0, _gy, 200, 32, (_i == optionselected) ? c_white : c_black, 1);
            
            if (_i == _scrollop && _i != 0)
                __draw_text_colour_hook(100, _gy + 16, "^", c_white, c_white, c_white, c_white, 1);
            else if ((_i - _scrollop) == (_maxoptions - 1) && _i != (array_length(options) - 1))
                __draw_text_colour_hook(100, _gy + 16, "v", c_white, c_white, c_white, c_white, 1);
            else
                options[_i].draw(5, _gy + 16, _i == optionselected);
            
            _gy += 32;
        }
    };
    
    static jump = function(_selected)
    {
        enterfolder(_selected);
    };
    
    static atk = function(_selected)
    {
        exitfolder(_selected);
    };
    
    optionselected = 0;
    name = _name;
    options = _options;
    array_foreach(options, function(_option, _parent)
    {
        _option.parent = self;
    });
}

var _roomoptions = array_create(0);

for (var i = 0; room_exists(i); i++)
{
    array_push(_roomoptions, new DEBUGMenuItem(room_get_name(i), function(_option, _room)
    {
        room_goto(asset_get_index(_room.name));
        _option.open = false;
        
        while (ds_stack_size(_option.optionstack) > 1)
            ds_stack_pop(_option.optionstack);
    }));
}
#endregion
#region Debug Options
var _baseoptions = new DEBUGFolder("DebugJr v0.1", [
new DEBUGMenuItem("Toggle Collisions", function(_option)
{
    global.visiblesolids = !global.visiblesolids;
    _option.open = false;
}), 
new DEBUGMenuItem("Toggle Noclip", function(_option)
{
    if (instance_exists(obj_jegplayer))
    {
        with (obj_jegplayer)
            noclip = !noclip;
    }
    else if (obj_player.state == states.noclip)
        obj_player.state = obj_player.debugstate;
    else
    {
        obj_player.debugstate = obj_player.state;
        obj_player.state = states.noclip;
        
        if (!game_paused())
            instance_destroy(obj_optionsmenu);
    }
    
    _option.open = false;
}), 
new DEBUGFolder("Go to Room", _roomoptions), 
new DEBUGMenuItem("Toggle Debug Camera", function(_option)
{
    if (obj_drawcontroller.debugcamcontrols)
    {
        obj_player.state = obj_player.debugstate;
        obj_drawcontroller.debugcam = false;
        obj_drawcontroller.debugcamcontrols = false;
    }
    else
    {
        obj_player.debugstate = obj_player.state;
        obj_player.state = states.debug;
        obj_drawcontroller.debugcam = true;
        obj_drawcontroller.debugcamcontrols = true;
        
        if (!game_paused())
            instance_destroy(obj_optionsmenu);
    }
    
    _option.open = false;
}), 
new DEBUGMenuItem("Lock/Unlock Camera", function(_option)
{
    if (obj_drawcontroller.debugcam && !obj_drawcontroller.debugcamcontrols)
    {
        obj_drawcontroller.debugcam = false;
        obj_drawcontroller.debugcamcontrols = false;
    }
    else
    {
        if (obj_player.state == states.debug)
            obj_player.state = obj_player.debugstate;
        
        obj_drawcontroller.debugcam = true;
        obj_drawcontroller.debugcamcontrols = false;
    }
    
    _option.open = false;
}), 
new DEBUGMenuItem("Reset Player", function(_option)
{
    if (room != Titlescreen)
        player_reset(false);
    
    _option.open = false;
}), 
new DEBUGMenuItem("Reset Cycle", function(_option)
{
    global.game_cycleF = 0;
    global.game_cycleMS = 0;
    _option.open = false;
}), 
new DEBUGMenuItem("Give Masks", function(_option)
{
    obj_player.hp = 3;
    _option.open = false;
}), 
new DEBUGMenuItem("Destroy Crates", function(_option)
{
    with (obj_destroyablenitroarrow)
    {
        instance_destroy(id, false);
        event_perform(ev_destroy, 0);
    }
    
    instance_destroy(par_crate);
    _option.open = false;
}), 
new DEBUGMenuItem("Reveal Map", function(_option)
{
    for (var i = 0; i < array_length(obj_levelmap.visitedrooms); i++)
        obj_levelmap.visitedrooms[i] = true;
    
    _option.open = false;
}), 
new DEBUGMenuItem("Toggle GodMode", function(_option)
{
    global.godmode = !global.godmode;
    _option.open = false;
}), 
new DEBUGMenuItem("Toggle Switches", function(_option)
{
    global.switchstate = !global.switchstate;
    _option.open = false;
}), 
new DEBUGMenuItem("Give All Pumpkins", function(_option)
{
    global.pumpkintotal = 10;
    _option.open = false;
}), 
new DEBUGFolder("Kill Player", 
[
	new DEBUGMenuItem("Normal Death", function(_option)
	{
		with (obj_player)
		    scr_hurtplayer(5);
    
		_option.open = false;
    
		while (ds_stack_size(_option.optionstack) > 1)
		    ds_stack_pop(_option.optionstack);
	}), new DEBUGMenuItem("Explosion Death", function(_option)
	{
		scr_hurtplayer(5, playerdeath.gibdeath);
		instance_create_depth(obj_player.x, obj_player.y, 10, obj_explosion);
		_option.open = false;
    
		while (ds_stack_size(_option.optionstack) > 1)
		    ds_stack_pop(_option.optionstack);
	}), new DEBUGMenuItem("Fire Death", function(_option)
	{
		with (obj_player)
		    scr_hurtplayer(5, playerdeath.firedeath);
    
		_option.open = false;
    
		while (ds_stack_size(_option.optionstack) > 1)
		    ds_stack_pop(_option.optionstack);
	})
]), 
new DEBUGMenuItem("Give Points", function(_option)
{
    global.collect += 1000;
    _option.open = false;
}), 
new DEBUGMenuItem("Rank Test", function(_option)
{
    room_goto(RankRoom);
    obj_player.state = states.actor;
    _option.open = false;
}), 
new DEBUGMenuItem("Credits Test", function(_option)
{
    room_goto(Credits);
    obj_player.state = states.actor;
    _option.open = false;
}), 
new DEBUGMenuItem("Evil Teleport", function(_option)
{
    with (obj_deathplatform)
    {
        if (!in_room())
            continue;
        
        obj_player.x = x;
        obj_player.y = y - 30;
    }
    
    _option.open = false;
})

]);
#endregion

_baseoptions.jump(id);
open = false;
depth = -15500;
