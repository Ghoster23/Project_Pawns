/// @description Movement Update
var out = scr_search_flood(global.dg_tile[# x div global.cell_size, y div global.cell_size], false, 1, 1);
mov_list = out[0];
mov_path = out[1];