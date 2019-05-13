if(move == 2 and mov_trg == noone){
	event_perform(ev_other, ev_user0);
	
	var cnt = ds_list_size(mov_list);
	
	var ind = irandom(cnt - 1);
	
	if(ind != 0){
		mov_trg = ds_list_find_value(mov_list, ind);
	
		mov_path = scr_piece_make_path(tile, mov_trg, mov_path);
	}else {
		move = 1;
	}
}