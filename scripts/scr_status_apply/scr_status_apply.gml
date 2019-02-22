///@argument inst_id
///@argument status_id
///@argument turn_count
{
var iid = argument0;
var sid = argument1;
var trc = argument2;

if(is_descended(iid.object_index,obj_piece_parent) or
   is_descended(iid.object_index,obj_tile)){
	
	with iid {
		var status_state = stu_active[sid];
		
		switch status_state {
			case 0: //Inactive
				stu_active[sid] = 3;
				stu_turns[sid]  = trc;
			break;
			
			case 1: //About to end
				stu_active[sid] = 2;
				stu_turns[sid]  = trc + 1;
			break;
			
			case 2: //Step
				stu_active[sid]  = 2;
				stu_turns[sid]  += trc;
			break;
			
			case 3: //Just applyed
				stu_turns[sid] += trc;
			break;
			
			case 4: //Can't be applyed
			break;
		}
	}
}
}