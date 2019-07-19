///@description Sets a spell modifiers attributes
///@param id			(ds_map_id)
///@param type			(check enum - param_type)
///@param value			(check enum)
///@param level			(0 - 3)
{
var _id = argument0;

if(ds_exists(_id, ds_type_map)) {
	if(argument1 != undefined) ds_map_set(_id,  "Type", argument1);
	if(argument2 != undefined) ds_map_set(_id, "Value", argument2);
	if(argument3 != undefined) ds_map_set(_id, "Level", argument3);
	
	return 1;
}

return 0;
}