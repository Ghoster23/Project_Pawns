type = spell_type.evocation;  //Type of spell

cell_size = 8;

elem_param = 0;

param_count = 0;  //Count of the parameters
param_types = [];  //Array of the parameter types
param_value = [];  //Array of the spells parameters

param_orbit_radius = cell_size * 8;
param_radius           = cell_size * 4;

param_angle_start = 90;
param_angle           = 360 / max( 0, param_count);

modifiers = []; //Array of modifier arrays

mod_radius = cell_size * 2;

mod_angle_start = 90 - 360/24;
mod_angle           = 360/12;