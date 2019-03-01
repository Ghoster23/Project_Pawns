switch(room){
	default:
		x = device_mouse_x_to_gui(0);
		y = device_mouse_y_to_gui(0);
		
		sl_tl[0] = clamp(mouse_x div global.cell_size,0,room_width  div global.cell_size - 1);
		sl_tl[1] = clamp(mouse_y div global.cell_size,0,room_height div global.cell_size - 1);
		
		tile_id  = global.dg_tile[# sl_tl[0],sl_tl[1]];
	break;
}
