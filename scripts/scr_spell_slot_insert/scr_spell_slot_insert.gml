///@description Insert a parametere/modifier in a spell slot
///@param spell_id		(ds_map id)
///@param insert_id		(ds_map id)
{
if(ds_exists(argument0, ds_type_map)) {
	var _slot = argument0;
	
	if(ds_exists(argument1, ds_type_map)) {
		var _insert = argument1;
		
		_slot[? "In"] = _insert;
		return 1;
	}
	
	show_debug_message("Parameter/Modifier to insert not found.");
	return 0;
}

show_debug_message("Spell slot not found.");
return 0;
}