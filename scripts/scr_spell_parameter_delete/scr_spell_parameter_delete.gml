///@description Deletes a spell parameter
///@param id	(ds_map id)
{
// If the parameter exists
if(ds_exists(argument0, ds_type_map)) {
	
	#region Clear mods
	var _mods = argument0[? "Mods"];
	
	// If the list of modifiers exists
	if(ds_exists(_mods, ds_type_list)) {
		
		// Clear the list of modifiers
		while(_mods[| 0] != undefined) {
			var _mod = _mods[| 0];
			ds_list_delete(_mods, 0);
			
			scr_spell_modifier_delete(_mod);
		}
		
		// Destroy the list
		ds_list_destroy(_mods);
	}
	#endregion
	
	// Destroy the parameter ds_map
	ds_map_destroy(argument0);
}
}