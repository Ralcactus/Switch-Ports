Text = "Demo Build 4";
draw_text_color(19, 20, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(21, 20, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(20, 19, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(20, 21, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(18, 20, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(22, 20, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(20, 18, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(20, 22, Text, c_black, c_black, c_black, c_black, 1);
draw_text_color(20, 20, Text, c_red, c_red, c_red, c_red, 1);

if (room == rMainu)
{
    draw_text(20, 430, "Press [escape] at any time to return to the main menu");
    draw_text(20, 450, "Go to [EXTRAS] and press skip intro to play the fight");
}
