draw_text(0,0,"Turn: " + string(turn_counter));

if(global.turn != noone){
	draw_text(0,32,"Pawn: " + string(global.turn) + " " + object_get_name(global.turn.object_index));

	if(instance_exists(global.turn)){
		draw_text(0,64,"Move: " + string(global.turn.move) + " Act: " + string(global.turn.act));
	}
}