var current_hand = handsCompleted;
var current_table_state = tableState;
scr_poker_checkIfHandProgresses();

if (current_hand == handsCompleted)
{
    currentTurn = (currentTurn + 1) % 5;
    
    while (players[currentTurn].state == UnknownEnum.Value_9 || players[currentTurn].state == UnknownEnum.Value_6)
        currentTurn = (currentTurn + 1) % 5;
    
    if (tableState == current_table_state)
        alarm[1] = 20;
}
else
{
    scr_poker_startHand();
}
