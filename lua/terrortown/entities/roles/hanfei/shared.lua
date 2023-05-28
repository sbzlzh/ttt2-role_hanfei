if SERVER then
	AddCSLuaFile()

	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_hanf.vmt")
end

function ROLE:PreInitialize()
	self.color = Color(209, 43, 39, 255)

	self.abbr = "hanf"
	self.score.surviveBonusMultiplier = 0.5
	self.score.timelimitMultiplier = -0.5
	self.score.killsMultiplier = 2
	self.score.teamKillsMultiplier = -16
	self.score.bodyFoundMuliplier = 0

	self.defaultTeam = TEAM_TRAITOR
	self.defaultEquipment = SPECIAL_EQUIPMENT

	self.preventFindCredits = false
	self.isOmniscientRole = true

	self.conVarData = {
		pct = 0.13,
		maximum = 1,
		minPlayers = 8,
		random = 50,
		traitorButton = 1,
		togglable = true,
		credits = 2,
		creditsAwardDeadEnable = 1,
		creditsAwardKillEnable = 1,
		shopFallback = nil
	}
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_TRAITOR)
end

-- hanfei_Explode function creates an explosion that deals damage within a specified range
local function hanfei_Explode(ply, pos)
	local DMG_EXPLOSION = 350
	local R_INNER = 520
	local R_OUTER = R_INNER * 1.16

	-- Create and set explosion effect data
	local effect = EffectData()
	effect:SetStart(pos)
	effect:SetOrigin(pos)
	effect:SetScale(R_OUTER)
	effect:SetRadius(R_OUTER)
	effect:SetMagnitude(DMG_EXPLOSION)

	-- Generate explosion effect at the specified position
	util.Effect("Explosion", effect, true, true)

	-- Check all entities within the range
	local entities = ents.FindInSphere(pos, R_OUTER)

	for _, ent in ipairs(entities) do
		-- If the entity is a player and not on the same team as the player who triggered the explosion
		if ent:IsPlayer() and ent:GetTeam() ~= ply:GetTeam() then
			-- Calculate distance and damage
			local distance = pos:Distance(ent:GetPos())
			local damage = DMG_EXPLOSION * (1 - (distance / R_OUTER))

			-- Deal damage to the player
			local dmginfo = DamageInfo()
			dmginfo:SetDamage(damage)
			dmginfo:SetAttacker(ply)
			dmginfo:SetInflictor(ply)
			dmginfo:SetDamageType(DMG_BLAST)
			ent:TakeDamageInfo(dmginfo)
		end
	end
end

if SERVER then
	-- Adding loadout on role change/spawn
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		-- Assign equipment and weapons to the player
		-- If player doesn't have AK57, give AK57
		if not ply:HasWeapon("weapon_ttt_ak57") then
			ply:GiveEquipmentWeapon("weapon_ttt_ak57")
		end

		-- If player does not have C4, give C4
		if not ply:HasWeapon("weapon_ttt_c4") then
			ply:GiveEquipmentWeapon("weapon_ttt_c4")
		end

		-- Give the player extra ammo
		ply:GiveAmmo(90, "SMG1")

		-- Give the player radar equipment
		-- ply:GiveEquipmentItem("item_ttt_radar")

		-- Give the player armor and set the life value
		ply:GiveArmor(GetConVar("ttt_hanfei_armor"):GetInt())

		-- Give the player set the life value
		ply:SetHealth(GetConVar("ttt_hanfei_hp"):GetInt())
	end

	hook.Add("PlayerDeath", "ttt_hanfei_death", function(victim, inflictor, attacker)
		if victim:GetSubRole() == ROLE_HANFEI then
			local pos = victim:GetPos()

			timer.Simple(2.05, function()
				hanfei_Explode(victim, pos)
			end)

			local info = LANG.MsgAll("ttt2_hanfei_chat_exposetime", {
				playername = victim:Nick()
			}, MSG_CHAT_WARN)

			victim:EmitSound("weapons/hanfei/jihad.wav", math.random(100, 150), math.random(95, 105))
		end
	end)

	-- Set the exposure time for the hanfei role at the start of each round
	hook.Add("TTTBeginRound", "ttt_hanfei_timer", function()
		-- Get the exposure time from ConVar
		timer.Simple(GetConVar("ttt_hanfei_exposetime"):GetInt(), function()
			local flag = false
			local hanfei_players = ""

			-- Check if there is a Hanfei ROLE in the game
			for k, v in ipairs(player.GetAll()) do
				if v:GetSubRole() == ROLE_HANFEI and v:Alive() then
					flag = true
					v.expose = true
					-- Used to customize the role model, when automatically exposed will become the set model, if not set is the default model
					-- v:SetModel("models/cso2/pm/hasanpm.mdl")
					hanfei_players = hanfei_players .. v:Nick() .. ", "
				end
			end

			-- If there is a Hanfei ROLE, notify all players
			if flag then
				hanfei_players = string.sub(hanfei_players, 1, -3) -- remove the last comma and space

				-- Send the message three times
				for i = 1, 3 do
					local info = LANG.MsgAll("ttt2_hanfei_chat_reveal", {
						playername = hanfei_players
					}, MSG_CHAT_WARN)
				end
			end
		end)
	end)

	-- Remove the player's equipment and weapons when the ROLE changes or respawns
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		if isRoleChange then
			-- Removes the player's equipment and weapons
			-- Remove AK57 if the player has one
			--[[if ply:HasWeapon("weapon_ttt_ak57") then
				ply:RemoveEquipmentWeapon("weapon_ttt_ak57")
			end

			-- If player has C4, remove C4
			if ply:HasWeapon("weapon_ttt_c4") then
				ply:RemoveEquipmentWeapon("weapon_ttt_c4")
			end--]]
			-- Remove the player's armor
			-- Note: there is an error in your original code, it should be "ttt_hanfei_armor" not "ttt_hanfei_armor"
			ply:RemoveArmor(GetConVar("ttt_hanfei_armor"):GetInt())
		end
	end
end

if CLIENT then
	function ROLE:AddToSettingsMenu(parent)
		local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

		form:MakeSlider({
			serverConvar = "ttt_hanfei_armor",
			label = "label_hanfei_armor",
			min = 0,
			max = 500,
			decimal = 0
		})

		form:MakeSlider({
			serverConvar = "ttt_hanfei_hp",
			label = "label_hanfei_hp",
			min = 0,
			max = 500,
			decimal = 0
		})

		form:MakeSlider({
			serverConvar = "ttt_hanfei_exposetime",
			label = "label_hanfei_exposetime",
			min = 0,
			max = 120,
			decimal = 0
		})
	end
end
