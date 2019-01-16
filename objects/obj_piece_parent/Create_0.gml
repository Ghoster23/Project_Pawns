// Inherit the parent event
event_inherited();

#region Register
prv_x = x div global.cell_size;
prv_y = y div global.cell_size;

global.ds_grid_objs[# prv_x, prv_y] = id;
#endregion

#region Movement
moveable = false;

mov_grid = [[0,1,0],[1,0,1],[0,1,0]];
#endregion