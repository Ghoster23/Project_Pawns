///@description Draws a spell modifier
///@param id	(ds_map id)
///@param x		(x to draw at)
///@param y		(y to draw at)
///@param angle	(angle to draw at)
{
if(ds_exists(argument0, ds_type_map)) {
	var _modifier = argument0;
	
	var     _x = argument1;
	var     _y = argument2;
	var _angle = argument3;
	
	var _type  = _modifier[? "Type"];
	var _value = _modifier[? "Value"];
	
	// Frame
	draw_sprite_ext(spr_spell_modifier_frame_base, 0, _x, _y, 1, 1, _angle, c_white, 1);
	
	// Parameter
	var _spr = spr_spell_modifier_element + _type;
	
	draw_sprite_ext(_spr, _value, _x, _y, 1, 1, _angle, c_white, 1);
	
	return _modifier;
}

return -1;
}