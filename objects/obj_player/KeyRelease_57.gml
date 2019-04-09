//test spell
var type         = spell_type.evocation;

var p1_m1 = [target_mod.right,3];
var p1 = [target_param.line, 1, [p1_m1]];

var p2 = [];
var p3 = [];

scr_spell_cast([type, 3, 
				[[param_type.target,p1],[param_type.enact,p2],[param_type.conclude,p3]]]);