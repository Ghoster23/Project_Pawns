if(ds_exists(cmd_text, ds_type_list)) {
	ds_list_destroy(cmd_text);
}

if(ds_exists(cmd_memory, ds_type_list)) {
	ds_list_destroy(cmd_memory);
}

event_inherited();