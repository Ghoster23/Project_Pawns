#region Clean Parameters
for(var i = 0; i < max_param_count; i++) {
	var p = params[i];
	
	if(p != -1) {
		scr_spell_parameter_delete(p);
	}
}
#endregion