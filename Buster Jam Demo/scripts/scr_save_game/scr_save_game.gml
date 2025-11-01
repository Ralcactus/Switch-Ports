function scr_save_game()
{
    global.save_data.coins = global.coins;
    var _str = json_stringify(global.save_data, global.debug);
    var _open = file_text_open_write("campaign.sav");
    file_text_write_string(_open, _str);
    file_text_close(_open);
}
