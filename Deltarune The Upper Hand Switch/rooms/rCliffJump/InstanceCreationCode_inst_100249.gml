wall = false;
res_i();

draw = function()
{
};

step = function()
{
    if (place_meeting(x, y, oPlayer) && i1 == 0)
        i1 = 1;
    
    if (i1 == 1)
        i++;
    
    if (i == 20)
    {
        move_char("sock", 10, 360, 440, sSock_Jockey, 0, -2, ["arc1"]);
        sprite_char("sock", sSock_Jockey, 1, 0, undefined, undefined, -2);
        snd(snd_jump);
    }
    
    if (i == 30)
        sprite_char("sock", sSock_Jockey, 0, 0, -3, undefined, -2);
    
    if (i == 31)
        sprite_char("sock", sSock_Jockey, 0, 0, 6, undefined, -2);
    
    if (i == 32)
        sprite_char("sock", sSock_Jockey, 0, 0, -6, undefined, -2);
    
    if (i == 33)
        sprite_char("sock", sSock_Jockey, 0, 0, 3, undefined, -2);
    
    if (i == 50)
    {
        move_char("sock", 15, 360, -100, sSock_Jockey, 0, -2);
        sprite_char("sock", sSock_Jockey, 1, 0, undefined, undefined, -2);
        snd(snd_jump);
    }
};
