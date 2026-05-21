/// @description Update state.
currentState = nextState;

if (currentState == GateState.RAISED)
    sprite_index = spr_gateRaised;
else if (currentState == GateState.LOWERED)
    sprite_index = spr_gateLowered;
