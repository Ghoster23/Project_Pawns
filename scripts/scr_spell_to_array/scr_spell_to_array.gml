//@description Returns an array containing the spell information
//@argument spell_id
{
var _obj = argument0;

var _spell = []; // [ spell_type, parameter_count, parameter_array]

if(instance_exists(_obj) and is_descended(_obj, obj_spell_base)) {
	with _obj {
		_spell[0] = type;
		_spell[1] = param_count;

		var _params    = [];
		var _converted =  0;
		var _i = 0;

		while(_converted < param_count and _i < max_param_count){
			var _map = params[_i];
			
			if(ds_exists(_map, ds_type_map) and _map[? "Type"] != param_type.none) {
				var _param = []; // [parameter_type, parameter_value, modifier_count, modifier_array]

				_param[0] = _map[?  "Type"];
				_param[1] = _map[? "Value"];
				var _mods = _map[?  "Mods"];
				_param[2] = _mods;
				
				var _mod_array = [];

				for(var _j = 0; _j < array_length_1d(_mods); _j++){
					var _mod = modifiers[_mods[_j]];
					_mod_array[_j] = [_mod[? "Type"], _mod[? "Value"], _mod[? "Level"]];
				}

				_param[3] = _mod_array;

				_converted++;
			}
			
			_i++;
		}

		_spell[2] = _params;

		return _spell;
	}
}
}