show_debug_message("\nView is enabled - " + string(view_enabled) + "\n");

if(view_enabled) {
	for(var i = 0; i < 8; i++) {
		show_debug_message("View port " + string(i));
		show_debug_message("Visible - " + string(view_visible[i]));
		show_debug_message("Camera - " + string(view_camera[i]));
		show_debug_message("X - " + string(view_xport[i]) + " Y - " + string(view_yport[i]));
		show_debug_message("WD - " + string(view_wport[i]) + " HG - " + string(view_hport[i]));
		show_debug_message("\n\n");
	}
}

show_debug_message("\n Room info - \n");
show_debug_message("Camera - " + string(room_get_camera(room, 0)));
show_debug_message("View Port - " + string(room_get_viewport(room, 0)));