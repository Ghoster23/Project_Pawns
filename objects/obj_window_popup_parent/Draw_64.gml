if(parent != noone and instance_exists(parent)) {
	if(relative_pos) {
		x = parent.x + rel_x;
		y = parent.y + rel_y;
	}

	in_front = parent.in_front;
}else {
	scr_window_close();
}

event_inherited();