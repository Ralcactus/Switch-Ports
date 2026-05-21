if (!instance_exists(baddieID) || !instance_exists(other.baddieID))
    exit;

with (other.id)
{
    if ((instance_exists(baddieID) && !other.baddieID.invincible && instance_exists(other.baddieID) && baddieID != other.id) && baddieID.state != baddiestate.grabbed)
    {
        if (baddieID.state == baddiestate.stun && baddieID.thrown == 1)
            instance_destroy(other.baddieID);
    }
}
