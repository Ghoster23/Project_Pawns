///@description Insert a parametere/modifier in a spell slot
///@param spell_id		(ds_map id)
{
if(ds_exists(argument0, ds_type_map)) {
	var _slot = argument0;
	
		
	_slot[? "In"] = -1;
	return 1;
}

show_debug_message("Spell slot not found.");
return 0;
}