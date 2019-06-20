{
if(sub_window_count) {
	for(var i = 0; i < sub_window_count; i++) {
		with sub_windows[| i ] {
			scr_window_close();
		}
	}
}

scr_window_unregister_w_parent();

scr_window_unregister_w_drawer();

instance_destroy();
}