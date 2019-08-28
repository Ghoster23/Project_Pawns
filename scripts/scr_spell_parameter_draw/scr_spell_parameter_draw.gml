///@description Draws a spell parameter
///@param id	(ds_map id)
///@param x		(x to draw at)
///@param y		(y to draw at)
///@param angle	(angle to draw at)
{
if(ds_exists(argument0, ds_type_map)) {
	var _param = argument0;
	
	var     _x = argument1;
	var     _y = argument2;
	var _angle = argument3;
	
	var _type  = _param[? "Type"];
	var _value = _param[? "Value"];
	
	// Frame
	draw_sprite_ext(spr_spell_param_frame, _type - 1, _x, _y, 1, 1, _angle, c_white, 1);
	
	// Parameter
	var _spr = spr_spell_param_element + _type - 1;
	
	draw_sprite_ext(_spr, _value, _x, _y, 1, 1, _angle, c_white, 1);
	
	return _param;
}

return -1;
}