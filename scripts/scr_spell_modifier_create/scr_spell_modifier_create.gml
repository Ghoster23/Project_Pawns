///@description Creates a spell modifier
///@param type	(enum)
///@param value	(enum)
///@param level (0-3)
{
var _mod = ds_map_create();

ds_map_add(_mod,  "Type", argument0 == undefined ? param_type.none : argument0);
ds_map_add(_mod, "Value", argument1 == undefined ?              -1 : argument1);
ds_map_add(_mod, "Level", argument2 == undefined ?               0 : argument2);

return _mod;
}