function col_to_obj(arg0)
{
    switch (arg0)
    {
        case 0:
        case 1:
        case 2:
            return obj_bom;
            break;
        
        case 3:
            return obj_barrel;
            break;
    }
}
