///@description Sets a modifier to a given spell's parameter
///@argument spell_id		(object_id)
///@argument param_id		(ds_map id)
///@argument modifier_id	(ds_map id)
///@argument type			(enum value)
///@argument value			(enum value)
{
var _sp = argument0;
var _pr = argument1;
var _id = argument2;
var _tp = argument3;
var _vl = argument4;

with _sp {
	if(ds_exists(_pr, ds_type_map)) {
		// If modifier type does not match the type of the parameter it's modifying
		if(_pr[? "Type"] != _tp) {
			show_debug_message("Can't set the modifier's type to " + string(_tp) + " given the parameter's type is " + string(_pr[? "Type"] + "."));
			return 0;
		}
		
		var _mods = _pr[? "Mods"];  // Modifiers currently applied to the parameter
		
		var _ind = ds_list_find_index(_mods, _id);
		
		// If the modifier is applied to the given parameter
		if(_ind != -1) {
			return scr_spell_modifer_set(_id, _tp, _vl, undefined);
		}else {
			show_debug_message("Modifier not applied to given parameter.");
			return 0;
		}
	}
	
	show_debug_message("Parameter non-existent.");
	return  0;
}

show_debug_message("Spell not found.")
return 0;
}