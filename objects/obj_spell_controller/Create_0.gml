/// @description Spell System Controller

#region Parameter
param_base = ds_map_create();

ds_map_add(param_base,  "Type", param_type.none);
ds_map_add(param_base, "Value",              -1);
ds_map_add(param_base,  "Mods",               0);
ds_map_add(param_base,     "x",               0);
ds_map_add(param_base,     "y",               0);
ds_map_add(param_base, "Angle",               0);
#endregion

#region Modifier
modifier_base = ds_map_create();

ds_map_add(modifier_base,  "Type", param_type.none);
ds_map_add(modifier_base, "Value",              -1);
ds_map_add(modifier_base, "Level",               0);
ds_map_add(modifier_base,     "x",               0);
ds_map_add(modifier_base,     "y",               0);
ds_map_add(modifier_base, "Angle",               0);
#endregion