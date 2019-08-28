event_inherited();

#region Destroy Parameters
var param_count = array_length_1d(param_slots);

for(var i = 0; i < param_count; i++) {
	var slot = param_slots[i];
	
	// If slot exists
	if(slot != -1) {
		var param = slot[? "In"];
		
		// If param exists
		if(param != -1) {
			scr_spell_parameter_delete(param);
		}
		
		scr_spell_slot_delete(slot);
	}
}
#endregion

#region Destroy Modifiers
var modifier_count = array_length_1d(modifier_slots);

for(var i = 0; i < modifier_count; i++) {
	var slot = modifier_slots[i];
	
	// If slot exists
	if(slot != -1) {
		var modifier = slot[? "In"];
		
		// If param exists
		if(modifier != -1) {
			scr_spell_modifier_delete(modifier);
		}
		
		scr_spell_slot_delete(slot);
	}
}
#endregion