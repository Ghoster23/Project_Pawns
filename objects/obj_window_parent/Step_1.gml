if(closed){
	scr_window_close();
	exit;
}

switch mov_state {
	case 0:	
		#region Drag Start
		if(moveable and
			scr_mouse_hold(x1, y1, x2, y1 + bar_hg * cm) and
							obj_windows_controller.grabbed == noone){
			dist_x = x - obj_cursor.gui_x;
			dist_y = y - obj_cursor.gui_y;
			
			obj_windows_controller.grabbed = id;
			
			mov_state = 1;
		}
		#endregion
	break;
	
	case 1:
		#region Drag On-Going
		x = obj_cursor.gui_x + dist_x;
		y = obj_cursor.gui_y + dist_y;
		
		if(!mouse_check_button(mb_left)){
			mov_state = 0;
			obj_windows_controller.grabbed = noone;
		}
		#endregion
	break;
}

switch resize_state {
	case 0:	
		#region Drag Start
		if(resizeable and
			scr_mouse_hold(x2 - 24 * cm, y2 - 24 * cm, x2, y2) and
							obj_windows_controller.grabbed == noone){			
			resize_state = 1;
		}
		#endregion
	break;
	
	case 1:
		#region Drag On-Going
		width  = max( min_width, (obj_cursor.gui_x - x) / cm);
		height = max(min_height, (obj_cursor.gui_y - y) / cm);
		
		if(!mouse_check_button(mb_left)){
			resize_state = 0;
		}
		#endregion
	break;
}