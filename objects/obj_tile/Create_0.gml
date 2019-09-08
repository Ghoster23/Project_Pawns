event_inherited();

element_type = 1;

type = tile_type.none;

#region Measurements
cl_x = x div global.cell_size;
cl_y = y div global.cell_size;

cl_sz = global.cell_size;
#endregion

#region Tyle System
init_state = 0;

adj = [noone,noone,noone,noone,noone,noone,noone,noone];

free    = true;  //Pawn  is not on it
blocked = false; //Solid is not on it

srch_vis = false;
srch_rng = 0;

fld = [-1, -1]; //Fluid on the tile [fluid type, timer]
#endregion

max_hp = 3;
hp     = 3;