///@param command_string

var command_string = argument0;

var command = "";
var arguments_string = "";
var len = string_length(command_string);

for(var i = 0; i <= len; i++){
	
	if(string_char_at(command_string,i) == "?"){
		command = string_copy(command_string,0,i-1);
		scr_console_command_help(command);
		scr_scroll2max();
		exit;
	}
	
	if(string_char_at(command_string,i) == "("){
		command = string_copy(command_string,0,i-1);
		arguments_string = string_copy(command_string,i+1,len-(i+1));
		break;
	}
}

console_text += command_string + "\n";

var args;

switch(command){
	default:
		console_text += "#Command does not exist#\n"; 
	break;
	
	case "nada":
	break;

	case "quit":
		game_end();
	break;
	
	case "restart":
		room_restart();
	break;
	
	case "clear":
		console_text = "";
	break;
	
	case "debug_overlay":
		db_overlay = !db_overlay;
		show_debug_overlay(db_overlay);
	break;
	
	case "get_mouse_coords":
		console_text += "(" + string(mouse_x) + "," + string(mouse_y) + ")\n";
		
	break;
	
	case "instance_get_id_closest":
		#region Command
		args = scr_string_split(arguments_string,",");
		
		if(array_length_1d(args) != 1){
			console_text += "Incorrect number of arguments.\n";
			break;
		}
		
		console_text += string(args[0]) +"\n";
		var obj = instance_nearest(mouse_x,mouse_y,asset_get_index(args[0]));
		if(obj != noone){
			console_text += "requested instance id:" + string(obj.id) +"\n";
		}
		else{
			console_text += "#object not found# \n";
		}
		#endregion
	break;
	
	case "create_instance":
		#region Command
		args =  scr_string_split(arguments_string,",");
		
		if(array_length_1d(args) != 3){
			console_text += "Incorrect number of arguments.\n";
			break;
		}
		
		instance_create_layer(real(args[0]),real(args[1]),"Instances", asset_get_index(args[2]));
		#endregion
	break;
	
	case "repeat":
		#region Command
		var comma       = string_pos(",",arguments_string);
		var n           = real(string_copy(arguments_string, 0, comma-1));
		var arg_command = string_copy(arguments_string, comma+1, string_length(arguments_string)-(comma));
		console_text += arg_command + "\n";	
		repeat(n){
			scr_console_execute_command(arg_command);
		}
		#endregion
	break;
	
	case "list_macros":
		var list = scr_console_macros(0);
		console_text += list + "\n";
	break;
	
	case "create_instance_at_cursor":
		#region Command
		args = scr_string_split(arguments_string,",");
		
		if(array_length_1d(args) != 1){
			console_text += "Incorrect number of arguments.\n";
			break;
		}
		
		var inst = instance_create_layer(mouse_x,mouse_y,"Instances", asset_get_index(args[0]));
		
		if(inst != noone and instance_exists(inst)){
			console_text += "Created instance " + string(inst.id) + ".";
		}
		#endregion
	break;
	
	case "info":
		#region Command
		args = scr_string_split(arguments_string,",");
		
		if(array_length_1d(args) != 1){
			console_text += "Incorrect number of arguments.\n";
			break;
		}
		
		scr_console_info(args[0]);
		#endregion
	break;
	
	case "instance_get_var":
	case "instance_set_var":
		#region Command
		args = scr_string_split(arguments_string,",");
		
		var c = (command == "instance_set_var");
		
		if((not c and array_length_1d(args) != 2) or (c and array_length_1d(args) != 3)){
			console_text += "Incorrect number of arguments.\n";
			break;
		}
			
		var iid = int64(args[0]);
		
		if(!instance_exists(iid)){
			console_text += "Instance does not exist.\n";
			break;
		}
		
		if(!variable_instance_exists(iid,args[1])){
			console_text += "The instance does not have this variable.\n";
			break;
		}
		
		if(c){
			variable_instance_set(iid,args[1],scr_parse_string(args[2]));
		}
		
		console_text += "Id: " + args[0] + " Var: " + args[1] + " Val: " + string(variable_instance_get(iid,args[1])) + "\n";
		#endregion
	break;
	
	case "instance_track_var":
		#region Command
		args = scr_string_split(arguments_string,",");
		
		if(array_length_1d(args) != 2){
			console_text += "Incorrect number of arguments.\n";
			break;
		}
			
		var iid = int64(args[0]);
		
		if(!instance_exists(iid)){
			console_text += "Instance does not exist.\n";
			break;
		}
		
		if(!variable_instance_exists(iid,args[1])){
			console_text += "The instance does not have this variable.\n";
			break;
		}
		
		with(obj_windows_controller){
			var fnd = noone;
				
			#region Try to find a tracker
			with(obj_wnd_inst_track_vars){
				if(tr_inst == iid){
					fnd = id;
				}
			}
			#endregion
				
			if(fnd == noone){ //If none was found
				#region Create a tracker
				var inst = scr_window_create(obj_wnd_inst_track_vars);
				
				with(inst){
					tr_inst = iid;
					ds_list_add(tr_vars, args[1]);
					tr_cnt++;
					x = obj_cursor.gui_x;
					y = obj_cursor.gui_y;
				}
				#endregion
			}else {
				#region Add var to tracker
				if(ds_list_find_index(fnd.tr_vars,args[1]) != -1){
					other.console_text += "Variable is already being tracked.\n";
				}else {
					ds_list_add(fnd.tr_vars,args[1]);
					fnd.tr_cnt++;
					fnd.alarm[0] = -1;
				}
				#endregion
			}
		}
		#endregion
	break;
	
	case "instance_untrack_var":
		#region Command
		args = scr_string_split(arguments_string,",");
		
		if(array_length_1d(args) != 2){
			console_text += "Incorrect number of arguments.\n";
			break;
		}
			
		var iid = int64(args[0]);
		
		if(!instance_exists(iid)){
			console_text += "Instance does not exist.\n";
			break;
		}
		
		if(!variable_instance_exists(iid,args[1])){
			console_text += "The instance does not have this variable.\n";
			break;
		}
		
		var wnd = noone;
		
		with(obj_wnd_inst_track_vars){
			if(tr_inst == iid){
				wnd = id;
			}
		}
		
		if(wnd == noone){
			console_text += "No tracker exists for this instance.\n";
			break;
		}
		
		with(wnd){
			if(ds_list_find_index(tr_vars,args[1]) != -1){
				ds_list_delete(tr_vars,args[1]);
				other.console_text += "The variable has been untracked.\n";
			}else {
				other.console_text += "The variable is not being tracked.\n";
			}
		}
		
		#endregion
	break;
	
	case "check_controller":
		obj_input_controller.check_controller = true;
		console_text +="Checking Controller connection:\n";
	break;
}

scr_scroll2max();