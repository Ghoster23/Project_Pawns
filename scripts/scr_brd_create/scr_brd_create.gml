///@description Creates an empty board of the specified size
///@param board_width
///@param board_depth
///@param board_height
{
if(instance_exists(obj_board_controller)) {
	with(obj_board_controller) {
		board_width  = argument0;
		board_depth  = argument1;
		board_height = argument2;
		
		global.brd_stt = 1;
	}
return 1;
}

return 0;
}