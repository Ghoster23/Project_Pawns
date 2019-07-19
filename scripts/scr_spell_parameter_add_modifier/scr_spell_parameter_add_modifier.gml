///@description Add a modifier to a given spell's parameter
///@argument spell_id		(object_id)
///@argument param_id		(ds_map id)
///@argument type			(enum value)
///@argument value			(enum value)
{
var _sp = argument0;
var _pr = argument1;
var _tp = argument2;
var _vl = argument3;

with _sp {
	if(ds_exists(_pr, ds_type_map)) {
		// If modifier type does not match the type of the parameter it's modifying
		if(_pr[? "Type"] != _tp) {
			show_debug_message("Can't add a modifier of type " + string(_tp) + " to a parameter of type " + string(_pr[? "Type"] + "."));
			return 0;
		}
		
		var _mods = _pr[? "Mods"];        // Modifiers currently applied to the parameter
		var _cnt  = ds_list_size(_mods);  // Modifier count
		
		#region Check if the modifier is already applied
		for(var _i = 0; _i < _cnt; _i++) {
			var _mod = _mods[| _i];
			
			if(ds_exists(_mod, ds_type_map)) {
				if(_mod[? "Value"] == _vl) {
					show_debug_message("Modifier already applied.");
					return 0;
				}
				
			}else {
				ds_list_delete(_mod, _i);
				_i--;
				_cnt--;
			}
		}
		#endregion
		
		ds_list_add(_mods, scr_spell_modifier_create(_tp, _vl, 0));
		
		return 1;
	}
	
	show_debug_message("Parameter non-existent.");
	return  0;
}

show_debug_message("Spell not found.")
return 0;
}