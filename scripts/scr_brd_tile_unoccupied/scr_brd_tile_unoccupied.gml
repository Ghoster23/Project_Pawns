///@argument tile_x
///@argument tile_y
{
var tlx = argument0;
var tly = argument1;

var tl = global.dg_tile[# tlx, tly];

if(tl != noone){
	if(instance_exists(tl)){
		if(tl.object_index == obj_tile or is_descended(tl.object_index, obj_tile)){
			return not tl.blocked and tl.free;
		}
	}
}
}