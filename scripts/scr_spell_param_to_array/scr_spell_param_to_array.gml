//@description Returns an array containing the parameter information
//@argument spell_parameter_object
{
var obj = argument0;

var param = [];

param[0] = obj.value;
param[1] = obj.modifier_count;

var mods = [];

for(var i = 0; i < param[1]; i++){
	mods[i] = [obj.modifier_type[i],obj.modifier_value[i]];
}

param[2] = mods;

return param;
}