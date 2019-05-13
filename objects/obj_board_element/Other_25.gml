/// @description End of round processes
//Board element specific processes
event_perform(ev_other, ev_user14);

#region Status Effects
for(var i = 0; i < status.count; i++){
	var status_state = stu_active[i];
	
	switch status_state {
		case -1: //Can't be applyed
		break;
		
		case 0: //Inactive
		break;
			
		case 1: //Final tick
			stu_turns[i]  = 0;
				
			stu_active[i] = 0; //Go to inactive
				
			scr_status_end(i);
		break;
			
		case 2: //Step
			scr_status_step(i);
			
			stu_turns[i] = stu_turns[i] - 1;
			
			if(stu_turns[i] == 1){
				stu_active[i] = 1; //Go to final tick
			}
		break;
		
		case 3: //Spread through tiles
			scr_status_step(i);
			
			stu_turns[i]  = stu_turns[i] - 1;
			
			if(stu_turns[i] == 1){
				stu_active[i] = 1; //Go to final tick
			}else {
				stu_active[i] = 2; //Go to step
			}
		break;
		
		case 4: //Just applied
			scr_status_begin(i);
			
			stu_active[i] = 3; //Go to spread
			stu_turns[i]  = stu_turns[i] - 1;
		break;
		
		case 5: //Synch for spreading
			stu_active[i] = 4;
		break;
	}
}
#endregion