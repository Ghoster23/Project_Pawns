var size = ds_list_size(draw_wnds);

for(var i = 0; i < size; i++){
	var wnd = draw_wnds[| i];
	
	draw_set_font(fn_press_start);
	scr_window_draw(wnd);
	draw_set_font(-1);
}