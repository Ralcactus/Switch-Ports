/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
    global.discord_initialized = true;
    ready = true;
    show_debug_message("date: " + string(date_current_datetime()));
    np_setpresence_timestamps(date_current_datetime(), 0, false);
    np_setpresence_more("", "The Noise!", true);
    np_setpresence(details, "icon", "");
}
