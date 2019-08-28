///@description Insert a parametere/modifier in a spell slot
///@param spell_id		(ds_map id)
{
if(ds_exists(argument0, ds_type_map)) {
	var _slot = argument0;
	
	if(_slot[? "State"] == spell_slot_states.occupied){
		_slot[? "In"]    = -1;
		_slot[? "State"] = spell_slot_states.cleared;
		return 1;
	}else {
		show_debug_message("Cannot clear an unnocupied slot.")
		return 0;
	}
}

show_debug_message("Spell slot not found.");
return 0;
}