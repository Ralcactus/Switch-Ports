depth = -15;
levelArray[0] = [];
levelArray[1] = [];
levelArray[2] = [];
levelArray[3] = [];
levelArray[4] = [];
waitBuffer = false;
alarm[0] = 30;
obj_parent_player.state = UnknownEnum.Value_2;

addLevel = function(arg0 = 0, arg1, arg2, arg3)
{
    array_push(levelArray[arg0], [arg1, arg2, arg3]);
};

gotoLevel = function(arg0, arg1)
{
    scr_levelstart(arg0, arg1);
    ini_open("saveData.ini");
    var ranks = ini_read_string("Ranks", string(global.levelname), "none");
    ini_close_os();
    global.showplaytimer = ranks != "none";
    
    with (obj_parent_player)
    {
        obj_camera.chargeCameraX = 0;
        image_index = 0;
        sprite_index = spr_entergate;
        state = UnknownEnum.Value_56;
        targetDoor = "A";
        targetRoom = arg1;
    }
    
    if (!instance_exists(obj_fadeoutTransition))
    {
        instance_create(x, y, obj_fadeoutTransition, 
        {
            levelStart: true
        });
    }
};

addLevel(0, "entryway", "Crunchy Construction", entryway_1);
addLevel(0, "steamy", "Cottontown", steamy_1);
addLevel(0, "mineshaft", "Sugarshack Mines", mineshaft_1);
addLevel(0, "gumbob", "Boss 1", rm_missing);
addLevel(1, "fudge", "Mt. Fudgetop", mountain_intro);
addLevel(1, "molasses", "Molasses Swamp", molasses_1);
addLevel(1, "cafe", "Chocoa Cafe", cafe_1);
addLevel(1, "sheriff", "Boss 2", rm_missing);
addLevel(2, "dance", "Dance Off", dance_1);
addLevel(2, "bee", "Sting Operation", bee_1);
addLevel(2, "casino", "Coneboy Casino", casino_1);
addLevel(2, "pizzano", "Boss 3", boss_pizzano);
addLevel(3, "souractive", "Souractive", souractive_1);
addLevel(3, "licorice", "Licorice Castle", licorice_1);
addLevel(3, "sucrose", "Sucrose Snowstorm", sucrose_start);
addLevel(3, "coneball", "Boss 4", rm_missing);
addLevel(4, "testroom", "testroom", testroom);
addLevel(4, "dragonlair", "Dragonlair", dragonlair_1);
addLevel(4, "waferdim", "Exitway", exitway_1);
addLevel(4, "hub", "hub", hub_w1);
selectedWorld = 0;
selectedLevel = 0;
confectiSprites[0] = 
{
    sprite: spr_marshmellow_taunt,
    image: choose(0, 1)
};
confectiSprites[1] = 
{
    sprite: spr_chocolate_taunt,
    image: choose(0, 1)
};
confectiSprites[2] = 
{
    sprite: spr_crack_taunt,
    image: choose(0, 1)
};
confectiSprites[3] = 
{
    sprite: spr_gummyworm_taunt,
    image: choose(0, 1)
};
confectiSprites[4] = 
{
    sprite: spr_candy_taunt,
    image: choose(0, 1)
};
