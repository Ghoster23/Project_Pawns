///@description Creates a spell slot
{
var _slot = ds_map_create();

ds_map_add(_slot,        "In",      -1);
ds_map_add(_slot,        "XO",       0);
ds_map_add(_slot,        "YO",       0);
ds_map_add(_slot,     "Angle",       0);
ds_map_add(_slot,      "Type",      -1);
ds_map_add(_slot,  "Sub Type",      -1);
ds_map_add(_slot,     "State",  "Free");
ds_map_add(_slot, "Collision",      []);
ds_map_add(_slot, "Highlight",   false);
ds_map_add(_slot,      "Data",       0);

return _slot;
}