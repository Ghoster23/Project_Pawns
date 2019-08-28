event_inherited();

#region Spell Info
// Attributes
spell_type = -1;

// Shared Info
selected = [ -1, -1, -1]; // [ spell slot type, type, value]
#endregion

#region Spell Structure
// Slots
param_slots    = [];
modifier_slots = [];

param_slot_count    = 0;
modifier_slot_count = 0;
#endregion

#region Aux
param_draw_aux    = [];
modifier_draw_aux = [];
#endregion

#region Window Properties
title = "";

width  = sprite_get_width(spr_spell_parchment);
height = sprite_get_height(spr_spell_parchment);

closeable = false;
moveable  = true;

bar_hg = height;
#endregion