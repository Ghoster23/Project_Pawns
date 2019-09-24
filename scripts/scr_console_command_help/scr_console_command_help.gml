///@description Presents the help information for the command in the console
///@argument string
{
var _cmd = argument0; 

var _ind = scr_console_find_command(_cmd);

if(_ind != -1){
	scr_console_log_message("HELP - " + cmd_help[_ind] + "\n");
	return;
}

scr_console_log_message(" - Cannot get help because command does not exist - \n");
}