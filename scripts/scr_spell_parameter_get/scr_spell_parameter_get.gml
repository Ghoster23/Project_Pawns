///@description Gets a spell parameter's attributes
///@param id	(ds_map_id)
{
var _id = argument0;

if(ds_exists(_id, ds_type_map)) {
	var _type  = _id[?  "Type"];
	var _value = _id[? "Value"];
	
	#region Get modifiers
	var _mods = _id[? "Mods"];
	var _cnt  = ds_list_size(_mods);
	
	var _mod_array = [];
	var _j = 0;
	
	for(var _i = 0; _i < _cnt; _i++) {
		var _mod = _mods[| _i];
		
		if(ds_exists(_mod, ds_type_map)) {
			_mod_array[_j] = scr_spell_modifer_get(_mod);
			_j++;
		}
	}
	#endregion
	
	return [_type, _value, _mod_array];
}

show_debug_message("Parameter not found.");
return 0;
}