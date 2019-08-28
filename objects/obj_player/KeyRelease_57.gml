//test spell
var type  = spell_types.evocation;

var p1_m1 = [];
var p1 = [target_param.touch, 0, [p1_m1]];

var p2 = enact_param.create;

var p3 = elemental_param.fire;

scr_spell_cast([type, 3, 
				[[param_type.target,p1],[param_type.enact,p2],[param_type.elemental,p3]]]);