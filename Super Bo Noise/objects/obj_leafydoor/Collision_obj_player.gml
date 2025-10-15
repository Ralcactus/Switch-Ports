if (other.state == (86 << 0) && seenTaunt == false)
{
    tauntCount++
    seenTaunt = true
    if (tauntCount >= 3)
    {
        scr_soundeffect(sfx_door)
        with (other)
        {
            lastroom = room
            targetDoor = "A"
            targetRoom = other.targetRoom
            image_index = 0
        }
        instance_create(x, y, obj_fadeout)
    }
}
else if (other.state != (86 << 0))
    seenTaunt = false
