///@description Draws a window
///@argument object_id
{
var wnd = argument0;

if(not is_descended(wnd.object_index, obj_window_parent)) {
	show_debug_message("Failed to draw window due to provided object id not being a window.");
	show_debug_message("Object - " + object_get_name(wnd.object_index));
	return;
}

with(wnd){
	#region Draw window
	drawing = true;
	
	cm = 1;
		
	event_perform( ev_draw, ev_gui_begin);
	event_perform( ev_draw, ev_gui);
	event_perform( ev_draw, ev_gui_end);
		
	drawing = false;
	#endregion
	
	#region Draw Sub Windows
	for(var i = 0; i < sub_window_count; i++) {
		var sub_window = sub_windows[| i];
		
		if(instance_exists(sub_window)) {
			scr_window_draw(sub_window);
		}else {
			ds_list_delete(sub_windows, i);
			i--;
			sub_window_count--;
		}
	}
	#endregion
}
}