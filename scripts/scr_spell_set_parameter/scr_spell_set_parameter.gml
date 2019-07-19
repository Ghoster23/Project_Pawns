///@argument spell_id	(object_id)
///@argument id			(ds_map id)
///@argument type		(enum)
///@argument value		(enum)
{
var _sp = argument0;
var _id = argument1;
var _tp = argument2;
var _vl = argument3;

with _sp {
	// If the parameter exists
	if(ds_exists(_id, ds_type_map)) {
		// If new type does not match current type
		if(_id[? "Type"] != _tp) {
			#region Clear Modifiers
			var _mods = _id[? "Mods"];
			
			while(_mods[| 0] != undefined) {
				var _mod = _mods[| 0];
				ds_list_delete(_mods, 0);
				
				ds_map_destroy(_mod);
			}
			#endregion
		}
		
		scr_spell_parameter_set_attributes(_id, _tp, _vl);
		return 1;
	}
	
	show_debug_message("Parameter non-existent.")
	return 0;
}

show_debug_message("Spell not found");
return 0;
}