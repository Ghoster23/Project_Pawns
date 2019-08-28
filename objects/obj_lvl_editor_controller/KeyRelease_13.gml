spell = instance_create_layer(room_width/2, room_height/2, layer, obj_spell_evocation);

scr_spell_set_parameter(spell, 0, param_type.elemental, elemental_param.water);

scr_spell_set_parameter(spell, 1, param_type.target, target_param.line);

scr_spell_set_parameter(spell, 4, param_type.enact, enact_param.create);