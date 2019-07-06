spell = instance_create_layer(room_width/2, room_height/2, layer, obj_spell);

scr_spell_set_parameter(spell, 0, param_type.elemental, elemental_param.water);

scr_spell_set_parameter(spell, 1, param_type.target, target_param.line);

scr_spell_add_modifier(spell, 1, param_type.target, target_mod.range);
scr_spell_add_modifier(spell, 1, param_type.target, target_mod.range);
scr_spell_add_modifier(spell, 1, param_type.target, target_mod.range);
scr_spell_add_modifier(spell, 1, param_type.target, target_mod.range);

scr_spell_set_parameter(spell, 4, param_type.enact, enact_param.create);

scr_spell_add_modifier(spell, 4, param_type.enact, enact_mod.time);

scr_spell_add_modifier(spell, 4, param_type.enact, enact_mod.time);