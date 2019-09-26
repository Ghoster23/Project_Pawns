if(ds_exists(inp_memory, ds_type_list)) {
	ds_list_destroy(inp_memory);
}

if(ds_exists(txt_memory, ds_type_list)) {
	ds_list_destroy(txt_memory);
}

event_inherited();