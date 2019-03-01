// Inherit the parent event
event_inherited();

#region End Turn
if(global.turn == id){
	if(act != 2 and move != 2){
		global.turn = noone;
	}
}

offs = z;
#endregion