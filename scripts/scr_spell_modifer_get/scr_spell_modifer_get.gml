///@description Gets a spell modifiers attributes
///@param id			(ds_map_id)
{
var _id = argument0;

if(ds_exists(_id, ds_type_map)) {
	return [_id[? "Type"], _id[? "Value"], _id[? "Level"]];
}

show_debug_message("Modifier not found.");
return 0;
}