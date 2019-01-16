#region Position Update
var xx = x div global.cell_size;
var yy = y div global.cell_size;

var mvd = false;

if(xx != prv_x or yy != prv_y){
	var px = prv_x;
	var py = prv_y;
	
	global.ds_grid_objs[# px, py] = noone;
	global.ds_grid_objs[# xx, yy] = other.id;
	
	prv_x = xx;
	prv_y = yy;
}
#endregion