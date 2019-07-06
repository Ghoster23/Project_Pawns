///@argument spell_id
///@argument id
///@argument type
///@argument value
{
var _sp = argument0;
var _id = argument1;
var _tp = argument2;
var _vl = argument3;

with _sp {
	var _param = params[_id];
	
	var _current_tp = _param[? "Type"];
	
	var _clear_mods = false;
	
	if(_current_tp != _tp) {
		ds_map_set(_param,  "Type", _tp);
		
		if(_current_tp != param_type.none) {
			_clear_mods = true;
			
			if(_tp == param_type.none) {
				param_count -= 1;
			}
			
		}else if(_tp != param_type.none) {
			param_count += 1;
		}
	}
	
	if(_tp != param_type.none) {
		ds_map_set(_param, "Value", _vl);
	}else {
		ds_map_set(_param, "Value",  -1);
	}
	
	if(_clear_mods) {
		for(var i = _id * 2; i < _id * 2 + _param[? "Mods"]; i++) {
			var _mod = modifiers[i];
			
			ds_map_set(_mod,  "Type", param_type.none);
			ds_map_set(_mod, "Value",              -1);
		}
		
		ds_map_set(_param, "Mods", 0);
	}
}
}