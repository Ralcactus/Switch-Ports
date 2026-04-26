if (isOpen)
{
    draw_set_font(consoleFont);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    var em_width = string_width("M");
    var em_height = string_height("M");
    
    if (!surface_exists(shellSurface))
    {
        shellSurface = surface_create(display_get_gui_width(), display_get_gui_height());
        self._recalculate_shell_properties();
    }
    else if (surface_get_width(shellSurface) != display_get_gui_width() || surface_get_height(shellSurface) != display_get_gui_height())
    {
        surface_resize(shellSurface, display_get_gui_width(), display_get_gui_height());
    }
    
    var prompt_x_offset = consolePaddingH + string_width(prompt) + anchorMargin;
    outputHeight = 0;
    
    for (var i = 0; i < array_length(output); i++)
        outputHeight += string_height_ext(output[i], -1, visibleWidth - prompt_x_offset);
    
    if (!surface_exists(scrollSurface))
        scrollSurface = surface_create(display_get_gui_width(), visibleHeight);
    else if (surface_get_width(scrollSurface) != display_get_gui_width() || surface_get_height(scrollSurface) != visibleHeight)
        surface_resize(scrollSurface, display_get_gui_width(), visibleHeight);
    
    var new_max_scroll = max(0, (outputHeight - visibleHeight) + em_height);
    
    if (maxScrollPosition != new_max_scroll)
    {
        maxScrollPosition = new_max_scroll;
        
        if (scrollSmoothness == 0)
            scrollPosition = maxScrollPosition;
        
        targetScrollPosition = maxScrollPosition;
        commandSubmitted = false;
    }
    
    surface_set_target(scrollSurface);
    draw_clear_alpha(c_black, 0);
    var y_offset = -scrollPosition;
    
    if (outputHeight < (visibleHeight - em_height))
        y_offset += (visibleHeight - outputHeight - em_height);
    
    for (var i = 0; i < array_length(output); i++)
    {
        var output_str = output[i];
        
        if (string_char_at(output_str, 1) == ">")
        {
            draw_set_color(fontColorSecondary);
            draw_text(shellOriginX + consolePaddingH, y_offset, prompt);
            draw_text_ext(shellOriginX + prompt_x_offset, y_offset, string_delete(output_str, 1, 1), -1, visibleWidth - prompt_x_offset);
        }
        else
        {
            draw_set_color(fontColor);
            draw_text_ext(shellOriginX + prompt_x_offset, y_offset, output_str, -1, visibleWidth - prompt_x_offset);
        }
        
        y_offset += string_height_ext(output_str, -1, visibleWidth - prompt_x_offset);
    }
    
    draw_set_color(promptColor);
    draw_text(shellOriginX + consolePaddingH, y_offset, prompt);
    draw_set_color(fontColor);
    draw_text(shellOriginX + prompt_x_offset, y_offset, consoleString);
    var cursor_pos_x = shellOriginX + prompt_x_offset + string_width(string_copy(consoleString + " ", 1, cursorPos - 1));
    
    if (insertMode)
    {
        if (delayFrames > 1 || (current_time % 1000) < 600)
            draw_line_width(cursor_pos_x, y_offset, cursor_pos_x, y_offset + em_height, 1);
        else if (keyboard_check(vk_anykey))
            draw_line_width(cursor_pos_x, y_offset, cursor_pos_x, y_offset + em_height, 1);
    }
    else
    {
        draw_line_width((cursor_pos_x + (em_width / 2)) - 1, y_offset, (cursor_pos_x + (em_width / 2)) - 1, y_offset + em_height, em_width);
        draw_set_color(promptColor);
        draw_text(cursor_pos_x, y_offset, string_copy(consoleString, cursorPos, 1));
    }
    
    if (array_length(inputArray) > 0)
    {
        var ff = (array_length(filteredSuggestions) > 0 && array_length(inputArray) == 1) ? filteredSuggestions[suggestionIndex] : inputArray[0];
        var data = variable_struct_get(functionData, ff);
        var space_count = array_length(inputArray) - 1;
        var suggestion = (space_count == 0) ? ff : "";
        
        if (!is_undefined(activeMouseArgType) && space_count > 0)
        {
            if (inputArray[array_length(inputArray) - 1] == "")
            {
                suggestion = string(activeMouseArgValue);
                
                if (mouse_check_button_pressed(mb_left))
                {
                    self._confirm_current_mouse_argument_data();
                    self._update_filtered_suggestions();
                }
            }
        }
        
        if (data != undefined)
        {
            var args = "";
            
            if (array_length(filteredSuggestions) > 0 && space_count > 0)
            {
                if (array_length(inputArray) > space_count)
                    args += string_copy(filteredSuggestions[suggestionIndex], string_length(inputArray[array_length(inputArray) - 1]) + 1, string_length(filteredSuggestions[suggestionIndex]));
                else
                    args += filteredSuggestions[suggestionIndex];
            }
            
            for (var i = space_count; i < array_length(variable_struct_get(data, "arguments")); i++)
            {
                args += " ";
                args += data.arguments[i];
            }
            
            suggestion += args;
            
            if (space_count == 0)
                suggestion = string_copy(suggestion, string_length(consoleString) + 1, string_length(suggestion) - string_length(consoleString));
        }
        else
        {
            suggestion = string_copy(ff, string_length(consoleString) + 1, string_length(ff) - string_length(consoleString));
        }
        
        draw_set_color(fontColorSecondary);
        draw_text(shellOriginX + prompt_x_offset + string_width(consoleString), y_offset, suggestion);
    }
    
    surface_reset_target();
    surface_set_target(shellSurface);
    draw_clear_alpha(c_black, 0);
    
    if (consoleBackground != -4)
    {
        draw_sprite_stretched(consoleBackground, 0, shellOriginX, shellOriginY, width, height);
    }
    else
    {
        draw_set_alpha(consoleAlpha);
        draw_set_color(consoleColor);
        draw_roundrect_ext(shellOriginX, shellOriginY, shellOriginX + width, shellOriginY + height, cornerRadius, cornerRadius, false);
    }
    
    draw_surface(scrollSurface, 0, shellOriginY + 1 + consolePaddingV);
    
    if (outputHeight > (visibleHeight - em_height))
    {
        var x1 = (shellOriginX + width) - consolePaddingH - scrollbarWidth;
        var y1 = shellOriginY + consolePaddingV + 1;
        var x2 = x1 + scrollbarWidth;
        var y2 = (shellOriginY + height) - consolePaddingV;
        draw_set_color(fontColorSecondary);
        draw_rectangle(x1, y1, x2, y2, false);
        var container_height = y2 - y1;
        var scroll_progress = scrollPosition / ((outputHeight - visibleHeight) + em_height);
        var scrollbar_height = (visibleHeight / (outputHeight + em_height)) * container_height;
        var scrollbar_position = (container_height - scrollbar_height) * scroll_progress;
        y1 = y1 + scrollbar_position;
        y2 = y1 + scrollbar_height;
        draw_set_color(fontColor);
        draw_rectangle(x1, y1, x2, y2, false);
    }
    
    if (array_length(filteredSuggestions) > 0)
    {
        if (enableAutocomplete && autocompleteMaxLines > 0)
        {
            isAutocompleteOpen = true;
            var suggestions_amount = min(autocompleteMaxLines, array_length(filteredSuggestions));
            var string_parts = self._input_string_split(consoleString);
            var suggest_x_offset = 0;
            
            for (var i = 0; i < (array_length(string_parts) - 1); i++)
                suggest_x_offset += (string_width(string_parts[i]) + em_width);
            
            var x1 = (shellOriginX + prompt_x_offset + suggest_x_offset) - autocompletePadding;
            var y1 = (shellOriginY + height) - em_height - (suggestions_amount * em_height) - (autocompletePadding * 2) - consolePaddingV;
            var x2 = x1 + autocompleteMaxWidth + (autocompletePadding * 2) + ((suggestions_amount < array_length(filteredSuggestions)) ? scrollbarWidth : 0);
            var y2 = y1 + (suggestions_amount * em_height) + (autocompletePadding * 2);
            
            if (screenAnchorPointV == "top")
            {
                y1 = (shellOriginY + height) - consolePaddingV;
                y2 = y1 + (suggestions_amount * em_height);
            }
            
            autocompleteOriginX = x1;
            autocompleteOriginY = y1;
            
            if (suggestionsBackground != -4)
            {
                draw_sprite_stretched(suggestionsBackground, 0, x1, y1, x2 - x1, y2 - y1);
            }
            else
            {
                draw_set_color(autocompleteBackgroundColor);
                draw_rectangle(x1, y1, x2, y2, false);
                draw_set_color(fontColorSecondary);
                draw_rectangle(x1, y1, x2, y2, true);
            }
            
            if (suggestions_amount < array_length(filteredSuggestions))
            {
                draw_rectangle(x2 - (scrollbarWidth / 2), y1, x2, y2, false);
                var scrollbar_total_height = y2 - y1;
                var scrollbar_height = (suggestions_amount / array_length(filteredSuggestions)) * scrollbar_total_height;
                var scrollbar_progress = (array_length(filteredSuggestions) - autocompleteScrollPosition) / array_length(filteredSuggestions);
                var y_scroll_1 = y1 + (scrollbar_total_height * (1 - scrollbar_progress)) + 1;
                var y_scroll_2 = (y_scroll_1 + scrollbar_height) - 1;
                draw_set_color(fontColor);
                draw_rectangle(x2 - (scrollbarWidth / 2), y_scroll_1, x2 + 1, y_scroll_2, false);
            }
            
            draw_set_color(fontColor);
            
            for (var i = 0; i < array_length(filteredSuggestions); i++)
            {
                if (i < suggestions_amount)
                {
                    var y1_col = y1 + (i * em_height);
                    var y2_col = ((y1 + (i * em_height) + em_height) - 1) + autocompletePadding;
                    
                    if (point_in_rectangle(device_mouse_x_to_gui(0) - 1, device_mouse_y_to_gui(0) - 1, x1, y1_col, x2, y2_col))
                    {
                        if (device_mouse_x_to_gui(0) != mousePreviousX || device_mouse_y_to_gui(0) != mousePreviousY)
                        {
                            suggestionIndex = i + autocompleteScrollPosition;
                            mousePreviousX = device_mouse_x_to_gui(0);
                            mousePreviousY = device_mouse_y_to_gui(0);
                        }
                        
                        if (mouse_check_button_pressed(mb_left))
                        {
                            if (suggestionIndex == (i + autocompleteScrollPosition))
                            {
                                self._confirm_current_suggestion();
                                self._update_filtered_suggestions();
                                break;
                            }
                            else
                            {
                                suggestionIndex = i + autocompleteScrollPosition;
                            }
                        }
                    }
                    
                    if ((i + autocompleteScrollPosition) == suggestionIndex)
                        draw_set_color(promptColor);
                    else
                        draw_set_color(fontColorSecondary);
                    
                    var position_array = i + autocompleteScrollPosition;
                    draw_text(x1 + autocompletePadding, y1 + (i * em_height) + autocompletePadding, filteredSuggestions[position_array]);
                }
            }
        }
    }
    else
    {
        isAutocompleteOpen = false;
        autocompleteScrollPosition = 0;
    }
    
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_font(-1);
    surface_reset_target();
    draw_surface(shellSurface, 0, 0);
}
