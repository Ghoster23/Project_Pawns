if(alarm[1] == -1){
	var mx_wd = 0;
	
	var vr = ds_map_find_first(tr_map);
	
	draw_set_font(font);
	
	while(vr != undefined) {
		var vl = variable_instance_get(tr_inst, vr);
		
		if(vl == undefined) {
			vl = "undefined";
		}
		
		#region Arrays
		if(is_array(vl)){
			var nvl  = "[ ";
			var vlen = array_length_1d(vl);
			
			for(var j = 0; j < vlen; j++){
				nvl += string(vl[j]);
				
				if(j < vlen - 1){
					nvl += ", ";
				}else {
					nvl += "]";
				}
			}
			
			vl = nvl;
		}
		#endregion
		
		ds_map_set(tr_map, vr, vl);
		
		#region Update mx_wd
		var nwd = string_width(vr);
		if(nwd > mx_wd){
			mx_wd = nwd;
		}
		
		var nwd = string_width(vl);
		if(nwd > mx_wd){
			mx_wd = nwd;
		}
		#endregion
		
		vr = ds_map_find_next(tr_map, vr);
	}
	
	width = max(scr_string_width_in_font(title, font) + 60, mx_wd * 2 + 24);
	
	alarm[1] = 5;
}