///@description Deletes a spell slot
///@param id
{
if(ds_exists(argument0, ds_type_map)) {
	ds_map_destroy(argument0);
}
}