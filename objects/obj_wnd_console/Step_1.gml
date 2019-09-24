// Inherit the parent event
event_inherited();

cmd_change = false; // Reset flag

// Input Box Dimensions
ibx_x1 = x;
ibx_y1 = y + sc_hg - 36 * cm;

ibx_x2 = ibx_x1 + sc_wd;
ibx_y2 = ibx_y1 + 36 * cm;

#region Input Box State Machine
switch cmd_state {
	case 0: // Not interacting
		if(scr_clicked_in( ibx_x1, ibx_y1, ibx_x2, ibx_y2)) {
			keyboard_string = ""; // Reset gml var
			cmd_state       =  1; // Go to 'Interacting'
		}
	break;
	
	case 1: // Interacting
		if(scr_clicked_out( ibx_x1, ibx_y1, ibx_x2, ibx_y2)) {
			cmd_state = 0;
			exit;
		}
		
		#region Command Execute
		if(keyboard_check_released(vk_enter)) {
			scr_console_execute_command(cmd_line);
			
			keyboard_string = "";
			
			cmd_line   = ""; // Reset line
			cmd_select = -1; // Reset Memory seleceted
			cmd_state  =  0; // Go to 'Not Interacting'
			exit;
		}
		#endregion
		
		// Update Line
		if(cmd_line != keyboard_string) {
			cmd_line   = keyboard_string;
			cmd_change = true;
		}
	break;
}
#endregion

#region Suggestion State Machine
switch(sgg_state) {
	case 0: // Closed
		if(cmd_state == 1 and keyboard_check_released(vk_tab) and cmd_line != "") {
			sgg_line     = cmd_line;
			sgg_array    = scr_find_substring_in_array(cmd_list, cmd_line);
			sgg_count    = array_length_1d(sgg_array);
			sgg_selected =  0;
			
			sgg_state    =  1; // Go to 'Open'
			break;
		}
	break;
	
	case 1: // Open
		if(cmd_state != 1 or cmd_change) {
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
			cmd_line = sgg_array[sgg_selected];
		}else {
			cmd_line = sgg_line;
		}
		
		keyboard_string = cmd_line;
	break;
}
#endregion

#region Memory
if(cmd_state == 1 and sgg_state == 0) {
	var _slt = cmd_select;
		
	if(keyboard_check_released(vk_up)) {
		var _before = cmd_select - 1;
		_slt = _before < -1 ? cmd_memcnt - 1 : _before;
	}
		
	if(keyboard_check_released(vk_down)) {
		var _after = cmd_select + 1;
		_slt = _after == cmd_memcnt ? -1 : _after;
	}
		
	if(_slt != cmd_select) {
		cmd_select = _slt;
			
		if(_slt == -1) {
			cmd_line        = "";
			keyboard_string = "";
		}else {
			cmd_line        = cmd_memory[| _slt];
			keyboard_string = cmd_line;
		}
	}
}
#endregion