///@description Returns True if a given tile is not occupied, False if not or it doesn't exist
///@argument collumn
///@argument row
{
var col = argument0;
var row = argument1;

if(0 <= col and col < obj_board_controller.h_cells and
   0 <= row and row < obj_board_controller.v_cells  ){
	
	var tl = global.dg_tile[# col, row];
	
	if(not is_undefined(tl) and instance_exists(tl)){
		return not tl.blocked;
	}
}

return false;
}