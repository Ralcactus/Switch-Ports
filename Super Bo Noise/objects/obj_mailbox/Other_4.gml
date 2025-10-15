mail_trigger((0 << 0))
mail_trigger((666 << 0))
var num_unread = 0
for (var i = 0; i < array_length(global.mailArr); i++)
{
    var letter = global.mailArr[i]
    if letter.unlocked
    {
        array_push(obtainedMail, letter)
        if ((!letter.read) && i != 0)
        {
            num_unread++
            newmessage = true
        }
    }
}
if newmessage
{
    scr_soundeffect(mailsnd)
}
