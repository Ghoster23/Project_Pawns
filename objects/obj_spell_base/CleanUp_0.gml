var len = array_length_1d(params);

for(var i = 0; i < len; i++) {
	var p = params[i];
	
	if(ds_exists(p, ds_type_map)) {
		ds_map_destroy(p);
	}
}

len = array_length_1d(modifiers);

for(var i = 0; i < len; i++) {
	var m = modifiers[i];
	
	if(ds_exists(m, ds_type_map)) {
		ds_map_destroy(m);
	}
}