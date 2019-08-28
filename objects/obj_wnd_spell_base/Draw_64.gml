// Inherit the parent event
event_inherited();

var cx = x1 + (x2 - x1) / 2; // X of the center of the window
var cy = y1 + (y2 - y1) / 2; // Y of the center of the window

/// Draw the spell circle
#region Outer frame
draw_sprite(spr_spell_base, 0, cx, cy);
#endregion

#region Elements
var slot_count = param_slot_count + modifier_slot_count;

for(var i = 0; i < slot_count; i++) {
	var slot_type = i < param_slot_count ? 0 : 1;
	var slot = slot_type == spell_element.parameter ? param_slots[i] : modifier_slots[i - param_slot_count];
	
	var state = slot[? "State"];
	
	switch(state) {
		default:
		break;
		
		case "Free":
			#region Obligatory Slots
			var _forced_type    = slot[? "Type"];
			var _forced_subtype = slot[? "Sub Type"];
			
			if(_forced_subtype != -1) {
				switch(_forced_type) {
					case spell_element.parameter:
					draw_sprite_ext(spr_spell_param_frame, _forced_subtype, cx + slot[? "XO"], cy + slot[? "YO"], 1, 1, slot[? "Angle"], c_white, 1);
					break;
					
					case spell_element.modifier:
					break;
				}
			}
			#endregion
		break;
		
		case "Insert":
			//FIXME Visual transition
		break;
		
		case "Change":
			//FIXME Visual transition (Clear + Insert)
		break;
		
		case "Occupied":
			#region
			var element = slot[? "In"];
			
			var xo = slot[?    "XO"];
			var yo = slot[?    "YO"];
			var an = slot[? "Angle"];
			
			if(slot_type == spell_element.parameter) {
				slot[? "In"] = scr_spell_parameter_draw( element, cx + xo, cy + yo, image_angle + an);
				
				param_draw_aux = [ i, slot, element]; // Used for passing info to user event
				event_user(0); // Event that draws spell type specific parts
			}else
			if(slot_type == spell_element.modifier) {
				slot[? "In"] = scr_spell_modifier_draw(  element, cx + xo, cy + yo, image_angle + an);
				
				modifier_draw_aux = [ i, slot, element]; // Used for passing info to user event
				event_user(1); // Event that draws spell type specific parts
			}
			#endregion
		break;
		
		case "Clear":
			//FIXME Visual Transition
		break;
	}
	
	#region Highlight
	if(slot[? "Highlight"]) {
		scr_spell_slot_draw(slot, cx, cy, 0); //FIXME Make something better
			
		// FIXME - Should work like a button and give feedback on hover
		var radius = slot_type == spell_element.parameter ? 16 : 8;
			
		// Select slot
		if(scr_clicked_in(cx - radius, cy - radius, cx + radius, cy + radius)) {
			with(obj_spell_controller) {
				sl_slot = slot;
			}
		}
	}
	#endregion
}
#endregion