for (var i = 0; i < array_length(pokerButtons); i++)
    pokerButtons[i].enabled = true;

var player_has_made_bet = false;

for (var i = 0; i < 5; i++)
{
    if (players[i].state == UnknownEnum.Value_3 || players[i].state == UnknownEnum.Value_4 || players[i].state == UnknownEnum.Value_5)
    {
        player_has_made_bet = true;
        break;
    }
}

if (tableState == UnknownEnum.Value_0 || player_has_made_bet)
    pokerButtonRaise.buttonText = "Raise";
else
    pokerButtonRaise.buttonText = "Bet";
