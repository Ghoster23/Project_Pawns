#region Update vars
sc_wd = width  * cm;
sc_hg = height * cm;

x1 = x;
y1 = y;

x2 = x + sc_wd;
y2 = y + sc_hg;

sc_margin = margin * cm;

rg = x2 - sc_margin;
tp = y1 + sc_margin + bar_hg * cm;
lf = x1 + sc_margin;
bt = y2 - sc_margin;
#endregion