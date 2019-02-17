#region Transperancy
if(cl_y > 0){
	var inst = global.dg_objs[# cl_x, cl_y - 1];
	
	if(inst != noone){
		if(is_descended(inst.object_index, obj_pawn_parent)){
			image_alpha = 0.5;
		}else {
			image_alpha = 1;
		}
	}else {
		image_alpha = 1;
	}
}else {
	image_alpha = 1;
}
#endregion