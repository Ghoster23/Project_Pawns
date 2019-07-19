///@description Creates a spell modifier
///@param type	(enum)
///@param value	(enum)
{
var _param = ds_map_create();

ds_map_add(_param,  "Type", argument0 == undefined ? param_type.none : argument0);
ds_map_add(_param, "Value", argument1 == undefined ?              -1 : argument1);
ds_map_add(_param,  "Mods", ds_list_create());

return _param;
}