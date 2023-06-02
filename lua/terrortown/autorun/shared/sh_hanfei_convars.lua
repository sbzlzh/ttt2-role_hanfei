--ConVar syncing
CreateConVar("ttt2_hanfei_hp", 150, { FCVAR_NOTIFY, FCVAR_ARCHIVE }, "How much hp gets the player")
CreateConVar("ttt2_hanfei_armor", 50, { FCVAR_NOTIFY, FCVAR_ARCHIVE }, "How much armor gets the player")
CreateConVar("ttt2_hanfei_exposetime", 60, { FCVAR_NOTIFY, FCVAR_ARCHIVE }, "How much exposetime gets the player")
CreateConVar("ttt2_hanfei_tracker_mode", 0, { FCVAR_NOTIFY, FCVAR_ARCHIVE }, "What type of tracking item should the HanFei start with?")

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_hanfei_convars", function(tbl)
	tbl[ROLE_HANFEI] = tbl[ROLE_HANFEI] or {}

	table.insert(tbl[ROLE_HANFEI], {
		cvar = "ttt2_hanfei_hp",
		slider = true,
		min = 0,
		max = 500,
		decimal = 0,
		desc = "ttt2_hanfei_hp (def. 150)"
	})

	table.insert(tbl[ROLE_HANFEI], {
		cvar = "ttt2_hanfei_armor",
		slider = true,
		min = 0,
		max = 500,
		decimal = 0,
		desc = "ttt2_hanfei_armor (def. 50)"
	})

	table.insert(tbl[ROLE_HANFEI], {
		cvar = "ttt2_hanfei_exposetime",
		slider = true,
		min = 0,
		max = 120,
		decimal = 0,
		desc = "ttt2_hanfei_exposetime (def. 60)"
	})

	--  # What type of tracking item should the HanFei start with?
	--  # 0: Han Fei does not spawn with a tracking device
	--  # 1: Han Fei spawns with a radar (Reveals player positions every 30 seconds)
	--  # 2: Han Fei spawns with a tracker (Reveals player positions constantly)
	table.insert(tbl[ROLE_HANFEI], {
		cvar = "ttt2_hanfei_tracker_mode",
		combobox = true,
		desc = "ttt2_hanfei_tracker_mode (Def: 0)",
		choices = {
			"0 - Han Fei does not spawn with a tracking device",
			"1 - Han Fei spawns with a radar",
			"2 - Han Fei spawns with a tracker"
		},
		numStart = 0
	})
end)

hook.Add("TTT2SyncGlobals", "AddHanFeiGlobals", function()
	SetGlobalInt("ttt2_hanfei_tracker_mode", GetConVar("ttt2_hanfei_tracker_mode"):GetInt())
end)

cvars.AddChangeCallback("ttt2_hanfei_tracker_mode", function(name, old, new)
	SetGlobalInt("ttt2_hanfei_tracker_mode", tonumber(new))
end)
