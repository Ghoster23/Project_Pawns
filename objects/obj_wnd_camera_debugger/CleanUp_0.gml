if(tr_map != -1 and ds_exists(tr_map, ds_type_list)){
	ds_map_destroy(tr_map);
	tr_map = -1;
}