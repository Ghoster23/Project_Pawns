#region Measurements
cl_x = x div global.cell_size;
cl_y = y div global.cell_size;

cl_sz = global.cell_size;
#endregion

#region Tyle System
init_state = 0;

adj = [noone,noone,noone,noone,noone,noone,noone,noone];

free = true;

srch_vis = false;
#endregion

max_hp = 3;
hp     = 3;

scr_statuses_init();