var entryAmt = array_length(entry);
var tileArea = rows * columns;
var totalPages = floor(entryAmt / tileArea) + ((entryAmt % tileArea) != 0);

if (pgnum < totalPages)
{
    pgnum++;
    selected = (pgnum - 1) * rows * columns;
}

scrolldelay = 210;
texty = 0;
