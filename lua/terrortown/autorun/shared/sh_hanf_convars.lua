CreateConVar("ttt_hanfei_hp", 150, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "How much hp gets the player")

CreateConVar("ttt_hanfei_armor", 50, {FCVAR_NOTIFY, FCVAR_ARCHIVE},"How much armor gets the player")

CreateConVar("ttt_hanfei_exposetime", 60, {FCVAR_NOTIFY, FCVAR_ARCHIVE},"How much exposetime gets the player")

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_hanfei_convars", function(tbl)
	tbl[ROLE_HANFEI] = tbl[ROLE_HANFEI] or {}

	table.insert(tbl[ROLE_HANFEI], {cvar = "ttt_hanfei_hp", slider = true, min = 0, max = 500, decimal = 0,desc = "ttt_hanfei_hp (def. 150)"})
	table.insert(tbl[ROLE_HANFEI], {cvar = "ttt_hanfei_armor", slider = true, min = 0, max = 500, decimal = 0, desc = "ttt_hanfei_armor (def. 50)"})
	table.insert(tbl[ROLE_HANFEI], {cvar = "ttt_hanfei_exposetime", slider = true, min = 0, max = 120, decimal = 0, desc = "ttt_hanfei_exposetime (def. 60)"})
end)