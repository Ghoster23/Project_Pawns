{
var i_index = 0;
	
var u   = adj[0]; // up
var ur = adj[1]; // up-right
var r   = adj[2]; // right
var dr = adj[3]; // down-right
var d  = adj[4]; // down
var dl = adj[5]; // down-left
var l   = adj[6]; // left
var ul = adj[7]; // up-left
    
// Check adjacent side existence
	
//up
if (u != noone and u.type == type) u = 1;
	
//right
if (r != noone and r.type == type) r = 2;
	
//down
if (d != noone and d.type == type) d = 4;
	
//left
if (l != noone and l.type == type) l = 8;
	
// Check corner existence
	
//up left
if (ul != noone and ul.type == type) ul = 1;
	
//up right
if (ur != noone and ur.type == type) ur = 2;
	
//down right
if (dr != noone and dr.type == type) dr = 4;
	
//down left
if (dl != noone and dl.type == type) dl = 8;
    
var edges   = u + r + d + l;
var corners = 0;

if (u && l) corners += ul;    
if (u && r) corners += ur;
if (d && r) corners += dr;
if (d && l) corners += dl;
    
switch(edges)
{
    case 0: i_index = 0; break;
    case 1: i_index = 1; break;
    case 2: i_index = 2; break;
    case 3:
        switch(corners)
        {
            case 0: i_index = 3; break;
            case 2: i_index = 4; break;
        }
    break;
    case 4: i_index = 5; break;
    case 5: i_index = 6; break;
    case 6:
        switch(corners)
        {
            case 0: i_index = 7; break;
            case 4: i_index = 8; break;
        }
    break;
    case 7:
        switch(corners)
        {
            case 0: i_index = 9; break;
            case 2: i_index = 10; break;
            case 4: i_index = 11; break;
            case 6: i_index = 12; break;
        }
    break;
    case 8: i_index = 13; break;
    case 9:
        switch(corners)
        {
            case 0: i_index = 14; break;
            case 1: i_index = 15; break;
        }
    break;
    case 10: i_index = 16; break;
    case 11:
        switch(corners)
        {
            case 0: i_index = 17; break;
            case 1: i_index = 18; break;
            case 2: i_index = 19; break;
            case 3: i_index = 20; break;
        }
    break;
    case 12:
        switch(corners)
        {
            case 0: i_index = 21; break;
            case 8: i_index = 22; break;
        }
    break;
    case 13:
        switch(corners)
        {
            case 0: i_index = 23; break;
            case 1: i_index = 24; break;
            case 8: i_index = 25; break;
            case 9: i_index = 26; break;
        }
    break;
    case 14:
        switch(corners)
        {
            case 0: i_index = 27; break;
            case 4: i_index = 28; break;
            case 8: i_index = 29; break;
            case 12: i_index = 30; break;
        }
    break;
    case 15:
        switch(corners)
        {
            case 0: i_index = 31; break;
            case 1: i_index = 32; break;
            case 2: i_index = 33; break;
            case 3: i_index = 34; break;
            case 4: i_index = 35; break;
            case 5: i_index = 36; break;
            case 6: i_index = 37; break;
            case 7: i_index = 38; break;
            case 8: i_index = 39; break;
            case 9: i_index = 40; break;
            case 10: i_index = 41; break;
            case 11: i_index = 42; break;
            case 12: i_index = 43; break;
            case 13: i_index = 44; break;
            case 14: i_index = 45; break;
            case 15: i_index = 46; break;
        }
    break;
}
	
return i_index;
}