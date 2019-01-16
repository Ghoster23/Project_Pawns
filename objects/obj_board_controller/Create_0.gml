global.cell_size = 64;

h_cells = room_width  div 64;
v_cells = room_height div 64;

global.ds_grid_tile = ds_grid_create(h_cells,v_cells);
global.ds_grid_objs = ds_grid_create(h_cells,v_cells);

for(var i = 0; i < h_cells; i++){
	for(var j = 0; j < v_cells; j++){
		global.ds_grid_tile[# i, j] = noone;
		global.ds_grid_objs[# i, j] = noone;
	}
}