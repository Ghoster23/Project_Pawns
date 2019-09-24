///@argument parent_id
{
var prnt = argument0;

if(is_descended(prnt.object_index, obj_window_parent)){
	parent = prnt;
	
	with(parent) { scr_window_position_update(); }
	
	rel_x = x - parent.x;
	rel_y = y - parent.y;
	
	with(prnt){
		if(not ds_exists(sub_windows,ds_type_list)){
			sub_windows = ds_list_create();
		}
		
		if(ds_list_find_index(sub_windows, other.id) == -1) {
			ds_list_add(sub_windows,other.id);
			sub_window_count += 1;
		}
	}
}
}