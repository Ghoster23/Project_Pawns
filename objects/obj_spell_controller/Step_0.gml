/// @description Execute state
switch state {
	// Idle
	case 0:
		
	break;
	
	// Creating
	case 1:
		#region Spell Type
		// If a spell type has been selected
		if(sl_spell_type != -1 and spell == noone) {
			
			#region No spell is in the making
			if(spell == noone or not instance_exists(spell)) {
				// Make the new spell window
				var spell_wnd = spell_window_ids[sl_spell_type]; // Get the spell window id for that type
				
				spell = scr_window_create(spell_wnd, scr_wnd_st_spell_init, 
											global.gui_WD / 2 - spell_base_WD / 2,
											global.gui_HG / 2 - spell_base_HG / 2);
			}
			#endregion
			
			#region A spell is being made
			else {
				// The spell type doesn't match
				if(spell.spell_type != sl_spell_type) {
					instance_destroy(spell); // Terminate the spell window
					
					// Make the new spell window
					var spell_wnd = spell_window_ids[sl_spell_type]; // Get the spell window id for that type
				
					spell = scr_window_create(spell_wnd, scr_wnd_st_tkg_init, global.gui_WD / 2, global.gui_HG / 2);
				}
			}
			#endregion
		}
		
		// If spell type is unselected and a spell is being made
		if(sl_spell_type == -1 and spell != noone) {
			with(spell) {
				scr_window_close();
			}
			
			spell = noone;
		}
		#endregion
		
		#region Slot
		// If a slot is selected
		if(sl_slot != -1 and ds_exists(sl_slot, ds_type_map)) {
			var _slot_type = selected[0];
			var _type      = selected[1];
			var _value     = selected[2];
			
			var element = sl_slot[? "In"];
				
			// Slot is empty
			if(element == -1 or not ds_exists(element, ds_type_map)) {				
				// Make spell element
				switch(_slot_type) {
					case spell_element.parameter:
						element = scr_spell_parameter_create( _type, _value);
					break;
					
					case spell_element.modifier:
						element = scr_spell_modifier_create( _type, _value, 0);
					break;
					
					default:
					break;
				}
				
				// Insert it in the slot
				scr_spell_slot_insert(spell, _in);
			}
			else {
				var _in = sl_slot[? "In"]; // Get slotted
					
				// Slotted type matches
				if(_in[? "Type"] == _type) {
						
					switch(_slot_type) {
						case spell_element.parameter:
							scr_spell_parameter_set( _in, _type, _value);
						break;
							
						case spell_element.modifier:
							
						break;
							
						default:
						break;
					}
				}
			}
		}
		
		sl_slot = -1;
		#endregion
	break;
}