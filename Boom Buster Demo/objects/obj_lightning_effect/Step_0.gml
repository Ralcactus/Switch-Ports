if (exit_freeze())
    exit;

alpha -= 0.06;

if (alpha <= 0)
    instance_destroy();
