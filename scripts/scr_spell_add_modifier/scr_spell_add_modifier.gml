///@argument spell_id
///@argument param_id
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
	
	if(_current_tp != _tp) {
		show_debug_message("Can't add mismatched typed modifier to parameter.");
		return;
	}
	
	var max_mods = 0;
	
	for(var i = 1; i < 6; i++) {
		var _n_id = (_id + i) mod 6;
		var _next = params[_n_id];
		
		if(_next[? "Type"] != param_type.none) {
			max_mods = i * 2;
			break;
		}
	}
	
	var cur_mods = _param[? "Mods"];
	
	if(cur_mods < max_mods) {
		var _modf = modifiers[(_id * 2 + cur_mods) mod 12];
		
		ds_map_set(_modf,  "Type", _tp);
		ds_map_set(_modf, "Value", _vl);
		
		ds_map_set(_param, "Mods", cur_mods + 1);
	}
}
}