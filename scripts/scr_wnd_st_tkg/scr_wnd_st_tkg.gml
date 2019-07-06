{
#region Window
scr_9SB_ext(spr_HUD_9SB, x1, y1, x2, y2, cm, cm);
#endregion

draw_set_color(c_white);
draw_line(x1 + 12 * cm, y1 + bar_hg * cm, x2 - 12 * cm, y1 + bar_hg * cm);

draw_set_font(font);
}