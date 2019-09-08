// Inherit the parent event
event_inherited();

if(closed){ exit; }

var hg = sc_hg;
var wd = sc_wd;

var iwd = rg - lf;
var ihg = bt - tp;

var bttn_y  = tp;
var bttn_hg = 24 * cm;

fullscreen = scr_window_button( lf, bttn_y, rg, bttn_hg, );