///@param _x1
///@param _y1
///@param _x2
///@param _y2
///@param ds_map
///@param xscale_optional
///@param yscale_optional
{
var _x1 = argument[0];
var _y1 = argument[1];
var _x2 = argument[2];
var _y2 = argument[3];

var _map = argument[4];

var _xs = 1;
if(argument_count > 5){ _xs = argument[5]; }

var _ys = 1;
if(argument_count > 6){ _ys = argument[6]; }

var _wd = _x2 - _x1;
var _h_wd = _wd / 2;

var _yy = _y1 + 8 * cm;

draw_set_color(c_white);
draw_rectangle(_x1, _y1, _x2, _y2, true);

draw_line(_x1 + _h_wd, _y1, _x1 + _h_wd, _y2);

var _vr = ds_map_find_first(_map);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
while(_vr != undefined) {
	draw_text(_x1 + 1, _yy, _vr);
	
	draw_text(_x1 + _h_wd + 1, _yy, _map[? _vr]);
	
	draw_line(_x1, _yy + 8 * cm, _x2, _yy + 8 * cm);
	
	_vr = ds_map_find_next(_map, _vr);
	_yy += 16 * cm
}
draw_set_valign(fa_top);
}