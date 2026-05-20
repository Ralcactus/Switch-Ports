res_i();
i = 20;
ey = 10;

draw = function()
{
    ext(sProps, 12, x + i, y + ey);
    
    if (array_contains(op.save, "eggMedia"))
    {
        depth = -9999;
        ext(sTopTen, 0, oPlayer.x, oPlayer.y, 1, 1);
    }
};

func = function()
{
    if (array_contains(op.save, "egg"))
    {
        do_text(undefined, undefined, ["* ¤dont touch that, €€€€€€eggot¤", "* ¤that'ss my offensive word¤"], ["ow"], undefined, undefined, undefined, undefined, undefined, [3, 3], undefined, function()
        {
            oPlayer.move = true;
            array_push(op.save, "eggMedia");
            audio_stop_all();
            snd(mus_deltarune_critic);
        });
    }
    else if (!array_contains(op.save, "eggTalk1"))
    {
        do_text(undefined, undefined, ["* (You entered the egg room. There is a man here.)", "* (You are interacting with him now)", "* ¤what's up bozo. €€€€€€im the egg guy. €€€€€€welcome to my realm¤", "* ¤well, €€€€€€we call this room the tree land. €€€€€€but it's unimportreetant.¤", "* ¤hey, €€€€€€i have a magic trick. €€€€€€check that pocket of yours¤", "* (A pocket has mysteriously appeared in your pocket. €€€€€€You reach into it)", "* (It is a piece of paper and it reads ¤15621311¤)", "* ¤no what the hell it's supposed to be an egg¤", "* ¤cause im the egg guy.¤", "* ¤hey, €€€€€€you can call me bling wing.€€€€€€ how about that¤", "* ¤go to hell i hate you €€€€€€€€€die¤", "* (he stops talking)", "*  (Do you remember what it said? €€€€€€€€€Well, €€€€€€I won't tell it to you.)"], ["ow"], undefined, undefined, undefined, undefined, undefined, [-1, -1, 3, 3, 3, -1, -1, 3, 3, 3, 3, -1, -1], undefined, function()
        {
            oPlayer.move = true;
            array_push(op.save, "eggTalk1");
        });
    }
    else if (!array_contains(op.save, "eggTalk2"))
    {
        do_text(undefined, undefined, ["* ¤my goal is to reach my final destination:¤", "* ¤raspberry heaven¤", "* ¤the heaven of dreams¤", "* ¤because there, €€€€€€you get to fly...¤", "* ¤i wish i were a bird...¤", "* ¤kris... €€€€€€if you become a bird, please tell me¤"], ["ow"], undefined, undefined, undefined, undefined, undefined, [3, 3, 3, 3, 3, 3], undefined, function()
        {
            oPlayer.move = true;
            array_push(op.save, "eggTalk2");
        });
    }
    else
    {
        do_text(undefined, undefined, ["* ¤go awaaaayyy¤"], ["ow"], undefined, undefined, undefined, undefined, undefined, [3], undefined, function()
        {
            oPlayer.move = true;
        });
    }
};
