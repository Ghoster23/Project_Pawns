if(mov_stt == 0){
	// Inherit the parent event
	event_inherited();
}

#region End Turn
if(global.turn == id){
	if(act != 2 and move != 2){
		global.turn = noone;
	}
}

offs = z;


if(mov_listen > 0){
	image_blend = c_purple;
}else {
	image_blend = c_orange;
}
#endregion