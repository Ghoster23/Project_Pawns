///@argument ds_id
///@argument ds_type
{
var ds_id = argument0;
var ds_tp = argument1;

if(ds_id != -1 and ds_exists(ds_id,ds_tp)){
	switch ds_tp {
		case ds_type_grid:
			ds_grid_destroy(ds_id);
		break;
		
		case ds_type_list:
			ds_list_destroy(ds_id);
		break;
		
		case ds_type_map:
			ds_map_destroy(ds_id);
		break;
		
		case ds_type_priority:
			ds_priority_destroy(ds_id);
		break;
		
		case ds_type_queue:
			ds_queue_destroy(ds_id);
		break;
		
		case ds_type_stack:
			ds_stack_destroy(ds_id);
		break;
	}
}
}