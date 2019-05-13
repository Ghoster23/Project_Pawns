event_inherited();

element_type = 2;

piece_type = 0; //0 - ??? | 1 - Pawn | 2 - Solid

#region Register
prv_x = x div global.cell_size;
prv_y = y div global.cell_size;

global.dg_objs[# prv_x, prv_y] = id;

tile = global.dg_tile[# prv_x, prv_y];

with(tile){
	free = false;
}

moved = false;
#endregion