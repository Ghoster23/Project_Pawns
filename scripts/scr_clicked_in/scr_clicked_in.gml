///@argument x1
///@argument y1
///@argument x2
///@argument y2
{
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

if(mouse_check_button_pressed(mb_left)){
	if(point_in_rectangle(obj_cursor.gui_x,obj_cursor.gui_y,x1,y1,x2,y2)){
		return 1;
	}
}

return 0;
}