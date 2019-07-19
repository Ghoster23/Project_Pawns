///@argument spell_id	(object_id)
///@argument type		(enum)
///@argument value		(enum)
///@argument slot       (array index)
{
var _sp = argument0;
var _tp = argument1;
var _vl = argument2;
var _sl = argument3;

with _sp {
	#region Contingency (meaning it shouldnt happen)
	var _current_pr = params[_sl];
	
	if(_current_pr != -1) {
		scr_spell_parameter_delete(_current_pr);
		show_debug_message("Parameter already in the slot. - Deleting it.");
	}
	#endregion

	// Create the parameter
	var _pr = scr_spell_parameter_create(_tp, _vl);
	
	// Set parameter to slot
	params[_sl] = _pr;
}

show_debug_message("Spell not found");
return 0;
}