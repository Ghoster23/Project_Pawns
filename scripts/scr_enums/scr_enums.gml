enum property {
	flammable,
	hydrophobic,
	heavy,
	light,
	floating,
	count
}

enum status {
	burn,
	wet,
	eletric,
	decay,
	cripple,
	count
}

enum tile_type {
	none,
	dirt,
	grass,
	stone,
	metal,
	water
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
	elemental
}

enum target_param {
	line,
	aoe,//TODO Maybe rethink this one
	touch,
	wall
	//Consider how you'd add seeking
}

enum target_mod {
	range,
	await
	//Maybe add a 'await' target -> consider how to make triggers
}

enum enact_param {
	create,
	destroy,
	kinesis
}

enum elemental_param {
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

enum fluid {
	water,
	oil,
	count
}