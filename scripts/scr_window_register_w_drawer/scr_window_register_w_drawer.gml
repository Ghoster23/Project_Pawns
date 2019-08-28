{
if(instance_exists(obj_windows_controller)){
	drawer = obj_windows_controller;
	with(drawer){
		if(not ds_exists(draw_wnds,ds_type_list)){
			draw_wnds = ds_list_create();
		}
		
		if(ds_list_find_index(draw_wnds, other.id) == -1) {
			ds_list_add(draw_wnds, other.id);
		}
	}
}
}