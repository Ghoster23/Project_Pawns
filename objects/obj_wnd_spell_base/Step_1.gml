// Inherit the parent event
event_inherited();

var _slot_type = selected[0];
var _type      = selected[1];
var _value     = selected[2];

var slot_count = param_slot_count + modifier_slot_count;

// Slots state machine
for(var i = 0; i < slot_count; i++) {
	var slot_type = i < param_slot_count ? 0 : 1;
	var slot = slot_type == spell_element.parameter ? param_slots[i] : modifier_slots[i - param_slot_count];
	var slot_subtype = slot[? "Sub Type"];
	
	var state = slot[? "State"];
	
	switch(state) {
		case "Free":
			#region Highlight toggle
			if(_slot_type == slot_type) {
				if(_value != -1 and (slot_subtype == -1 || _type == slot_subtype)) {
					slot[? "Highlight"] = true;
				}else {
					slot[? "Highlight"] = false;
				}
			}
			#endregion
			
			#region Go to Insert
			//This should occur in the spell system controller
			#endregion
		break;
		
		case "Blocked":
			// Transitions to/from this state should occur
			// on transitions of other slots to the insert
			// and clear states, in the controller.
		break;
		
		case "Insert":
			#region Go to Occupied
			// FIXME should only happen after visual transition
			slot[? "State"] = "Occupied";
			#endregion
		break;
		
		case "Change":
			#region Go to Occupied
			// FIXME should only happen after visual transition
			slot[? "State"] = "Occupied";
			#endregion
		break;
		
		case "Occupied":
			#region Highlight toggle
			if(_slot_type == slot_type) {
				if(_value != -1) {
					slot[? "Highlight"] = true;
				}else {
					slot[? "Highlight"] = false;
				}
			}
			#endregion
			
			#region Go to Change
			//This should occur in the spell system controller
			#endregion
			
			#region Go to Clear
			// This should occur on the spell system controller
			#endregion
		break;
		
		case "Clear":
			#region Go to Free
			// FIXME should only happen after visual transition
			slot[? "State"] = "Free";
			#endregion
		break;
	}
}