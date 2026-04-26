visible = levelrank != "none";
var ranks = ["e", "s", "a", "b", "c", "d"];

for (var i = 0; i < array_length(ranks); i++)
{
    if (levelrank == ranks[i])
        image_index = i;
}
