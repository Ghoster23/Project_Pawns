event_inherited();

spell_type = spell_types.evocation;  //Type of spell

#region Param slots init

// Mandatory Elemental slot
var slot = scr_spell_slot_create();

scr_spell_slot_set(slot, undefined, 0, 0, 0,
					spell_element.parameter, param_type.elemental, "Free", undefined);

param_slots[0] = slot;

// Optional Parameters
for(var i = 1; i < 7; i++) {
	slot = scr_spell_slot_create();
	
	var ang = -60 * (i - 1);
	var col = (i - 1) * 2;
	scr_spell_slot_set(slot, undefined, 
						floor(lengthdir_x( 64, 90 + ang)),
						floor(lengthdir_y( 64, 90 + ang)),
						ang, spell_element.parameter, undefined, "Free", [ col, col + 1]);
	
	param_slots[i] = slot;
}

param_slot_count = 7;
#endregion

#region Modifier slots init
for(var i = 0; i < 12; i++) {
	slot = scr_spell_slot_create();
	
	var ang = 105 - 30 * i;
	var col = i div 2 + 1;
	scr_spell_slot_set(slot, undefined, 
						floor(lengthdir_x( 64, 90 + ang)),
						floor(lengthdir_y( 64, 90 + ang)),
						ang, spell_element.modifier, undefined, "Free", [col]);
	
	modifier_slots[i] = slot;
}

modifier_slot_count = 12;
#endregion