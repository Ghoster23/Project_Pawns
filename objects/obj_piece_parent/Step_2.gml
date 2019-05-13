#region End Turn
if(global.turn == id){
	if(act != 2 or move != 2){
		global.turn = noone;
		act  = 1;
		move = 1;
	}
}

offs = z;
#endregion

#region Position Update
var xx = x div global.cell_size;
var yy = y div global.cell_size;

if(xx != prv_x or yy != prv_y){
	var px = prv_x;
	var py = prv_y;
	
	global.dg_objs[# px, py] = noone;
	global.dg_objs[# xx, yy] = other.id;
	
	with(tile){ 
		free = true;
		if(other.piece_type == 2) blocked = false;
	}
	tile = global.dg_tile[# xx, yy];
	with(tile){ 
		free = false;
		if(other.piece_type == 2) blocked = true;
	}
	
	prv_x = xx;
	prv_y = yy;
	
	moved = true;
}
#endregion

//End of round processes
event_inherited();