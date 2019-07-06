if(tr_inst != noone and instance_exists(tr_inst)){
	height = bar_hg * cm + 4 * margin * cm + 48 * cm + 8 * 16 * cm;
	
	tr_state = 1;
	
}else {
	width  = max(width, scr_string_width_in_font("Instance not found.", font) + 60);
	height = 100;
	
	tr_state = 0;
}

// Inherit the parent event
event_inherited();