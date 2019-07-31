///@description Draws a spell slot
///@param id			(ds_map id)
///@param base_x		(x to add offset to and draw)
///@param base_y		(y to add offset to and draw)
///@param base_angle	(angle to add offset to and draw)
{
if(ds_exists(argument0, ds_type_map)) {
	var _slot = argument0;
	
	var     _x = argument1 + _slot[? "Angle"];
	var     _y = argument2 + _slot[? "XO"];
	var _angle = argument3 + _slot[? "YO"];
	
	var _spr =  spr_spell_slot;
	var _ind = _slot[? "Type"];
	
	draw_sprite_ext(_spr, _ind, _x, _y, 1, 1, _angle, c_white, 1);
}
}