///@description Tile specific end of turn processes
#region Spread status
for(var i = 0; i < status.count; i++){
	if(i == status.burn){
		var status_state = stu_active[i];
		
		if(0 < status_state and status_state <= 3){
			#region To pawn
			if(not free){
				var pn = global.dg_objs[# cl_x, cl_y];
			
				if(not is_undefined(pn) and pn.piece_type == 1 and not scr_status_active(pn, i)){
					if(not scr_has_property(pn, property.floating)){ //Can't spread if not in contact
						scr_status_apply(pn, i, stu_turns[i]);
					}
				}
			}
			#endregion
		
			if(status_state == 3){
				#region To adjacent tiles
			for(var j = 0; j < 4; j++){
				var tl = adj[j * 2];
			
				if(tl != noone and not scr_status_active(tl, i)){
					scr_status_apply(tl, i, stu_turns[i] + 1);
				
					if(j == 0 or j == 3){
						with tl {
							scr_status_begin(i);
			
							stu_active[i] = 3; //Go to spread
							stu_turns[i]  = stu_turns[i] - 1;
						}
					}
				}
			}
			#endregion
			}
		}
	}
}
#endregion