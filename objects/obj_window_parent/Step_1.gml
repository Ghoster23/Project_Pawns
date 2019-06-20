if(closed){
	scr_window_close();
	exit;
}

#region Update vars
cm = 1;

sc_wd = width  * cm;
sc_hg = height * cm;

x1 = x;
y1 = y;

x2 = x + sc_wd;
y2 = y + sc_hg;

sc_margin = margin * cm;

rg = x2 - sc_margin;
tp = y1 + sc_margin + bar_hg * cm;
lf = x1 + sc_margin;
bt = y2 - sc_margin;
#endregion

switch mov_state {
	case 0:	
		#region Drag Start
		if(moveable and
			scr_mouse_hold(x1, y1, x2, y1 + bar_hg * cm) and
							obj_window_controller.grabbed == noone){
			dist_x = x - obj_cursor.gui_x;
			dist_y = y - obj_cursor.gui_y;
			
			obj_window_controller.grabbed = id;
			
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
			obj_window_controller.grabbed = noone;
		}
		#endregion
	break;
}