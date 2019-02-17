// Inherit the parent event
event_inherited();

#region Register
prv_x = x div global.cell_size;
prv_y = y div global.cell_size;

global.dg_objs[# prv_x, prv_y] = id;

with(global.dg_tile[# prv_x, prv_y]){
	free = false;
}

moved = false;
#endregion