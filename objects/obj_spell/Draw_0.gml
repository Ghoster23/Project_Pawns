/// @description Draw the spell circle
#region Outer frame
draw_circle( x, y, cell_size * 12, true);
draw_circle( x, y, cell_size * 11, true);
#endregion

#region Body
#region Elemental Parameter
// Draw parameter frame
draw_sprite(spr_spell_param_frame, param_type.elemental, x, y);

// Draw parameter
draw_sprite(spr_spell_param_element, elem_param, x, y);
#endregion

for(var i = 0; i < param_count; i++) {
	var ang = param_angle_start + i * param_angle;
	
	var xx = floor(x + 0.5 + lengthdir_x( param_orbit_radius, ang));
	var yy = floor(y + 0.5 + lengthdir_y( param_orbit_radius, ang));
	
	#region Parameter
	// Draw parameter frame
	draw_sprite_ext(spr_spell_param_frame,     param_types[i], xx, yy, 1, 1, ang, c_white, 1);

	// Draw parameter
	var spr = (param_types[i] == param_type.target ? spr_spell_param_target : spr_spell_param_enact);
	draw_sprite_ext(                                    spr,     param_value[i], xx, yy, 1, 1, ang, c_white, 1);
	#endregion
	
	#region Modifiers
	var mods = modifiers[i];
	
	var len = array_length_1d(mods);
	
	for(var j = 0; j < len; j++) {
		
	}
	#endregion
}
#endregion