with (obj_parent_player)
{
    visible = false;
    state = UnknownEnum.Value_110;
    hsp = 0;
    vsp = 0;
    x = 0;
    y = 0;
    grav = 0;
}

handsCompleted = 0;

function PokerPlayer(arg0) constructor
{
    name = arg0;
    stack = 10000;
    state = UnknownEnum.Value_0;
    totalStake = 0;
    betSize = 0;
    hand = [];
}

players = [new PokerPlayer("The Player"), new PokerPlayer("Coneball"), new PokerPlayer("Pizzano"), new PokerPlayer("Gumbob"), new PokerPlayer("Pizzelle")];
dealer = UnknownEnum.Value_2;
currentTurn = dealer;
bigBlind = 200;
potSize = 0;
deck = ds_list_create();
tableBet = 0;
tableState = UnknownEnum.Value_0;
communityCards = [];
minRaiseAmount = bigBlind;
pokerButtonCheckCall = instance_create(15, room_height - 45, obj_pokerButton);
pokerButtonRaise = instance_create(165, room_height - 45, obj_pokerButton);
pokerButtonFold = instance_create(315, room_height - 45, obj_pokerButton);
pokerButtonFold.buttonText = "Fold";
pokerButtonBetUp = instance_create(465, room_height - 45, obj_pokerButton);
pokerButtonBetUp.buttonText = "+";
pokerButtonBetDown = instance_create(615, room_height - 45, obj_pokerButton);
pokerButtonBetDown.buttonText = "-";
pokerButtons = [pokerButtonCheckCall, pokerButtonRaise, pokerButtonFold, pokerButtonBetUp, pokerButtonBetDown];

for (var i = 0; i < array_length(pokerButtons); i++)
    pokerButtons[i].enabled = false;

scr_poker_startHand();
canCheck = true;
callAmount = 0;
minRaise = bigBlind;
