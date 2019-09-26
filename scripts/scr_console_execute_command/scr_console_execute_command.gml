///@description Attempts to execute the received command
///@param string
{
var _str = argument0;

var _info = scr_string_split( _str, "(");

var _text = "";

if(array_length_1d(_info) > 1) {
	#region Command
	var _cmd = _info[0];
	
	var _ind = scr_console_find_command(_cmd);
	
	// Command found
	if(_ind != -1) {
		#region Get arguments
		var _args = scr_string_split( _info[1], ",");
		var _argc = array_length_1d(_args);
		
		#region Delete closing parenthesis
		var close_par = string_pos(")", _args[_argc - 1]);
	
		if(close_par) {
			_args[_argc - 1] = string_delete(_args[_argc - 1], close_par, 1);
		}
		
		if(_args[0] == "") {
			_argc--;
		}
		#endregion
		
		#region Check argument count
		if(cmd_argc[_ind] != _argc) {
			scr_console_log_message(_text + "ERROR - Invalid number of arguments for the issued command. - \n");
			scr_console_command_help(_cmd);
			return;
		}
		#endregion
		#endregion
		
		_text = _cmd + "\n";
		
		#region Commands
		switch(_cmd){
			default:
				scr_console_log_message(_text + "ERROR - Command does not exist. - \n");
				return;
			break;

			case "quit":
				game_end();
			break;
	
			case "restart":
				room_restart();
			break;
	
			case "clear":
				_text = "";
				ds_list_clear(cmd_text);
			break;
	
			case "debug_overlay":
				debug_overlay = !debug_overlay;
				show_debug_overlay(debug_overlay);
				_text += "Debug overlay turned " + (debug_overlay ? "on." : "off.");
			break;
	
			case "get_mouse_coords":
				_text += "Mouse: X - " + string(mouse_x) + " Y - " + string(mouse_y) + "\n";
			break;
	
			case "instance_get_id_closest":
				#region
				var _obj_ind = asset_get_index(_args[0]);
				
				// Object found
				if(_obj_ind != -1) {
					var _inst_id = instance_nearest(mouse_x,mouse_y,_obj_ind);
					
					// Instance found
					if(_inst_id != noone) {
						_text += "Closest instance of " + _args[0] + " is " + string(_inst_id) + "\n";
					}
					// None found
					else {
						_text += "No instance of " + _args[0] + " found. \n";
					}
				}
				// Object not found
				else {
					_text += "No object asset \"" + _args[0] + "\" was found.\n";
				}
				#endregion
			break;
	
			case "create_instance":
				#region
				var _obj_id = asset_get_index(_args[2]);
				
				// Object found
				if(_obj_id != -1) {
					var _inst_id = instance_create_layer(real(_args[0]), real(_args[1]), "Instances", _obj_id);
					
					_text += "Instance " + string(_inst_id) + " of " + _args[2] + " created at ( " + _args[0] + ", " + _args[1] + ")\n";
				}
				// Object not found
				else {
					_text += "No object asset \"" + _args[2] + "\" was found.\n";
				}
				#endregion
			break;
			
			case "create_instance_at_cursor":
				#region
				var _obj_id = asset_get_index(_args[2]);
				
				// Object found
				if(_obj_id != -1) {
					var _inst_id = instance_create_layer(mouse_x, mouse_y, "Instances", _obj_id);
					
					_text += "Instance " + string(_inst_id) + " of " + _args[2] + " created at ( " + mouse_x + ", " + mouse_y + ")\n";
				}
				// Object not found
				else {
					_text += "No object asset \"" + _args[2] + "\" was found.\n";
				}
				#endregion
			break;
	
			case "repeat":
				#region
				_text += "ERROR - Command needs to be re-implemented.\n";
				#endregion
			break;
	
			case "list_macros":
				var list = scr_console_macros(0);
				_text += list + "\n";
			break;
	
			case "info":
				scr_console_info(_args[0]);
			break;
	
			case "instance_get_var":
			case "instance_set_var":
				#region
				var _set = (_cmd == "instance_set_var");
		
				var _inst_id = int64(_args[0]);
		
				if(!instance_exists(_inst_id)){
					_text += "ERROR - Instance " + _args[0] + " does not exist.\n";
					break;
				}
		
				if(!variable_instance_exists(_inst_id, _args[1]) and !_set){
					_text += "ERROR - Instance " + _args[0] + " does not possess a variable named \"" + _args[1] + "\".\n";
					break;
				}
		
				if(_set){
					variable_instance_set(_inst_id, _args[1], scr_parse_string(_args[2]));
				}
		
				_text += "Instance: " + _args[0] + " Variable: " + _args[1] + " Value: " + string(variable_instance_get(_inst_id, _args[1])) + "\n";
				#endregion
			break;
	
			case "instance_track_var":
				#region
				var _inst_id = int64(_args[0]);
		
				if(!instance_exists(_inst_id)){
					_text += "ERROR - Instance " + _args[0] + " does not exist.\n";
					break;
				}
		
				if(!variable_instance_exists(_inst_id, _args[1])){
					_text += "ERROR - Instance " + _args[0] + " does not possess a variable named \"" + _args[1] + "\".\n";
					break;
				}
		
				with(obj_windows_controller){
					var fnd = noone;
				
					#region Try to find a tracker
					with(obj_wnd_inst_track_vars){
						if(tr_inst == _inst_id){
							fnd = id;
						}
					}
					#endregion
				
					if(fnd == noone){ //If none was found
						#region Create a tracker
						var inst = scr_window_create(obj_wnd_inst_track_vars, style_init, obj_cursor.gui_x, obj_cursor.gui_y);
				
						with(inst){
							tr_inst = _inst_id;
							ds_list_add(tr_vars, _args[1]);
							tr_cnt++;
						}
						#endregion
					}else {
						#region Add var to tracker
						if(ds_list_find_index(fnd.tr_vars, _args[1]) != -1){
							_text += "ERROR - Variable \"" + _args[1] + "\" of instance " + _args[0] + " is already being tracked.\n";
						}else {
							ds_list_add(fnd.tr_vars, _args[1]);
							fnd.tr_cnt++;
							fnd.alarm[0] = -1;
						}
						#endregion
					}
				}
				#endregion
			break;
	
			case "instance_untrack_var":
				#region		
				var _inst_id = int64(_args[0]);
		
				if(!instance_exists(_inst_id)){
					_text += "ERROR - Instance " + _args[0] + " does not exist.\n";
					break;
				}
		
				if(!variable_instance_exists(_inst_id, _args[1])){
					_text += "ERROR - Instance " + _args[0] + " does not possess a variable named \"" + _args[1] + "\".\n";
					break;
				}
		
				var wnd = noone;
		
				with(obj_wnd_inst_track_vars){
					if(tr_inst == _inst_id){
						wnd = id;
					}
				}
		
				if(wnd == noone){
					_text += "No tracker exists for instance " + _args[0] + "\n";
					break;
				}
		
				with(wnd){
					if(ds_list_find_index(tr_vars, _args[1]) != -1){
						ds_list_delete(tr_vars, _args[1]);
						_text += "Variable \"" + _args[1] + "\" of instance " + _args[0] + " has been untracked.\n";
					}else {
						_text += "Variable \"" + _args[1] + "\" of instance " + _args[0] + " is not being tracked.\n";
					}
				}
				#endregion
			break;
	
			case "check_controller":
				obj_input_controller.check_controller = true;
				_text +="Checking Controller connection:\n";
			break;
	
			case "create_window_at_cursor":
				#region 
				var _wnd_id = scr_window_create( asset_get_index(_args[0]), scr_wnd_st_tkg_init, obj_cursor.gui_x, obj_cursor.gui_y);
		
				if(_wnd_id != noone and instance_exists(_wnd_id)){
					_text += "Created window " + string(_wnd_id) + "\n";
				}
				#endregion
			break;
		}
		#endregion
		
		ds_list_add(cmd_memory, _str); // Save executed command to memory
		cmd_memcnt++;
		
	// Command not found		
	}else {
		scr_console_log_message("ERROR - Command \"" + _cmd + "\" not found.");
	}
	#endregion
}else {
	if(string_pos("?", _str)) {
		scr_console_command_help(string_delete(_str, string_length(_str), 1));
	}
}

if(_text != "") scr_console_log_message(_text);
}