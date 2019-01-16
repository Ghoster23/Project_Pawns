if argument0 == "keyboard"{
	var newkey = keyboard_lastkey;
}
else if argument0 == "mouse"{
	var newkey = mouse_lastbutton;
}

switch state{
	case "up_key":
		global.key_binds[key_id.up]=newkey;
		break;
	
	case "left_key":
		global.key_binds[key_id.left]=newkey;
		break;
		
	case "down_key":
		global.key_binds[key_id.down]=newkey;
		break;
		
	case "right_key":
		global.key_binds[key_id.right]=newkey;
		break;
		
	case "attack_key":
		global.key_binds[key_id.move]=newkey;
		break;
		
	case "mouse_r":
		global.key_binds[key_id.act]=newkey;
		break;
		
	case "enter_key":
		global.key_binds[key_id.m_confirm]=newkey;
		break;
		
	case "menu_key":
		global.key_binds[key_id.menu]=newkey;
		break;
}

