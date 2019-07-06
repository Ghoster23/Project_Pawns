type = spell_type.evocation;  //Type of spell

cell_size = 8;

var param = ds_map_create();

ds_map_add(param,    "ID",               0);
ds_map_add(param,  "Type", param_type.none);
ds_map_add(param, "Value",              -1);
ds_map_add(param,  "Mods",               0);
ds_map_add(param,     "x",               0);
ds_map_add(param,     "y",               0);
ds_map_add(param, "Angle",               0);

params = [];

params[0] = ds_map_create();
ds_map_copy(params[0], param);
ds_map_set(params[0],  "Type", param_type.elemental);

for(var i = 1; i < 7; i++) {
	params[i] = ds_map_create();
	ds_map_copy(params[i], param);
	
	ds_map_set(params[i], "ID", i);
	
	var ang = -60 * (i - 1);
	ds_map_set(params[i],     "x", floor(lengthdir_x( 64, 90 + ang)));
	ds_map_set(params[i],     "y", floor(lengthdir_y( 64, 90 + ang)));
	ds_map_set(params[i], "Angle", ang);
}
gpu_get_blendmode_ext_sepalpha()
param_count = 0;
ds_map_destroy(param);

modifiers = []; //Array of modifiers

var modf = ds_map_create();

ds_map_add(modf,    "ID",               0);
ds_map_add(modf,  "Type", param_type.none);
ds_map_add(modf, "Value",              -1);
ds_map_add(modf,     "x",               0);
ds_map_add(modf,     "y",               0);
ds_map_add(modf, "Angle",               0);

for(var i = 0; i < 12; i++) {
	modifiers[i] = ds_map_create();
	ds_map_copy(modifiers[i], param);
	
	ds_map_set(modifiers[i], "ID", i);
	
	var ang = 105 - 30 * i;
	ds_map_set(modifiers[i],     "x", floor(lengthdir_x( 64, ang)));
	ds_map_set(modifiers[i],     "y", floor(lengthdir_y( 64, ang)));
	ds_map_set(modifiers[i], "Angle", ang);
}

ds_map_destroy(modf);