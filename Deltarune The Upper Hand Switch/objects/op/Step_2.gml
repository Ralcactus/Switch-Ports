ty++;
ti += pi;

if (camFix[0])
{
    storeCam = [oPlayer.x - 320, oPlayer.y - 240 - 38];
    
    if (storeCam[0] < parameter[0])
        storeCam[0] = parameter[0];
    
    if (storeCam[0] > parameter[1])
        storeCam[0] = parameter[1];
    
    if (storeCam[1] < parameter[2])
        storeCam[1] = parameter[2];
    
    if (storeCam[1] > parameter[3])
        storeCam[1] = parameter[3];
    
    camX += ((storeCam[0] - camFix[3]) / camFix[2]);
    camY += ((storeCam[1] - camFix[4]) / camFix[2]);
    cameX += ((0 - camFix[5]) / camFix[2]);
    cameY += ((0 - camFix[6]) / camFix[2]);
    camFix[1]--;
    
    if (camFix[1] <= 0)
    {
        camFix[0] = false;
        camX = 0;
        camY = 0;
        cameX = 0;
        cameY = 0;
    }
}

if (shakeTime > 0)
{
    shakeTime--;
    camShakeXY[0] = irandom_range(-shakePower, shakePower);
    camShakeXY[1] = irandom_range(-shakePower, shakePower);
    shakePower -= (SPstore / STstore);
}
else
{
    camShakeXY[0] = 0;
    camShakeXY[1] = 0;
}

if (camMode == "player")
{
    camX = oPlayer.x - 320;
    camY = oPlayer.y - 240 - 38;
    
    if (camX < parameter[0])
        camX = parameter[0];
    
    if (camX > parameter[1])
        camX = parameter[1];
    
    if (camY < parameter[2])
        camY = parameter[2];
    
    if (camY > parameter[3])
        camY = parameter[3];
}

if (camMode == "soul")
{
    camX = lerp(camX, oSoul.x - 320, 0.25);
    camY = lerp(camY, oSoul.y - 240, 0.25);
    camX = clamp(camX, 0, 0);
    camY = clamp(camY, -9999, 0);
}

if (camMode == "finalEnd")
{
    if (room == rBattle)
    {
        camY += ((-2626 - camY) / 10);
        oSoul.x = -9999;
        oSoul.y = -9999;
        oSoul.move = true;
        des(oGround);
        camY = clamp(camY, -9999, 0);
    }
}

if (room == rMainMenu)
    pixelScale = 4;
else
    pixelScale = 1;

orgi_x_size = 640 * pixelScale;
orgi_y_size = 480 * pixelScale;
view_enabled = true;
view_visible[0] = true;
view_wport[0] = orgi_x_size;
view_hport[0] = orgi_y_size;
surface_resize(application_surface, view_wport[0], view_hport[0]);
var cam_id = view_camera[0];
camera_set_view_pos(cam_id, camX + cameX + camShakeXY[0], camY + cameY + camShakeXY[1]);
camera_set_view_size(cam_id, 640, 480);
