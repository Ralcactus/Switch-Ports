if (other.state == baddiestate.stun && other.thrown == 1)
{
    DestroyedBy = other.id;
    event_user(0);
}
