/// @description Draw the spell circle
#region Outer frame
draw_sprite(spr_spell_base, 0, x, y);
#endregion

#region Body
#region Elemental Parameter
// Draw parameter frame
draw_sprite(spr_spell_param_frame, param_type.elemental, x, y);

// Draw parameter
var elem_param = params[0];
if(elem_param[? "Value"] != -1) { draw_sprite(spr_spell_param_element, elem_param[? "Value"], x, y); }
#endregion

var param_drawn = 0;
var i = 1;

while(param_drawn < param_count) {
	var param = params[i];
	
	if(param[? "Type"] != param_type.none) {	
		#region Parameter
		var xx = x + param[? "x"];
		var yy = y + param[? "y"];
		
		var pr_type  = param[? "Type"];
		var pr_angle = param[? "Angle"];
		
		// Draw parameter frame
		draw_sprite_ext(spr_spell_param_frame, pr_type, xx, yy, 1, 1, pr_angle, c_white, 1);

		// Draw parameter
		var spr = (pr_type == param_type.target ? spr_spell_param_target : spr_spell_param_enact);
		draw_sprite_ext(spr, param[? "Value"], xx, yy, 1, 1, pr_angle, c_white, 1);
		#endregion
	
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		#region Modifiers
		for(var j = i * 2; j < i * 2 + param[? "Mods"]; j++) {
			var prev_id = j > 0 ? j - 1 : 11;
			var prev_mods = modifiers[prev_id];
			var mods = modifiers[j];
			
			var _xx = x + mods[? "x"];
			var _yy = y + mods[? "y"];
			var _an = mods[? "Angle"] - 90;
			
			#region Draw parameters
			var _if = prev_id mod 3;
			
			var _rot = -90 * (prev_id div 3);
			#endregion
			
			draw_sprite_ext(spr_spell_modifier_frame, _if, _xx, _yy, 1, 1, _rot, c_white, 1);
			//draw_text_transformed(_xx, _yy, j, 1, 1, _an);
		}
		#endregion
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		param_drawn++;
	}
	
	i++;
}
#endregion