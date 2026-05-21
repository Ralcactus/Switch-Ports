if (playerID.state != states.mach3 && playerID.state != states.Nhookshot && playerID.state != states.charge && playerID.state != states.mach2 && playerID.state != states.handstandjump && playerID.state != states.machslide && playerID.state != states.slam && playerID.state != states.chainsaw && playerID.state != states.machfreefall && playerID.state != states.superslam && playerID.state != states.minecart && playerID.state != states.machroll && playerID.state != states.chainsaw && playerID.state != states.Sjump && playerID.state != states.parry && playerID.state != states.tumble && playerID.state != states.flushed && (playerID.state != states.jump && playerID.state != states.uppercut && playerID.state != states.machtumble && global.cane == 0 && playerID.state != states.pizzanosidejump && playerID.state != states.pizzanoshoulderbash && playerID.state != states.mach1))
    vanish = 1;

if (vanish == 1)
{
    if (gonealpha > 0)
        gonealpha -= 0.15;
    else if (gonealpha <= 0)
        instance_destroy();
}

visible = playerID.visible;

if (obj_player.state != states.frozen)
    image_alpha = obj_player.movespeed / 16;
else
    image_alpha = obj_player.frozenmovespeed / 16;

with (realcol)
{
    switch (other.color)
    {
        case #010000:
            r = 48;
            g = 168;
            b = 248;
            r2 = 15;
            g2 = 57;
            b2 = 121;
            break;
        
        case #020000:
            r = 232;
            g = 80;
            b = 152;
            r2 = 95;
            g2 = 9;
            b2 = 32;
            break;
    }
}
