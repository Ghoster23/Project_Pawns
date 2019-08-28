/// @description Type Specific - Modifier Drawing
var i        = modifier_draw_aux[0];
var slot     = modifier_draw_aux[1];

var xo = slot[?    "XO"];
var yo = slot[?    "YO"];
var an = slot[? "Angle"];

var index = i mod 3;

draw_sprite_ext(spr_spell_modifier_frame_evocation, index, x + xo, y + yo, 1, 1, image_angle + an, c_white, 1);
exit;