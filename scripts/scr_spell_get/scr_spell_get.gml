///@description Gets a spell's attributes
///@param id	(object id)
{
with(argument0) {
	var _type = type;
	
	#region Get array of parameters
	var _param_array = [];
	var _j = 0;
	
	var _cnt = array_length_1d(params);
	
	for(var _i = 0; _i < _cnt; _i++) {
		if(params[_i] != -1) {
			_param_array[_j] = scr_spell_parameter_get(params[_i]);
			_j++;
		}
	}
	#endregion
	
	return [_type, _param_array];
}

show_debug_message("Spell not found.");
return 0;
}