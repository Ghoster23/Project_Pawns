///@description Insert a parametere/modifier in a spell slot
///@param slot_id		(ds_map id)
///@param insert_id		(ds_map id)
{
// If slot exists
if(ds_exists(argument0, ds_type_map)) {
	var _slot = argument0;
	
	// If spell element exists
	if(ds_exists(argument1, ds_type_map)) {
		var _insert = argument1;
		
		if(_slot[? "State"] == spell_slot_states.free) {
			_slot[? "In"]    = _insert;
			_slot[? "State"] = spell_slot_states.occupied;
			return 1;
		}else {
			show_debug_message("Spell slot not free.")
			return 0;
		}
	}
	
	show_debug_message("Spell element to insert not found.");
	return 0;
}

show_debug_message("Spell slot not found.");
return 0;
}