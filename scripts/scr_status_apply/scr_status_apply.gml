///@argument inst_id
///@argument status_id
///@argument turn_count
{
var iid = argument0;
var sid = argument1;
var trc = argument2;

if(is_descended(iid.object_index,obj_board_element)){
	with iid {
		var status_state = stu_active[sid];
		
		switch status_state {
			case -1:
			break;
			
			case 0: //Inactive
				#region Status interactions and checks
				switch sid {
					default:
					break;
					
					case status.burn:
						if(stu_turns[status.wet] > 0){
							stu_turns[status.wet]  -= trc;
							
							if(stu_turns[status.wet] <= 0){
								stu_turns[status.wet]  = 0;
								stu_active[status.wet] = 0;
							}else if(stu_turns[status.wet] == 1){
								stu_active[status.wet] = 1;
							}
							return;
						}
						
						if(not scr_has_property(id, property.flammable)) {
							return;
						}
						
						trc = max_hp;
					break;
					
					case status.wet:
						if(stu_turns[status.burn] > 0){
							stu_active[status.burn] = 0;
							stu_turns[status.burn]  = 0;
							return;
						}
					break;
					
					case status.decay:
					break;
					
					case status.eletric:
					break;
				}
				#endregion
				
				stu_active[sid] =   4;
				stu_turns[sid]  = trc;
			break;
			
			case 1: //About to end
			case 2: //Step
				stu_active[sid]  =   2;
				stu_turns[sid]  += trc;
			break;
			
			case 3: //Spread through tiles
			case 4: //Just applyed
			case 5: //Synch
				stu_turns[sid] = min(trc, stu_turns[sid]);
			break;
		}
	}
}
}