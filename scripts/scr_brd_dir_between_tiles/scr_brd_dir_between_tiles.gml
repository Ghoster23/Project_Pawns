///@description returns the direction between 2 tiles
{
var tl1 = argument0;
var tl2 = argument1;

var dx = tl2.x - tl1.x;
var dy = tl2.y - tl1.y;

var res = -1;

if(dx == 0){
	if(dy < 0){
		res = 0;
	}else {
		res = 4;
	}
}else if(dx < 0){
	if(dy == 0){
		res = 6;
	}else if(dy < 0){
		res = 7;
	}else {
		res = 5;
	}
}else {
	if(dy == 0){
		res = 2;
	}else if(dy < 0){
		res = 1;
	}else {
		res = 3;
	}
}

return res;
}