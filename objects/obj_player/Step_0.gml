#region Moving
if(mov_trg != noone and move == 2){
	switch mov_stt {
		case 0: //Determine next step
			mov_stt = 1;
			mov_dst = point_distance(x,y,mov_nxt.x,mov_nxt.y);
			mov_spd = 3.5;
			z = 0;
		break;
		
		case 1: //Move to next tile
			if(x != mov_nxt.x or y != mov_nxt.y){
				x = scr_approach(x,mov_nxt.x,mov_spd);
				y = scr_approach(y,mov_nxt.y,mov_spd);
				
				var dist = point_distance(x,y,mov_nxt.x,mov_nxt.y);
				var perc = dist / mov_dst;
				
				if(perc < 0.3){ mov_listen = 3; }
				
				var pelv = sin(perc * pi);
				
				z = pelv * 48;				
			}else {
				mov_stt = 2;
			}
		break;
		
		case 2: //Check if arrived
			z = 0;
			
			if(mov_trg == mov_nxt){
				mov_stt = 0;     //Reset movement state
				
				//Reset AUX variables
				mov_trg = noone;
				mov_nxt = noone;
				
				mov_listen = 3;
				move       = 1;
			}else {
				mov_stt = 0;
			}
		break;
	}
}
#endregion

#region Acting
if(act_cur != -1){
	switch act_stt {
		case 0: //Initiate action
			var params = scr_action_start(act_cur);
			
			act_trgs   = params[0];
			act_params = params[1];
			
			if(act_trgs == -1){
				act_cur = -1;
			}else {
				act_stt = 1;
			}
		break;
		
		case 1: //Choose target
			
		break;
		
		case 2: //Carry out action
			scr_action_do(act_cur,act_trgs,act_params);
		break;
		
		case 3: //End action
			act = 1;
			act_stt =  0;
			act_cur = -1;
			
			ds_list_destroy(act_trgs);
			act_trgs   = -1;
			act_params = -1;
		break;
	}
}
#endregion