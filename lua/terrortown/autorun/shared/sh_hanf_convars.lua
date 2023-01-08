CreateConVar("ttt_hanfei_hp", 150, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "How much hp gets the player")

CreateConVar("ttt_hanfei_armor", 50, {FCVAR_NOTIFY, FCVAR_ARCHIVE},"How much armor gets the player")

CreateConVar("ttt_hanfei_exposetime", 60, {FCVAR_NOTIFY, FCVAR_ARCHIVE},"How much exposetime gets the player")

if CLIENT then
    -- Use string or string.format("%.f",<steamid64>) 
    -- addon dev emblem in scoreboard
    hook.Add("TTT2FinishedLoading", "TTT2RegistermexikoediAddonDev", function()
        AddTTT2AddonDev("76561199046379906")
		AddTTT2AddonDev("76561198444795757")
		
    end)
end