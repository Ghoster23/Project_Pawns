scr_unique_inst();

#region Board
global.cell_size = 64;

h_cells = room_width  div 64;
v_cells = room_height div 64;

global.dg_tile = ds_grid_create(h_cells,v_cells);
global.dg_objs = ds_grid_create(h_cells,v_cells);

var cl = global.cell_size;

for(var i = 0; i < h_cells; i++){
	for(var j = 0; j < v_cells; j++){
		var tile = instance_create_layer(i * cl, j * cl, "Tiles", obj_tile);
		global.dg_tile[# i, j] = tile;
		global.dg_objs[# i, j] = noone;
	}
}

with obj_tile {
	init_state = 1;
}

global.brd_stt = 0;
#endregion

#region Turn
global.dl_pawns = ds_list_create(); //List of pawns (pieces that have actions)
global.pawn_cnt = 0;                //Pawn count
global.turn     = noone;            //Pawn who's has the turn
turn_counter    = 0;

slt_inst = noone;
slt_type = -1;
slt_stt  =  0;

mov_pawn = noone;
mov_list = -1;

act_pawn = noone;
#endregion