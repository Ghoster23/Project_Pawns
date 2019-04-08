#region Position Update
var xx = x div global.cell_size;
var yy = y div global.cell_size;

if(xx != prv_x or yy != prv_y){
	var px = prv_x;
	var py = prv_y;
	
	global.dg_objs[# px, py] = noone;
	global.dg_objs[# xx, yy] = other.id;
	
	with(tile){ free = true;  }
	tile = global.dg_tile[# xx, yy];
	with(tile){ free = false; }
	
	prv_x = xx;
	prv_y = yy;
	
	moved = true;
}
#endregion