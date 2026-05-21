/// @desc Checks state if it is a transformation.
function scr_transformationCheck(state)
{
    var _transfo = undefined;
    
    switch (state)
    {
        case states.cotton:
        case states.cottondrill:
        case states.cottonroll:
            _transfo = "Cottoncoated";
            break;
        
        case states.rupertnormal:
        case states.rupertjump:
        case states.rupertslide:
        case states.rupertstick:
            _transfo = "Rupert";
            break;
        
        case states.ufofloat:
            _transfo = "UFO";
            break;
        
        case states.seacream:
        case states.seacreamjump:
        case states.seacreamstick:
            _transfo = "SeaCream";
            break;
    }
    
    return _transfo;
}
