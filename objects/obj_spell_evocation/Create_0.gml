event_inherited();

type = spell_type.evocation;  //Type of spell

cell_size = 8;

#region Param slots init

// Mandatory Elemental slot
var slot = scr_spell_slot_create();
var elem = scr_spell_parameter_create(param_type.elemental, -1);

scr_spell_slot_set(slot, elem, 0, 0, 0, 0);

param_slots[0] = slot;

// Optional Parameters
for(var i = 1; i < 7; i++) {
	slot = scr_spell_slot_create();
	
	var ang = -60 * (i - 1);
	scr_spell_slot_set(slot, undefined, 
						floor(lengthdir_x( 64, 90 + ang)),
						floor(lengthdir_y( 64, 90 + ang)),
						ang, 0);
	
	param_slots[i] = slot;
}
#endregion

#region Modifier slots init
for(var i = 0; i < 12; i++) {
	slot = scr_spell_slot_create();
	
	var ang = 105 - 30 * i;
	scr_spell_slot_set(slot, undefined, 
						floor(lengthdir_x( 64, 90 + ang)),
						floor(lengthdir_y( 64, 90 + ang)),
						ang, 1);
	
	modifiers[i] = slot;
}
#endregion