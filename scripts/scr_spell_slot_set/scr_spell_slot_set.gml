///@description Sets a spell slot's attributes
///@param id		(ds_map id)
///@param in		(ds_map id)
///@param x_offset	(x to add to the spell's x to draw)
///@param y_offset	(y to add to the spell's y to draw)
///@param angle		(angle to draw at)
///@param type		( 0 - parameter, 1 - modifier)
{
if(ds_exists(argument0, ds_type_map)) {
	var _slot = argument0;
	
	if(argument1 != undefined) _slot[?    "In"] = argument1;
	if(argument2 != undefined) _slot[?    "XO"] = argument2;
	if(argument3 != undefined) _slot[?    "YO"] = argument3;
	if(argument4 != undefined) _slot[? "Angle"] = argument4;
	if(argument5 != undefined) _slot[?  "Type"] = argument5;
}
}