for(var i = 0; i < ds_list_size(sub_windows); i++){
	var wnd = sub_windows[| i];
	
	if(!instance_exists(wnd)){
		ds_list_delete(sub_windows,i);
		i--;
	}
}

var click_x = -1;
var click_y = -1;

if(mouse_check_button_pressed(mb_left)) {
	click_x = obj_cursor.gui_x;
	click_y = obj_cursor.gui_y;
}

var clicked = noone;

if(click_x != -1 or click_y != -1) {
	for(var i = 0; i < ds_list_size(draw_wnds); i++){
		var wnd = draw_wnds[| i];
	
		if(!instance_exists(wnd)){
			ds_list_delete(draw_wnds,i);
			i--;
		}else {
			if(point_in_rectangle(click_x, click_y, wnd.x1, wnd.y1, wnd.x2, wnd.y2)) {
				if(clicked != noone) {
					clicked.in_front = false;
				}
			
				wnd.in_front = true;
				clicked = wnd;
			}
		}
	}
}

if(clicked != noone) {
	var ind = ds_list_find_index(draw_wnds, clicked);
	ds_list_delete(draw_wnds, ind);
	ds_list_add(draw_wnds, clicked);
}