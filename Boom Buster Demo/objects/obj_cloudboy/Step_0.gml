event_inherited();

if (exit_freeze())
    exit;

anim_logic();
face_ind += (sprite_get_speed(face_sprite) / 60);

if (face_ind >= sprite_get_number(face_sprite))
{
    face_ind -= face_ind;
    event_face_animend();
}
