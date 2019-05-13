///@description End of turn processes
if(global.round_counter > cr_round){
	cr_round = global.round_counter;
	event_perform(ev_other, ev_user15);
}