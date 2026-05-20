if (delay == 0)
{
    if (offset > 0)
        offset -= 10;
}

if (delay > 0)
    delay--;

image_alpha = (-offset / 100) + 1;
ext(sFaces, image_index, x + (offset / 2), y, 1, 1, undefined, undefined, image_alpha);
res_i();

repeat (array_length(text))
{
    print(text[i], x + (offset / 2) + 65, ((y + 30) - (array_length(text) * 5)) + (i * 10), font, undefined, ["alph", "xys_1"]);
    i++;
}
