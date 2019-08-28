/// @description Spell System Controller
state = 0;

// Selection
selector = noone;
spell    = noone;

sl_spell_type    = -1;
spell_window_ids = [obj_wnd_spell_evocation];

selected = [ -1, -1, -1]; // [ spell_element_type, type, value] - eg. [ param, elemental, light]

sl_slot = -1;

// Visuals
spell_base_WD = sprite_get_width(spr_spell_parchment);
spell_base_HG = sprite_get_height(spr_spell_parchment);