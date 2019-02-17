var size = ds_list_size(draw_wnds);

for(var i = 0; i < size; i++){
	var wnd = draw_wnds[| i];
	
	with(wnd){
		drawing = true;
		event_perform( ev_draw, ev_gui_begin);
		event_perform( ev_draw, ev_gui);
		event_perform( ev_draw, ev_gui_end);
		drawing = false;
		
		if(i == size - 1){
			in_front = true;
		}else {
			in_front = false;
		}
	}
}