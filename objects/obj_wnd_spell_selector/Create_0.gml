event_inherited();

width  = 200;
height = 200;

moveable  = false;
closeable = false;

title = "Selector";

lst_spell_types = ["None", "Evocation"];
lst_slot_types  = ["None", "Parameter", "Modifier"];

lst_params    = ["None", "Elemental", "Target", "Enact"];
lst_modifiers = ["None", "Target", "Enact"];

opt_types = [[], lst_params, lst_modifiers];

lst_elemental = ["None", "Light", "Air", "Water", "Earth", "Fire", "Dark"];
lst_target    = ["None", "Line", "AoE", "Touch", "Wall"];
lst_enact     = ["None", "Create", "Destroy", "Kinesis"];

opt_params = [[], lst_elemental, lst_target, lst_enact];

lst_target_mods = ["None", "Range", "Await"];
lst_enact_mods  = ["None", "???"];

opt_modifiers = [[], lst_target_mods, lst_enact_mods];

spell_type = 0;
selected   = [ 0, 0, 0];

scr_window_list_selector_init(4);