global.gamePauseState = 0;
pausecount = -1;
scr_unpause_instances(true);
fmod_event_stop(pauseMusic, false);
fmod_event_setPause(pauseMusic, true);
