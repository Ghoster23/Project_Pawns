{
#region Window
draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_color(c_black);
draw_rectangle(x1, y1, x2, y2, true);
#endregion

draw_line(x1, y1 + bar_hg * cm, x2, y1 + bar_hg * cm);

draw_set_color(c_white);

draw_set_font(font);
}