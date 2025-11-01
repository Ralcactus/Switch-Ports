for (var i = 0; i < 5; i++)
{
    if (choice[i].text != "na" && choice[i].text != "NA")
        nodes++;
    
    xscale[i] = 0;
    yscale[i] = 0;
    alpha[i] = 1;
    in[i] = false;
}

timer_func[0]();
var _sep = 22;
var _h = sprite_get_height(spr_option);
height = _h / 2;
ready = true;
