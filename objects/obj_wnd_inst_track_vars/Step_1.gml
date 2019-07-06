cm = 1;

if(ds_list_size(tr_vars) == 0){
	scr_window_close();
}

if(tr_inst != noone and instance_exists(tr_inst)){
	height = 100 + tr_cnt * 12;
}else {
	width  = max(width, scr_string_width_in_font("Instance not found.", font) + 60);
	height = 100;
}

// Inherit the parent event
event_inherited();