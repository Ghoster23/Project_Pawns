switch(room){
	default:
		x = device_mouse_x_to_gui(0);
		y = device_mouse_y_to_gui(0);
		
		sl_tl[0] = mouse_x div global.cell_size;
		sl_tl[1] = mouse_y div global.cell_size;
	break;
}
