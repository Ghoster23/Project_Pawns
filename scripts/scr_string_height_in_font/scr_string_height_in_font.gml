///@param string
///@param font
{
var res = 0;

var cur = draw_get_font();

draw_set_font(argument1);
res = string_height(argument0);
draw_set_font(cur);

return res;
}