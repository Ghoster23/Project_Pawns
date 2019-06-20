enum key_id {
	/* - Movement - */
	right,
	down,
	left,
	up,
	
	l_click,
	r_click,
	
	/* - Short cuts Keys - */
	menu,
	
	/* - Menu keys - */
	m_confirm,
	m_right,
	m_down,
	m_left,
	m_up,
	m_click,
	
	count
}

for(var i = 0; i < key_id.count; i++){
	global.key_binds[i]  = -1;
	global.key_active[i] = false;
}

//Game Keys
global.key_binds[key_id.right] = ord("A");
global.key_binds[key_id.up]    = ord("W");
global.key_binds[key_id.down]  = ord("S");
global.key_binds[key_id.left]  = ord("D");

global.key_binds[key_id.l_click] = mb_left;
global.key_binds[key_id.r_click]  = mb_right;

//Menu Keys
global.key_binds[key_id.m_confirm] = vk_enter;
global.key_binds[key_id.m_right]   = vk_right;
global.key_binds[key_id.m_down]    = vk_down;
global.key_binds[key_id.m_left]    = vk_left;
global.key_binds[key_id.m_up]      = vk_up;
global.key_binds[key_id.m_click]   = mb_left;
global.key_binds[key_id.menu]      = vk_escape;