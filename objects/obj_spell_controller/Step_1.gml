/// @description State Machine
switch state {
	// Idle
	case 0:
		if(global.key_active[key_id.menu] and alarm[0] == -1) {
			state    = 1;
			alarm[0] = 5;
			
			selector = scr_window_create(obj_wnd_spell_selector, scr_wnd_st_tkg_init, 8, 8);
		}
	break;
	
	// Creating
	case 1:
		#region Close Spell Creation
		if(global.key_active[key_id.menu] and alarm[0] == -1) {
			state    = 0;
			alarm[0] = 5;
			
			if(selector != noone) {
				if(instance_exists(selector)) {
					instance_destroy(selector);
				}
				
				selector = noone;
			}
			
			if(spell != noone) {
				if(instance_exists(spell)) {
					instance_destroy(spell);
				}
				
				spell = noone;
			}
			
			sl_spell_type = -1;
			
			selected = [ -1, -1, -1];
			
			exit;
		}
		#endregion
		
		#region Share info
		//Send current selected values to spell
		with(spell) {
			selected = other.selected;
		}
		#endregion
	break;
}