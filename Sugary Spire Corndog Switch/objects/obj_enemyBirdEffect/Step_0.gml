if (!instance_exists(baddieID))
{
    instance_destroy();
    exit;
}

updateBirdPosition();

if (!global.freezeframe && (baddieID.baddieStunTimer < 50 || baddieID.state != UnknownEnum.Value_4))
{
    baddieID.birdCreated = false;
    instance_destroy();
}
