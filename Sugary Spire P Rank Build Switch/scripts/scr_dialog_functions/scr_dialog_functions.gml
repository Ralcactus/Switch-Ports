/// @desc - Queues an array of dialog to run through the NPC Dialog handler
/// @param argument0 - Array which contains all the dialog to run
/// @param {bool} [instant] - Whether to set the NPC's id when running functions (dunno if it matters lol)
function queue_dialogue(arg0, instant = false)
{
    reset_dialogue();
    
    if (!instance_exists(obj_dialogue))
        instance_create(0, 0, obj_dialogue);
    
    with (obj_dialogue)
    {
        if (obj_dialogue.state == dialogstate.outro)
            obj_dialogue.state = dialogstate.intro;
        
        if (instant)
            obj_dialogue.state = dialogstate.normal;
        
        obj_dialogue.curmsg = 0;
    }
    
    global.dialogmsg = arg0;
}

/// @desc - Deletes all dialog and choices, mainly used to reset dialog before queueing new one to prevent crashes
function reset_dialogue()
{
    instance_destroy(obj_dialogue);
    instance_destroy(obj_dialogue_choices);
    global.dialogmsg = noone;
    global.dialogchoices = noone;
    global.choiced = noone;
}

/// @desc - Creates array of dialogs used for Dialog Handler
/// @param {any*} - Text to write out in dialog
/// @param {real} [sprite] - Background sprite for the bubble
/// @param {real} [func] - Function to run when this message is done
/// @returns {array} - Array that dialog handler uses to process options for the message
function create_dialogue(text, sprite = noone, func = noone)
{
    return [text, sprite, func];
}

/// @desc - Creates array of choice used for Choice Handler
/// @param {any*} text - Text for the option that is shown when selecting
/// @param {any*} func - Function to run when selecting respective choice
/// @returns {array} - Array that choice handler uses to process options for the message
function create_choice(text, func)
{
    return [text, func];
}

/// @desc - Queues array of choices to be ran through Dialog Choice Handler
/// @param {any*} argument0 - Array input that has all the choices that will be queued
/// @param {any*} text - Text that describes what exactly the choices are for
function queue_choices(arg0, text)
{
    reset_dialogue();
    
    with (instance_create(x, y, obj_dialogue_choices))
        msg_text = text;
    
    global.dialogchoices = arg0;
    show_debug_message(global.dialogchoices);
}

/// string_wordwrap_width(string,width,break,split)
//
//  Returns a given string, word wrapped to a pixel width,
//  with line break characters inserted between words.
//  Uses the currently defined font to determine text width.
//
//      string      text to word wrap, string
//      width       maximum pixel width before a line break, real
//      break       line break characters to insert into text, string
//      split       split words that are longer than the maximum, bool
//
/// GMLscripts.com/license
function text_wrap(arg0, arg1, arg2, arg3)
{
    var pos_space = -1;
    var pos_current = 1;
    var text_current = arg0;
    
    if (is_real(arg2))
        arg2 = "#";
    
    var text_output = "";
    
    while (string_length(text_current) >= pos_current)
    {
        if (string_width(string_copy(text_current, 1, pos_current)) > arg1)
        {
            if (pos_space != -1)
            {
                text_output += (string_copy(text_current, 1, pos_space) + string(arg2));
                text_current = string_copy(text_current, pos_space + 1, string_length(text_current) - pos_space);
                pos_current = 1;
                pos_space = -1;
            }
            else if (arg3)
            {
                text_output += (string_copy(text_current, 1, pos_current - 1) + string(arg2));
                text_current = string_copy(text_current, pos_current, string_length(text_current) - (pos_current - 1));
                pos_current = 1;
                pos_space = -1;
            }
        }
        
        pos_current += 1;
        
        if (string_char_at(text_current, pos_current) == " ")
            pos_space = pos_current;
    }
    
    if (string_length(text_current) > 0)
        text_output += text_current;
    
    return text_output;
}
