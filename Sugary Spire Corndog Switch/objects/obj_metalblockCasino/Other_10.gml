if (global.PokerChips < price)
    exit;

global.PokerChips -= price;
event_inherited();
