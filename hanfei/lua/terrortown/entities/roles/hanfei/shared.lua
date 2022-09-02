function ROLE:PreInitialize()
	self.color = Color(209, 43, 39, 255)

	self.abbr = "hanf"

	self.defaultTeam = TEAM_TRAITOR
	--self.defaultEquipment = TRAITOR_EQUIPMENT
	self.score.surviveBonusMultiplier = 0.5
	self.score.timelimitMultiplier = -0.5
	self.score.killsMultiplier = 2
	self.score.teamKillsMultiplier = -16
	self.score.bodyFoundMuliplier = 0
	self.fallbackTable = {}

	-- conVarData
	self.conVarData = {
		pct = 0.125,
		maximum = 1,
		minPlayers = 8,
		traitorButton = 1
	}
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_TRAITOR)
end

if SERVER then
    CreateConVar("ttt_hanfei_hp", 150, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
    CreateConVar("ttt_hanfei_armor", 100, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
	CreateConVar("ttt_hanfei_exposetime", 60, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
end

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicGAIYACVars", function(tbl)
	tbl[ROLE_HANFEI] = tbl[ROLE_HANFEI] or {}
	table.insert(tbl[ROLE_HANFEI], {cvar = "ttt_hanfei_hp", slider = true, min = 100, max = 200, decimal = 0, desc = "hp (def. 150)"})
	table.insert(tbl[ROLE_HANFEI], {cvar = "ttt_hanfei_armor", slider = true, min = 0, max = 150, decimal = 0, desc = "armor (def. 100)"})
	table.insert(tbl[ROLE_HANFEI], {cvar = "ttt_hanfei_exposetime", slider = true, min = 0, max = 600, decimal = 0, desc = "expose time (def. 60)"})
end)
-- explosion properties
local function hanfei_Explode(ply,pos)
	local dmg = 200
	local r_inner = 550
	local r_outer = r_inner * 1.15
	-- EmitSound( Sound( "weapons/jihad_bomb/big_explosion.wav" ), pos, ply:EntIndex(), CHAN_AUTO, 1, 400, 0, math.random(100, 125) )
	-- ply:EmitSound("weapons/jihad_bomb/big_explosion.wav", 400, math.random(100, 125))
	-- explosion damage
 	util.BlastDamage( ply, ply, pos, r_outer,dmg )
	-- util.BlastDamage(self, dmgowner, pos, r_outer, dmg)
	local effect = EffectData()
	effect:SetStart(pos)
	effect:SetOrigin(pos)
	effect:SetScale(r_outer)
	effect:SetRadius(r_outer)
	effect:SetMagnitude(dmg)
	util.Effect("Explosion", effect, true, true)
end

if SERVER then
	AddCSLuaFile()
	util.AddNetworkString("hanfei_expose")
	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_hanf.vmt")
	-- resource.AddFile("weapons/jihad_bomb/jihad.wav")
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		--
		ply:SetHealth(GetConVar("ttt_hanfei_hp"):GetInt())
		--ply:Give("weapon_ttt_ak57",false)
		ply:GiveEquipmentItem("item_ttt_radar")
		--ply:GiveAmmo(90,"SMG1",false)
		ply:GiveArmor(GetConVar("ttt_hanfei_armor"):GetInt())
		ply:Give("weapon_ttt_c4",false)
        --ply:Give("weapon_ttt_kraber",false)
	end
	
	hook.Add("TTT2SyncGlobals", "ttt2_hanfei_sync_convars", function()
		SetGlobalInt("ttt_hanfei_hp", GetConVar("ttt_hanfei_hp"):GetFloat())
		SetGlobalInt("ttt_hanfei_armor", GetConVar("ttt_hanfei_armor"):GetInt())
		SetGlobalInt("ttt_hanfei_exposetime", GetConVar("ttt_hanfei_exposetime"):GetInt())
	end)

	-- sync convars on change
	cvars.AddChangeCallback("ttt_hanfei_hp", function(cv, old, new)
		SetGlobalInt("ttt_hanfei_hp", tonumber(new))
	end)

	cvars.AddChangeCallback("ttt_hanfei_armor", function(cv, old, new)
		SetGlobalInt("ttt_hanfei_armor", tonumber(new))
	end)

	cvars.AddChangeCallback("ttt_hanfei_exposetime", function(cv, old, new)
		SetGlobalInt("ttt_hanfei_exposetime", tonumber(new) )
	end)
	hook.Add( "PlayerDeath", "ttt_hanfei_death", function( victim, inflictor, attacker )
		-- Only explode, if the code was completely typed in
		if victim:GetSubRole()==ROLE_HANFEI then
			local pos=victim:GetPos()
			timer.Simple(2.05, function()
				hanfei_Explode(victim,pos) 
			end)
			-- EmitSound("weapons/jihad_bomb/jihad.wav", pos,victim:EntIndex(), CHAN_AUTO, 1, math.random(100, 150), 0, math.random(95, 105) )
			victim:EmitSound("weapons/jihad_bomb/jihad.wav", math.random(100, 150), math.random(95, 105))
		end
	end)
	hook.Add("TTTBeginRound","ttt_hanfei_timer",function ()
		timer.Simple(GetConVar("ttt_hanfei_exposetime"):GetInt(), function()
			local info=""
			local flag=false
			for k,v in ipairs(player.GetAll()) do
				if v:GetSubRole()==ROLE_HANFEI then
					flag=true
					info=info .. v:Nick() .." "
					v.expose=true
					--v:SetModel("models/cso2/pm/hasanpm.mdl")
				end
			end
			if flag then
				info=info .."是本局悍匪，大家一起干翻他！"
				net.Start("hanfei_expose")
				net.WriteString(info)
				net.Broadcast()
			end
		end)
	end)
end

if CLIENT then
	net.Receive("hanfei_expose",function ()
		local info=net.ReadString()
        chat.AddText( Color( 255, 0, 0 ),info)
        chat.AddText( Color( 255, 0, 0 ),info)
        chat.AddText( Color( 255, 0, 0 ),info)
	end)
end