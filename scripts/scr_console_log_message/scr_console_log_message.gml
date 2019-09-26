///@description Adds an entry to the console log
///@param string
{
var _str = argument0 + "\n";

with(obj_wnd_console) {	
	ds_list_add(txt_memory, _str);
}
}