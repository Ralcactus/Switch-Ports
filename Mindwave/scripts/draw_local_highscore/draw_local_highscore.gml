function draw_local_highscores(arg0, arg1, arg2, arg3, arg4 = {})
{
    var _scores_array = struct_get(master.endless_scores, arg2);
    
    if (!is_undefined(_scores_array))
        _scores_array = struct_get(_scores_array, arg3);
    
    if (is_undefined(_scores_array))
        _scores_array = [0, 0, 0];
    
    draw_quick_score_list(arg0, arg1, _scores_array, arg4);
}
