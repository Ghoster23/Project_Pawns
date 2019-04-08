caster = noone;

state = 0;

#region Target
trg_state = 0;

trg_param = []; //Array containing the target parameter

trg_lst_trgable = -1; //List of targetable tiles

targets = -1; //List of the spell's targets
#endregion

#region Enact
ena_state = 0;

ena_param = []; //Array containing the enact parameter
#endregion

#region Conclude
cnc_state = 0;

cnc_params = []; //Array containing the conclude parameter
#endregion

concluded = false; //Flag for the end of the effects

sl_tl = noone; //Selected  tile