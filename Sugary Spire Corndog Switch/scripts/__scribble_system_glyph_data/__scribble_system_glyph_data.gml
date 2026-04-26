function __scribble_system_glyph_data()
{
    global.__scribble_glyph_data = 
    {
        __bidi_map: ds_map_create(),
        __mirror_map: ds_map_create(),
        __arabic_isolated_map: ds_map_create(),
        __arabic_initial_map: ds_map_create(),
        __arabic_medial_map: ds_map_create(),
        __arabic_final_map: ds_map_create(),
        __arabic_join_prev_map: ds_map_create(),
        __arabic_join_next_map: ds_map_create(),
        __thai_base_map: ds_map_create(),
        __thai_base_descender_map: ds_map_create(),
        __thai_base_ascender_map: ds_map_create(),
        __thai_top_map: ds_map_create(),
        __thai_lower_map: ds_map_create(),
        __thai_upper_map: ds_map_create()
    };
    var _map = global.__scribble_glyph_data.__bidi_map;
    ds_map_set(_map, -1, UnknownEnum.Value_1);
    ds_map_set(_map, -2, UnknownEnum.Value_1);
    
    for (_i = 0; _i <= 9; _i++)
        ds_map_set(_map, _i, UnknownEnum.Value_1);
    
    ds_map_set(_map, 10, UnknownEnum.Value_2);
    ds_map_set(_map, 11, UnknownEnum.Value_1);
    ds_map_set(_map, 12, UnknownEnum.Value_1);
    ds_map_set(_map, 13, UnknownEnum.Value_1);
    ds_map_set(_map, 32, UnknownEnum.Value_0);
    ds_map_set(_map, 33, UnknownEnum.Value_1);
    ds_map_set(_map, 34, UnknownEnum.Value_1);
    ds_map_set(_map, 38, UnknownEnum.Value_1);
    ds_map_set(_map, 39, UnknownEnum.Value_1);
    ds_map_set(_map, 40, UnknownEnum.Value_1);
    ds_map_set(_map, 41, UnknownEnum.Value_1);
    ds_map_set(_map, 42, UnknownEnum.Value_1);
    ds_map_set(_map, 59, UnknownEnum.Value_1);
    ds_map_set(_map, 60, UnknownEnum.Value_1);
    ds_map_set(_map, 61, UnknownEnum.Value_1);
    ds_map_set(_map, 62, UnknownEnum.Value_1);
    ds_map_set(_map, 63, UnknownEnum.Value_1);
    ds_map_set(_map, 64, UnknownEnum.Value_1);
    ds_map_set(_map, 91, UnknownEnum.Value_1);
    ds_map_set(_map, 92, UnknownEnum.Value_1);
    ds_map_set(_map, 93, UnknownEnum.Value_1);
    ds_map_set(_map, 94, UnknownEnum.Value_1);
    ds_map_set(_map, 95, UnknownEnum.Value_1);
    ds_map_set(_map, 96, UnknownEnum.Value_1);
    ds_map_set(_map, 123, UnknownEnum.Value_1);
    ds_map_set(_map, 124, UnknownEnum.Value_1);
    ds_map_set(_map, 125, UnknownEnum.Value_1);
    ds_map_set(_map, 126, UnknownEnum.Value_1);
    ds_map_set(_map, 44, UnknownEnum.Value_1);
    ds_map_set(_map, 46, UnknownEnum.Value_1);
    ds_map_set(_map, 47, UnknownEnum.Value_1);
    ds_map_set(_map, 58, UnknownEnum.Value_1);
    ds_map_set(_map, 45, UnknownEnum.Value_1);
    ds_map_set(_map, 8294, UnknownEnum.Value_0);
    ds_map_set(_map, 8295, UnknownEnum.Value_0);
    ds_map_set(_map, 8296, UnknownEnum.Value_0);
    ds_map_set(_map, 8297, UnknownEnum.Value_0);
    ds_map_set(_map, 8234, UnknownEnum.Value_0);
    ds_map_set(_map, 8235, UnknownEnum.Value_0);
    ds_map_set(_map, 8236, UnknownEnum.Value_0);
    ds_map_set(_map, 8237, UnknownEnum.Value_0);
    ds_map_set(_map, 8238, UnknownEnum.Value_0);
    ds_map_set(_map, 160, UnknownEnum.Value_1);
    ds_map_set(_map, 1548, UnknownEnum.Value_1);
    ds_map_set(_map, 1643, UnknownEnum.Value_6);
    ds_map_set(_map, 1644, UnknownEnum.Value_6);
    
    for (_i = 1424; _i <= 1535; _i++)
        ds_map_set(_map, _i, UnknownEnum.Value_6);
    
    for (_i = 1536; _i <= 1791; _i++)
        ds_map_set(_map, _i, UnknownEnum.Value_7);
    
    for (_i = 2304; _i <= 2431; _i++)
        ds_map_set(_map, _i, UnknownEnum.Value_5);
    
    for (_i = 64336; _i <= 65023; _i++)
        ds_map_set(_map, _i, UnknownEnum.Value_7);
    
    for (_i = 65136; _i <= 65279; _i++)
        ds_map_set(_map, _i, UnknownEnum.Value_7);
    
    _map = global.__scribble_glyph_data.__mirror_map;
    ds_map_set(_map, 40, 41);
    ds_map_set(_map, 41, 40);
    ds_map_set(_map, 60, 62);
    ds_map_set(_map, 62, 60);
    ds_map_set(_map, 91, 93);
    ds_map_set(_map, 93, 91);
    ds_map_set(_map, 123, 125);
    ds_map_set(_map, 125, 123);
    var _map_i = global.__scribble_glyph_data.__arabic_isolated_map;
    var _map_a = global.__scribble_glyph_data.__arabic_initial_map;
    var _map_b = global.__scribble_glyph_data.__arabic_medial_map;
    var _map_c = global.__scribble_glyph_data.__arabic_final_map;
    ds_map_set(_map_i, 1569, 65152);
    ds_map_set(_map_c, 1569, 65152);
    ds_map_set(_map_b, 1569, 65152);
    ds_map_set(_map_a, 1569, 65152);
    ds_map_set(_map_i, 1570, 65153);
    ds_map_set(_map_c, 1570, 65154);
    ds_map_set(_map_b, 1570, 65154);
    ds_map_set(_map_a, 1570, 65153);
    ds_map_set(_map_i, 1571, 65155);
    ds_map_set(_map_c, 1571, 65156);
    ds_map_set(_map_b, 1571, 65156);
    ds_map_set(_map_a, 1571, 65155);
    ds_map_set(_map_i, 1572, 65157);
    ds_map_set(_map_c, 1572, 65158);
    ds_map_set(_map_b, 1572, 65158);
    ds_map_set(_map_a, 1572, 65157);
    ds_map_set(_map_i, 1573, 65159);
    ds_map_set(_map_c, 1573, 65160);
    ds_map_set(_map_b, 1573, 65160);
    ds_map_set(_map_a, 1573, 65159);
    ds_map_set(_map_i, 1574, 65161);
    ds_map_set(_map_c, 1574, 65162);
    ds_map_set(_map_b, 1574, 65164);
    ds_map_set(_map_a, 1574, 65163);
    ds_map_set(_map_i, 1575, 65165);
    ds_map_set(_map_c, 1575, 65166);
    ds_map_set(_map_b, 1575, 65166);
    ds_map_set(_map_a, 1575, 65165);
    ds_map_set(_map_i, 1576, 65167);
    ds_map_set(_map_c, 1576, 65168);
    ds_map_set(_map_b, 1576, 65170);
    ds_map_set(_map_a, 1576, 65169);
    ds_map_set(_map_i, 1577, 65171);
    ds_map_set(_map_c, 1577, 65172);
    ds_map_set(_map_b, 1577, 65172);
    ds_map_set(_map_a, 1577, 65171);
    ds_map_set(_map_i, 1578, 65173);
    ds_map_set(_map_c, 1578, 65174);
    ds_map_set(_map_b, 1578, 65176);
    ds_map_set(_map_a, 1578, 65175);
    ds_map_set(_map_i, 1579, 65177);
    ds_map_set(_map_c, 1579, 65178);
    ds_map_set(_map_b, 1579, 65180);
    ds_map_set(_map_a, 1579, 65179);
    ds_map_set(_map_i, 1580, 65181);
    ds_map_set(_map_c, 1580, 65182);
    ds_map_set(_map_b, 1580, 65184);
    ds_map_set(_map_a, 1580, 65183);
    ds_map_set(_map_i, 1581, 65185);
    ds_map_set(_map_c, 1581, 65186);
    ds_map_set(_map_b, 1581, 65188);
    ds_map_set(_map_a, 1581, 65187);
    ds_map_set(_map_i, 1582, 65189);
    ds_map_set(_map_c, 1582, 65190);
    ds_map_set(_map_b, 1582, 65192);
    ds_map_set(_map_a, 1582, 65191);
    ds_map_set(_map_i, 1583, 65193);
    ds_map_set(_map_c, 1583, 65194);
    ds_map_set(_map_b, 1583, 65194);
    ds_map_set(_map_a, 1583, 65193);
    ds_map_set(_map_i, 1584, 65195);
    ds_map_set(_map_c, 1584, 65196);
    ds_map_set(_map_b, 1584, 65196);
    ds_map_set(_map_a, 1584, 65195);
    ds_map_set(_map_i, 1585, 65197);
    ds_map_set(_map_c, 1585, 65198);
    ds_map_set(_map_b, 1585, 65198);
    ds_map_set(_map_a, 1585, 65197);
    ds_map_set(_map_i, 1586, 65199);
    ds_map_set(_map_c, 1586, 65200);
    ds_map_set(_map_b, 1586, 65200);
    ds_map_set(_map_a, 1586, 65199);
    ds_map_set(_map_i, 1587, 65201);
    ds_map_set(_map_c, 1587, 65202);
    ds_map_set(_map_b, 1587, 65204);
    ds_map_set(_map_a, 1587, 65203);
    ds_map_set(_map_i, 1588, 65205);
    ds_map_set(_map_c, 1588, 65206);
    ds_map_set(_map_b, 1588, 65208);
    ds_map_set(_map_a, 1588, 65207);
    ds_map_set(_map_i, 1589, 65209);
    ds_map_set(_map_c, 1589, 65210);
    ds_map_set(_map_b, 1589, 65212);
    ds_map_set(_map_a, 1589, 65211);
    ds_map_set(_map_i, 1590, 65213);
    ds_map_set(_map_c, 1590, 65214);
    ds_map_set(_map_b, 1590, 65216);
    ds_map_set(_map_a, 1590, 65215);
    ds_map_set(_map_i, 1591, 65217);
    ds_map_set(_map_c, 1591, 65218);
    ds_map_set(_map_b, 1591, 65220);
    ds_map_set(_map_a, 1591, 65219);
    ds_map_set(_map_i, 1592, 65221);
    ds_map_set(_map_c, 1592, 65222);
    ds_map_set(_map_b, 1592, 65224);
    ds_map_set(_map_a, 1592, 65223);
    ds_map_set(_map_i, 1593, 65225);
    ds_map_set(_map_c, 1593, 65226);
    ds_map_set(_map_b, 1593, 65228);
    ds_map_set(_map_a, 1593, 65227);
    ds_map_set(_map_i, 1594, 65229);
    ds_map_set(_map_c, 1594, 65230);
    ds_map_set(_map_b, 1594, 65232);
    ds_map_set(_map_a, 1594, 65231);
    ds_map_set(_map_i, 1600, 1600);
    ds_map_set(_map_c, 1600, 1600);
    ds_map_set(_map_b, 1600, 1600);
    ds_map_set(_map_a, 1600, 1600);
    ds_map_set(_map_i, 1601, 65233);
    ds_map_set(_map_c, 1601, 65234);
    ds_map_set(_map_b, 1601, 65236);
    ds_map_set(_map_a, 1601, 65235);
    ds_map_set(_map_i, 1602, 65237);
    ds_map_set(_map_c, 1602, 65238);
    ds_map_set(_map_b, 1602, 65240);
    ds_map_set(_map_a, 1602, 65239);
    ds_map_set(_map_i, 1603, 65241);
    ds_map_set(_map_c, 1603, 65242);
    ds_map_set(_map_b, 1603, 65244);
    ds_map_set(_map_a, 1603, 65243);
    ds_map_set(_map_i, 1604, 65245);
    ds_map_set(_map_c, 1604, 65246);
    ds_map_set(_map_b, 1604, 65248);
    ds_map_set(_map_a, 1604, 65247);
    ds_map_set(_map_i, 1605, 65249);
    ds_map_set(_map_c, 1605, 65250);
    ds_map_set(_map_b, 1605, 65252);
    ds_map_set(_map_a, 1605, 65251);
    ds_map_set(_map_i, 1606, 65253);
    ds_map_set(_map_c, 1606, 65254);
    ds_map_set(_map_b, 1606, 65256);
    ds_map_set(_map_a, 1606, 65255);
    ds_map_set(_map_i, 1607, 65257);
    ds_map_set(_map_c, 1607, 65258);
    ds_map_set(_map_b, 1607, 65260);
    ds_map_set(_map_a, 1607, 65259);
    ds_map_set(_map_i, 1608, 65261);
    ds_map_set(_map_c, 1608, 65262);
    ds_map_set(_map_b, 1608, 65262);
    ds_map_set(_map_a, 1608, 65261);
    ds_map_set(_map_i, 1609, 65263);
    ds_map_set(_map_c, 1609, 65264);
    ds_map_set(_map_b, 1609, 65264);
    ds_map_set(_map_a, 1609, 65263);
    ds_map_set(_map_i, 1610, 65265);
    ds_map_set(_map_c, 1610, 65266);
    ds_map_set(_map_b, 1610, 65268);
    ds_map_set(_map_a, 1610, 65267);
    ds_map_set(_map_i, 65269, 65269);
    ds_map_set(_map_c, 65269, 65270);
    ds_map_set(_map_b, 65269, 65270);
    ds_map_set(_map_a, 65269, 65269);
    ds_map_set(_map_i, 65270, 65269);
    ds_map_set(_map_c, 65270, 65270);
    ds_map_set(_map_b, 65270, 65270);
    ds_map_set(_map_a, 65270, 65269);
    ds_map_set(_map_i, 65271, 65271);
    ds_map_set(_map_c, 65271, 65272);
    ds_map_set(_map_b, 65271, 65272);
    ds_map_set(_map_a, 65271, 65271);
    ds_map_set(_map_i, 65271, 65271);
    ds_map_set(_map_c, 65271, 65272);
    ds_map_set(_map_b, 65271, 65272);
    ds_map_set(_map_a, 65271, 65271);
    ds_map_set(_map_i, 65273, 65273);
    ds_map_set(_map_c, 65273, 65274);
    ds_map_set(_map_b, 65273, 65274);
    ds_map_set(_map_a, 65273, 65273);
    ds_map_set(_map_i, 65274, 65273);
    ds_map_set(_map_c, 65274, 65274);
    ds_map_set(_map_b, 65274, 65274);
    ds_map_set(_map_a, 65274, 65273);
    ds_map_set(_map_i, 65275, 65275);
    ds_map_set(_map_c, 65275, 65276);
    ds_map_set(_map_b, 65275, 65276);
    ds_map_set(_map_a, 65275, 65275);
    ds_map_set(_map_i, 65276, 65275);
    ds_map_set(_map_c, 65276, 65276);
    ds_map_set(_map_b, 65276, 65276);
    ds_map_set(_map_a, 65276, 65275);
    var _map_prev = global.__scribble_glyph_data.__arabic_join_prev_map;
    var _map_next = global.__scribble_glyph_data.__arabic_join_next_map;
    _map_i = global.__scribble_glyph_data.__arabic_isolated_map;
    _map_a = global.__scribble_glyph_data.__arabic_initial_map;
    _map_b = global.__scribble_glyph_data.__arabic_medial_map;
    _map_c = global.__scribble_glyph_data.__arabic_final_map;
    var _arabic_array = ds_map_keys_to_array(_map_i);
    var _i = 0;
    
    repeat (array_length(_arabic_array))
    {
        var _glyph = _arabic_array[_i];
        ds_map_set(_map_prev, _glyph, ds_map_find_value(_map_a, _glyph) != ds_map_find_value(_map_b, _glyph));
        ds_map_set(_map_next, _glyph, ds_map_find_value(_map_a, _glyph) != ds_map_find_value(_map_i, _glyph));
        _i++;
    }
    
    ds_map_set(_map_prev, 1600, true);
    ds_map_set(_map_next, 1600, true);
    _map = global.__scribble_glyph_data.__thai_base_map;
    
    for (_i = 3585; _i <= 3631; _i++)
        ds_map_set(_map, _i, true);
    
    ds_map_set(_map, 3632, true);
    ds_map_set(_map, 3648, true);
    ds_map_set(_map, 3649, true);
    _map = global.__scribble_glyph_data.__thai_base_descender_map;
    ds_map_set(_map, 3598, true);
    ds_map_set(_map, 3599, true);
    _map = global.__scribble_glyph_data.__thai_base_ascender_map;
    ds_map_set(_map, 3611, true);
    ds_map_set(_map, 3613, true);
    ds_map_set(_map, 3615, true);
    ds_map_set(_map, 3628, true);
    _map = global.__scribble_glyph_data.__thai_top_map;
    ds_map_set(_map, 3656, true);
    ds_map_set(_map, 3657, true);
    ds_map_set(_map, 3658, true);
    ds_map_set(_map, 3659, true);
    ds_map_set(_map, 3660, true);
    _map = global.__scribble_glyph_data.__thai_lower_map;
    ds_map_set(_map, 3640, true);
    ds_map_set(_map, 3641, true);
    ds_map_set(_map, 3642, true);
    _map = global.__scribble_glyph_data.__thai_upper_map;
    ds_map_set(_map, 3633, true);
    ds_map_set(_map, 3636, true);
    ds_map_set(_map, 3637, true);
    ds_map_set(_map, 3638, true);
    ds_map_set(_map, 3639, true);
    ds_map_set(_map, 3655, true);
    ds_map_set(_map, 3661, true);
}
