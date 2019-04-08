enum status {
	burn,
	wet,
	eletric,
	decay
}

enum action {
	burn,
	smash
}

enum spell_type {
	evocation
}

enum param_type {
	target,
	enact,
	conclude
}

enum target_param {
	line,
	aoe,//TODO Maybe rethink this one
	touch,
	me,
	wall
	//Consider how you'd add seeking
}

enum target_mod {
	front,
	right,
	back,
	left,
	cardinal,
	omnidir
	//Maybe add a 'await' target -> consider how to make triggers
}

enum enact_param {
	air,
	dark,
	earth,
	fire,
	light,
	water	
}

enum conclude_param {
	none
}