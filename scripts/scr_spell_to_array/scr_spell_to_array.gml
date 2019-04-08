//@description Returns an array containing the spell information
//@argument spell_object
{
var obj = argument0;

var spell = [];

spell[0] = obj.type;
spell[1] = obj.param_count;

var params = [];

for(var i = 0; i < spell[1]; i++){
	params[i] = [obj.param_type[i],scr_spell_param_to_array(obj.param_value[i])];
}

spell[2] = params;

return spell;
}