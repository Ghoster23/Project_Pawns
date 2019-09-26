// Inherit the parent event
event_inherited();

inp_change = false; // Reset flag

// Input Box Dimensions
ibx_x1 = x;
ibx_y1 = y + sc_hg - 36 * cm;

ibx_x2 = ibx_x1 + sc_wd;
ibx_y2 = ibx_y1 + 36 * cm;

#region Input Box State Machine
switch inp_state {
	case 0: // Not interacting
		if(scr_clicked_in( ibx_x1, ibx_y1, ibx_x2, ibx_y2)) {
			keyboard_string = ""; // Reset gml var
			inp_state       =  1; // Go to 'Interacting'
		}
	break;
	
	case 1: // Interacting
		if(scr_clicked_out( ibx_x1, ibx_y1, ibx_x2, ibx_y2)) {
			inp_state = 0;
			exit;
		}
		
		#region Command Execute
		if(keyboard_check_released(vk_enter)) {
			scr_console_execute_command(inp_line);
			
			keyboard_string = "";
			
			inp_line   = ""; // Reset line
			inp_select = -1; // Reset Memory seleceted
			inp_state  =  0; // Go to 'Not Interacting'
			exit;
		}
		#endregion
		
		// Update Line
		if(inp_line != keyboard_string) {
			inp_line   = keyboard_string;
			inp_change = true;
		}
	break;
}
#endregion

#region Suggestion State Machine
switch(sgg_state) {
	case 0: // Closed
		if(inp_state == 1 and keyboard_check_released(vk_tab) and inp_line != "") {
			sgg_line     = inp_line;
			sgg_array    = scr_find_substring_in_array(cmd_list, inp_line);
			sgg_count    = array_length_1d(sgg_array);
			sgg_selected =  0;
			
			if(sgg_count > 0) sgg_state = 1; // Go to 'Open'
			break;
		}
	break;
	
	case 1: // Open
		if(inp_state != 1 or inp_change) {
			sgg_state = 0;
			break;
		}
		
		#region Array navigation
		if(keyboard_check_released(vk_up)) {
			var _before = sgg_selected - 1;
			sgg_selected = _before < -1 ? sgg_count - 1 : _before;
		}
		
		if(keyboard_check_released(vk_tab) or keyboard_check_released(vk_down)) {
			var _after = sgg_selected + 1;
			sgg_selected = _after == sgg_count ? -1 : _after;
		}
		#endregion
		
		// Line update
		if(sgg_selected != -1) {
			inp_line = sgg_array[sgg_selected];
		}else {
			inp_line = sgg_line;
		}
		
		keyboard_string = inp_line;
	break;
}
#endregion

#region Memory
if(inp_state == 1 and sgg_state == 0) {
	var _slt = inp_select;
		
	if(keyboard_check_released(vk_up)) {
		var _before = inp_select - 1;
		_slt = _before < -1 ? inp_memcnt - 1 : _before;
	}
		
	if(keyboard_check_released(vk_down)) {
		var _after = inp_select + 1;
		_slt = _after == inp_memcnt ? -1 : _after;
	}
		
	if(_slt != inp_select) {
		inp_select = _slt;
			
		if(_slt == -1) {
			inp_line        = "";
			keyboard_string = "";
		}else {
			inp_line        = inp_memory[| _slt];
			keyboard_string = inp_line;
		}
	}
}
#endregion