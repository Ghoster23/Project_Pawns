cmd_list[0]="restart";
cmd_argc[0]= 0;
cmd_help[0]="restart() -> restarts the room";

cmd_list[1]="quit";
cmd_argc[1]= 0;
cmd_help[1]="quit() -> quits the game";

cmd_list[2]="get_mouse_coords";
cmd_argc[2]= 0;
cmd_help[2]="get_mouse_coords() -> returns the coords of the mouse in the room";

cmd_list[3]="clear";
cmd_argc[3]= 0;
cmd_help[3]="clear() -> clears the console";

cmd_list[4]="instance_get_id_closest";
cmd_argc[4]= 1;
cmd_help[4]="instance_get_id_closest(object_name) -> returns id of closest (to mouse) object with given name";

cmd_list[5]="create_instance";
cmd_argc[5]= 3;
cmd_help[5]="create_instance(x,y,object_name)-> spawns instance with given name at given coords";

cmd_list[6]="repeat";
cmd_argc[6]= 2;
cmd_help[6]="repeat(n,command)-> runs command given n times";

cmd_list[7]="list_macros";
cmd_argc[7]= 0;
cmd_help[7]="list_macros() -> prints a list of all pre-programmed macros";

cmd_list[8]="create_instance_at_cursor";
cmd_argc[8]= 1;
cmd_help[8]="create_instance_at_cursor(object_name)-> spawns instance at cursor";

cmd_list[9]="info";
cmd_argc[9]= 1;
cmd_help[9]="info(keyword)-> provides information on a topic, provide ? to list keywords\n";

cmd_list[10]="instance_get_var";
cmd_argc[10]= 3;
cmd_help[10]="instance_get_var(instance_id,variable_name)-> Gets the value of a variable in an instance.\n";

cmd_list[11]="instance_set_var";
cmd_argc[11]= 3;
cmd_help[11]="instance_set_var(instance_id,variable_name,value)-> Sets the value of a variable in an instance.\n";

cmd_list[12]="instance_track_var";
cmd_argc[12]= 2;
cmd_help[12]="instance_track_var(instance_id,variable_name)-> Creates a window that tracks the instance variable if none exists or adds it to an existing tracker";

cmd_list[13]="debug_overlay";
cmd_argc[13]= 0;
cmd_help[13]="debug_overlay() -> toggles the display of the debug overlay";

cmd_list[14]="check_controller";
cmd_argc[14]= 0;
cmd_help[14]="check_controller() -> checks for controller connection";

cmd_list[15]="create_window_at_cursor";
cmd_argc[15]= 1;
cmd_help[15]="create_window_at_cursor(window_id) -> Creates specified window at cursor";

cmd_count = array_length_1d(cmd_list);