if (exit_freeze())
    exit;

path_follow();

repeat (abs(hspd))
    x += sign(hspd);

repeat (abs(vspd))
    y += sign(vspd);
