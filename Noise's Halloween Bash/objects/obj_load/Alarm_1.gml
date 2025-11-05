///@description Phase 2 (Model Loading)
if (array_length(modellist) > 0)
{
    loadedassets++;
    var _modelname = array_pop(modellist);
    
    if (is_array(_modelname))
    {
        var _basename = _modelname[0];
        variable_struct_set(global.altMaterials, _basename, {});
        
        for (var _i = 0; _i < array_length(_modelname); _i++)
        {
            var _library = "_altmat_lib_";
            var _name = -1;
            
            if (_i <= 0)
            {
                global.loadedModels[? _basename] = DotobjModelLoadFile(working_directory + "Data/ModelData/" + _basename + ".obj");
                global.loadedModels[? _basename].Freeze();
                var _mat = array_get(global.loadedModels[? _basename].GetMaterials(), 0);
                _name = _mat.name;
                _library = _mat.library;
                trace(string("Phase 2: Loaded Model {0}", _basename));
            }
            else
            {
                _name = import_material("_altmat_lib_", working_directory + "Data/ModelData/" + _modelname[_i] + ".mtl");
                _library = "_altmat_lib_";
            }
            
            if (_name == -1)
                trace(string("Phase 2: Error Loading Model {0}", _modelname[_i]));
            
            variable_struct_set(global.altMaterials, array_get(_modelname, _i), 
            {
                model: _basename,
                library: _library,
                material: _name
            });
        }
    }
    else
    {
        global.loadedModels[? _modelname] = DotobjModelLoadFile(working_directory + "Data/ModelData/" + _modelname + ".obj");
        global.loadedModels[? _modelname].Freeze();
        trace(string("Phase 2: Loaded Model {0}", _modelname));
    }
    
    alarm[1] = 1;
}
else
{
    trace("Loading: Phase 2 Finished");
    trace("Loading: Begin Phase 3 (3D Tile Generation)");
    alarm[2] = 1;
}
