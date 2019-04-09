{
var map = argument0;

var len = ds_map_size(map);

show_debug_message("Ds Map - " + string(len));

var key = ds_map_find_first(map);

while(not is_undefined(key)){
	show_debug_message("Key - " + string(key) + " | Value - " + string(ds_map_find_value(map,key)));
	
	key = ds_map_find_next(map,key);
}
}