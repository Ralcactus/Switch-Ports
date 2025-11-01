function json_load(arg0, arg1 = true)
{
    if (arg1)
    {
        var _file = file_text_open_read(arg0);
        
        if (!file_exists(arg0))
        {
            show_message(string("File not found: {0}\nDon't be tampering with files now!", arg0));
            game_end();
            exit;
        }
        
        var _json_content = "";
        
        while (!file_text_eof(_file))
        {
            _json_content += file_text_read_string(_file);
            file_text_readln(_file);
        }
        
        file_text_close(_file);
        return json_parse(_json_content);
    }
    else
    {
        var _json_content = arg0;
        return json_parse(_json_content);
    }
}
