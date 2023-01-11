if SERVER then
	AddCSLuaFile()
	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_hanf.vmt")
	resource.AddFile("materials/vgui/ttt/ak47_icon.vmt")
	resource.AddFile("sound/weapons/hanfei/jihad.wav")
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
	self.preventFindCredits = true
	
	self.conVarData = {
		pct = 0.13,
		maximum = 1,
		minPlayers = 8,
		random = 70,
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

-- explosion properties
local function hanfei_Explode(ply,pos)
	local dmg = 200
	local r_inner = 550
	local r_outer = r_inner * 1.15
 	util.BlastDamage( ply, ply, pos, r_outer,dmg )
	local effect = EffectData()
	effect:SetStart(pos)
	effect:SetOrigin(pos)
	effect:SetScale(r_outer)
	effect:SetRadius(r_outer)
	effect:SetMagnitude(dmg)
	util.Effect("Explosion", effect, true, true)
end
if SERVER then
    -- adding loadout on role change/spawn
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentWeapon("weapon_ttt_ak57")
		ply:GiveAmmo(90,"SMG1")
		ply:GiveEquipmentWeapon("weapon_ttt_c4")
		--ply:Give("weapon_ttt_kraber")
		ply:GiveEquipmentItem("item_ttt_radar")
		ply:GiveArmor(GetConVar("ttt_hanfei_armor"):GetInt())
	    ply:SetHealth(GetConVar("ttt_hanfei_hp"):GetInt())
	end

	hook.Add( "PlayerDeath", "ttt_hanfei_death", function( victim, inflictor, attacker )
		if victim:GetSubRole()==ROLE_HANFEI then
			local pos=victim:GetPos()
			timer.Simple(2.05, function()
				hanfei_Explode(victim,pos) 
			end)
			victim:EmitSound("weapons/hanfei/jihad.wav", math.random(100, 150), math.random(95, 105))
		end
	end)
	
	hook.Add("TTTBeginRound","ttt_hanfei_timer",function()
	    timer.Simple(GetConVar("ttt_hanfei_exposetime"):GetInt(), function()
		    local flag=false
		    for k,v in ipairs(player.GetAll()) do
			if v:GetSubRole()==ROLE_HANFEI then
				flag=true
				v.expose=true
				--v:SetModel("models/cso2/pm/hasanpm.mdl")
			end
		end
		    if flag then
			    for k,v in ipairs(player.GetAll()) do
				    if v:GetSubRole()==ROLE_HANFEI then
			            info=LANG.MsgAll("ttt2_hanfei_chat_reveal",{playername = v:Nick()}, MSG_CHAT_WARN)
				    end
				end
		    end
	    end)
    end)
    -- removing loadout on role change/despawn
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
        if isRoleChange then
		    --ply:RemoveEquipmentWeapon("weapon_ttt_kraber")
			ply:RemoveEquipmentWeapon("weapon_ttt_ak57")
			ply:RemoveEquipmentWeapon("weapon_ttt_c4")
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
            max = 1000,
            decimal = 0
        })
		form:MakeSlider({
            serverConvar = "ttt_hanfei_hp",
            label = "label_hanfei_hp",
            min = 0,
            max = 1000,
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