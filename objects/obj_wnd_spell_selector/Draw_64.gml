// Inherit the parent event
event_inherited();

var _in_wd = rg - lf; // Inner window width

#region Spell Type
spell_type = scr_window_list_selector( spell_type, lf, tp, lst_spell_types, 0, _in_wd);
#endregion

#region Slot Type
var _slot_type = scr_window_list_selector( selected[0], lf, tp + 48 * cm, lst_slot_types, 1, _in_wd);

#region Value change
if(_slot_type != selected[0]) {
	selected[0] = _slot_type;
	
	// Reset selected values
	selected[1] = 0;
	selected[2] = 0;
	
	// Reset Sub Lists
	with select_popup[2] { closed = true; }
	with select_popup[3] { closed = true; }
}
#endregion
#endregion

#region Slot Subtype
if(_slot_type != 0) {
	var _tp = scr_window_list_selector( selected[1], lf, tp + 96 * cm, opt_types[_slot_type], 2, _in_wd);

	#region Value change
	if(_tp != selected[1]) {
		selected[1] = _tp;
		
		// Reset selected value
		selected[2] = 0;
		
		// Reset Sub List
		with select_popup[3] { closed = true; }
	}
	#endregion

	#region Slot value
	if(_tp != 0) {
		var opt_subtype = _slot_type == 1 ? opt_params : opt_modifiers;
		selected[2] = scr_window_list_selector( selected[2], lf, tp + 144 * cm, opt_subtype[_tp], 3, _in_wd);
	}
	#endregion
}
#endregion

#region Share Info
with(obj_spell_controller) {
	sl_spell_type = other.spell_type - 1;
	
	for(var i = 0; i < 3; i++) {
		selected[i] = other.selected[i] - 1;
	}
}
#endregion