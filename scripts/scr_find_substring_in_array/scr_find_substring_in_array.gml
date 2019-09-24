///@description Returns an array of strings that contain a given substring from another array
///@argument string_array
///@argument substring
{
var _array  = argument0;
var _substr = argument1;

var _found = [];
var _count =  0;

var _len = array_length_1d(_array);

for(var i = 0; i < _len; i++) {
	var _str = _array[i];
	
	if(string_pos(_substr, _str) != 0) {
		_found[_count] = _str;
		_count++;
	}
}

return _found;
}