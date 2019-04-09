///@description Creates a spell cast from a spell array
///@param spell_array
{
var spell_ar = argument0;

var type = spell_ar[0];

var pr_count = spell_ar[1];

var params = spell_ar[2];

var spell;

switch type {
	case spell_type.evocation:
		spell = instance_create_layer(x,y,"Instances",obj_spell_evocation);
	break;
}

for(var i = 0; i < pr_count; i ++){
	var param = params[i];
	
	switch param[0] {
		case param_type.target:
			spell.trg_param = param[1];
		break;
		
		case param_type.enact:
			spell.ena_param = param[1];
		break;
		
		case param_type.conclude:
			spell.cnc_param = param[1];
		break;
	}
}

spell.caster = id;

return spell;
}