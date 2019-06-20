var size = ds_list_size(draw_wnds);

for(var i = 0; i < size; i++){
	var wnd = draw_wnds[| i];
	
	scr_window_draw(wnd);
}