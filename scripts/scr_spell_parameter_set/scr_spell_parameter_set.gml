///@description Sets a spell parameter's attributes
///@param id				(ds_map_id)
///@param type				(check enum - param_type)
///@param value				(check enum)
{
var _id = argument0;

if(ds_exists(_id, ds_type_map)) {
	if(argument1 != undefined) ds_map_set(_id,  "Type", argument1);
	if(argument2 != undefined) ds_map_set(_id, "Value", argument2);
}
}