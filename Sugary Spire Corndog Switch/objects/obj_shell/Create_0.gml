depth = -9999;
isOpen = false;
isAutocompleteOpen = false;
shellSurface = -4;
scrollSurface = -4;
shellOriginX = 0;
shellOriginY = 0;
visibleWidth = 0;
visibleHeight = 0;
cursorPos = 1;
consoleString = "";
savedConsoleString = "";
scrollPosition = 0;
maxScrollPosition = 0;
targetScrollPosition = 0;
commandSubmitted = false;
insertMode = true;
historyPos = 0;
history = [];
output = [];
outputHeight = 0;
filteredSuggestions = [];
inputArray = [];
suggestionIndex = 0;
autocompleteMaxWidth = 0;
autocompleteScrollPosition = 0;
autocompleteOriginX = 0;
autocompleteOriginY = 0;
mousePreviousX = device_mouse_x_to_gui(0);
mousePreviousY = device_mouse_y_to_gui(0);
shellPropertiesHash = "";
killedString = "";
metaDeleted = false;
metaMovedLeft = false;
metaMovedRight = false;
deferredQueue = ds_queue_create();
savedHistoryFilePath = working_directory + "rt-shell-saved-history.data";
loadedSavedHistory = false;
loadedHistoryScrolled = false;
activeMouseArgType = undefined;
activeMouseArgValue = "";
event_user(0);

if (instance_number(object_index) > 1)
    instance_destroy();

function open()
{
    isOpen = true;
    keyboard_string = "";
    
    if (!is_undefined(openFunction))
        openFunction();
}

function close()
{
    isOpen = false;
    
    if (!is_undefined(closeFunction))
        closeFunction();
    
    while (!ds_queue_empty(deferredQueue))
    {
        var args = ds_queue_dequeue(deferredQueue);
        self._execute_script(args, true);
    }
    
    if (saveHistory)
        self._save_history();
}

function _close_autocomplete()
{
    array_resize(filteredSuggestions, 0);
}

availableFunctions = [];
allFunctions = [];
functionData = {};
var global_variables = variable_instance_get_names(global);

for (var i = 0; i < array_length(global_variables); i++)
{
    if (string_pos("meta_", string_lower(global_variables[i])) == 1)
    {
        var name = string_delete(string_lower(global_variables[i]), 1, 5);
        variable_struct_set(functionData, name, variable_instance_get(global, global_variables[i])());
    }
}

for (var i = 0; i < array_length(global_variables); i++)
{
    if (string_pos("sh_", string_lower(global_variables[i])) == 1)
    {
        var name = string_delete(string_lower(global_variables[i]), 1, 3);
        var hidden = false;
        var metadata = variable_struct_get(functionData, name);
        
        if (!is_undefined(metadata))
        {
            if (variable_struct_exists(metadata, "hidden"))
                hidden = metadata.hidden;
        }
        
        if (!hidden)
            array_push(availableFunctions, name);
        
        array_push(allFunctions, name);
    }
    
    array_sort(availableFunctions, true);
}

function _update_filtered_suggestions()
{
    array_resize(filteredSuggestions, 0);
    autocompleteMaxWidth = 0;
    suggestionIndex = 0;
    activeMouseArgType = undefined;
    var input_string = string(consoleString);
    inputArray = self._input_string_split(input_string);
    
    if (string_length(input_string) <= 0 || array_length(inputArray) <= 0)
        exit;
    
    draw_set_font(consoleFont);
    var space_count = array_length(inputArray) - 1;
    
    if (space_count == 0)
    {
        for (var i = 0; i < array_length(availableFunctions); i++)
        {
            if (string_pos(input_string, availableFunctions[i]) == 1 && input_string != availableFunctions[i])
            {
                array_push(filteredSuggestions, availableFunctions[i]);
                autocompleteMaxWidth = max(autocompleteMaxWidth, string_width(availableFunctions[i]));
            }
        }
    }
    else
    {
        var function_name = inputArray[0];
        var argument_index = space_count - 1;
        var data_exists = variable_struct_exists(functionData, function_name);
        var no_extra_space = string_char_at(input_string, string_last_pos(" ", input_string) - 1) != " ";
        
        if (data_exists && no_extra_space && space_count <= array_length(inputArray))
        {
            var suggestion_data = variable_struct_get(variable_struct_get(functionData, array_get(inputArray, 0)), "suggestions");
            var argument_suggestions = [];
            
            if (argument_index < array_length(suggestion_data))
            {
                if (is_array(suggestion_data[argument_index]))
                    argument_suggestions = suggestion_data[argument_index];
                else if (is_method(suggestion_data[argument_index]))
                    argument_suggestions = suggestion_data[argument_index]();
                else if (is_int64(suggestion_data[argument_index]))
                    activeMouseArgType = suggestion_data[argument_index];
                
                var current_argument = inputArray[array_length(inputArray) - 1];
                
                for (var i = 0; i < array_length(argument_suggestions); i++)
                {
                    var prefix_match = string_pos(current_argument, string_lower(argument_suggestions[i])) == 1;
                    
                    if (string_last_pos(" ", input_string) == string_length(input_string) || prefix_match)
                    {
                        array_push(filteredSuggestions, argument_suggestions[i]);
                        autocompleteMaxWidth = max(autocompleteMaxWidth, string_width(argument_suggestions[i]));
                    }
                }
            }
        }
    }
    
    autocompleteScrollPosition = 0;
    array_sort(filteredSuggestions, true);
}

function _find_common_prefix()
{
    if (array_length(filteredSuggestions) <= 0)
        return "";
    
    var first = string(filteredSuggestions[0]);
    var last = string(filteredSuggestions[array_length(filteredSuggestions) - 1]);
    var result = "";
    var space_count = string_count(" ", consoleString);
    
    if (space_count > 0)
    {
        for (var i = 0; i < space_count; i++)
            result += (inputArray[i] + " ");
    }
    
    for (var i = 1; i < (string_length(first) + 1); i++)
    {
        if (string_char_at(first, i) == string_char_at(last, i))
            result += string_char_at(first, i);
        else
            break;
    }
    
    return result;
}

function _key_combo_pressed(arg0, arg1)
{
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (!keyboard_check(arg0[i]))
            return false;
    }
    
    if (keyboard_check_pressed(arg1))
    {
        if (array_length(arg0) == 0)
        {
            if (keyboard_check(vk_shift) || keyboard_check(vk_control) || keyboard_check(vk_alt))
                return false;
        }
        
        return true;
    }
}

delayFrame = 0;
delayFrames = 1;

function _keyboard_check_delay(arg0)
{
    if (keyboard_check_released(arg0))
    {
        delayFrame = 0;
        delayFrames = 1;
        return false;
    }
    else if (!keyboard_check(arg0))
    {
        return false;
    }
    
    delayFrame = (delayFrame + 1) % delayFrames;
    
    if (delayFrame == 0)
        delayFrames = keyRepeatDelay;
    
    if (keyboard_check_pressed(arg0))
    {
        delayFrame = 0;
        delayFrames = keyRepeatInitialDelay;
        return true;
    }
    else if (keyboard_check(arg0) && delayFrame == 0)
    {
        return true;
    }
    
    return false;
}

function _shell_properties_hash()
{
    return md5_string_unicode(string(width) + "~" + string(height) + "~" + string(anchorMargin) + "~" + string(consolePaddingH) + "~" + string(scrollbarWidth) + "~" + string(consolePaddingV) + "~" + string(screenAnchorPointH) + "~" + string(screenAnchorPointV));
}

function _recalculate_shell_properties()
{
    var screen_center_x = display_get_gui_width() / 2;
    var screen_center_y = display_get_gui_height() / 2;
    draw_set_font(consoleFont);
    var em_height = string_height("M");
    var max_width = display_get_gui_width() - (anchorMargin * 2);
    var max_height = display_get_gui_height() - (anchorMargin * 2);
    width = clamp(width, 50, max_width);
    height = clamp(height, em_height, max_height);
    var half_width = width / 2;
    var half_height = height / 2;
    
    switch (screenAnchorPointH)
    {
        case "left":
            shellOriginX = anchorMargin - 1;
            break;
        
        case "center":
            shellOriginX = screen_center_x - half_width - 1;
            break;
        
        case "right":
            shellOriginX = display_get_gui_width() - width - anchorMargin - 1;
            break;
    }
    
    switch (screenAnchorPointV)
    {
        case "top":
            shellOriginY = anchorMargin - 1;
            break;
        
        case "middle":
            shellOriginY = screen_center_y - half_height - 1;
            break;
        
        case "bottom":
            shellOriginY = display_get_gui_height() - height - anchorMargin - 1;
            break;
    }
    
    visibleWidth = width - (2 * anchorMargin) - scrollbarWidth - (2 * consolePaddingH);
    visibleHeight = height - (2 * consolePaddingV);
    shellPropertiesHash = self._shell_properties_hash();
}

function _calculate_scroll_from_suggestion_index()
{
    if (suggestionIndex == 0)
        autocompleteScrollPosition = 0;
    else if (suggestionIndex >= (autocompleteScrollPosition + autocompleteMaxLines))
        autocompleteScrollPosition = max(0, (suggestionIndex - autocompleteMaxLines) + 1);
    else if (suggestionIndex < autocompleteScrollPosition)
        autocompleteScrollPosition -= suggestionIndex;
}

function _confirm_current_suggestion()
{
    var space_count = string_count(" ", consoleString);
    consoleString = "";
    
    for (var i = 0; i < space_count; i++)
        consoleString += (inputArray[i] + " ");
    
    consoleString += (filteredSuggestions[suggestionIndex] + " ");
    cursorPos = string_length(consoleString) + 1;
}

function _confirm_current_mouse_argument_data()
{
    if (activeMouseArgValue != "")
    {
        consoleString += (string(activeMouseArgValue) + " ");
        cursorPos = string_length(consoleString) + 1;
    }
}

function _execute_script(arg0, arg1 = false)
{
    var script = variable_global_get("sh_" + arg0[0]);
    
    if (!is_undefined(script))
    {
        var response;
        
        try
        {
            response = script_execute(asset_get_index(script_get_name(script)), arg0);
        }
        catch (_exception)
        {
            response = "-- ERROR: see debug output for details --";
            show_debug_message("---- ERROR executing rt-shell command [" + arg0[0] + "] ----");
            show_debug_message(_exception.message);
            show_debug_message(_exception.longMessage);
            show_debug_message(_exception.script);
            show_debug_message(_exception.stacktrace);
            show_debug_message("----------------------------");
        }
        
        if (!arg1)
        {
            array_push(history, consoleString);
            
            if (response != "")
                array_push(output, ">" + consoleString);
        }
        
        if (is_string(response))
            array_push(output, response);
        
        self._update_positions();
    }
    else
    {
        array_push(output, ">" + consoleString);
        array_push(output, "No such command: " + consoleString);
        array_push(history, consoleString);
        self._update_positions();
    }
}

function _update_positions()
{
    historyPos = array_length(history);
    consoleString = "";
    savedConsoleString = "";
    cursorPos = 1;
}

function _save_history()
{
    var truncated_history = [];
    var truncated_output = [];
    array_copy(truncated_history, 0, history, max(0, array_length(history) - savedHistoryMaxSize), min(array_length(history), savedHistoryMaxSize));
    array_copy(truncated_output, 0, output, max(0, array_length(output) - savedHistoryMaxSize), min(array_length(output), savedHistoryMaxSize));
    var to_save = 
    {
        history: truncated_history,
        output: truncated_output
    };
    var open_file = file_text_open_write(savedHistoryFilePath);
    file_text_write_string(open_file, json_stringify(to_save));
    file_text_close(open_file);
}

function _load_history()
{
    var save_data_file = file_find_first(savedHistoryFilePath, 16);
    
    if (save_data_file != "")
    {
        var open_file = file_text_open_read(savedHistoryFilePath);
        var temp_data = json_parse(file_text_read_string(open_file));
        file_text_close(open_file);
        history = temp_data.history;
        output = temp_data.output;
        historyPos = array_length(history);
    }
}

function _input_string_split(arg0)
{
    var slot = 0;
    var splits = [];
    var str2 = "";
    var in_quotes = false;
    
    for (var i = 1; i < (string_length(arg0) + 1); i++)
    {
        var curr_str = string_char_at(arg0, i);
        
        if (!in_quotes)
        {
            if (curr_str == "\"")
            {
                in_quotes = true;
                continue;
            }
            
            if (curr_str == " ")
            {
                if (str2 != "")
                {
                    splits[slot] = str2;
                    slot++;
                }
                
                str2 = "";
            }
            else
            {
                str2 = str2 + curr_str;
                splits[slot] = str2;
            }
        }
        else if (curr_str == "\"")
        {
            in_quotes = false;
            splits[slot] = str2;
        }
        else
        {
            str2 = str2 + curr_str;
        }
    }
    
    if (str2 == "" || in_quotes)
        splits[slot] = str2;
    
    return splits;
}

function _array_contains(arg0, arg1)
{
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (arg0[i] == arg1)
            return true;
    }
    
    return false;
}

function _remap(arg0, arg1, arg2, arg3, arg4)
{
    var _t = (arg0 - arg1) / (arg2 - arg1);
    return lerp(arg3, arg4, _t);
}
