///@description Finds a command if it exists, if not returns -1
///@argument string
{
var _cmd = argument0;

for(var i = 0; i < cmd_count; i++) {
	if(_cmd == cmd_list[i]) {
		return i;
	}
}

return -1;
}