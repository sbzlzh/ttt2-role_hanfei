if SERVER then
    AddCSLuaFile()

    resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_hanf.vmt")
    resource.AddFile("sound/weapons/hanfei/big_explosion.wav")
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

    self.preventFindCredits = false
    self.isOmniscientRole = true

    self.conVarData = {
        pct = 0.15,
        maximum = 1,
        minPlayers = 7,
        random = 30,
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

-- hanfei_explode function creates an explosion that deals damage within a specified range
local function hanfei_explode(ply, pos)
    if not IsValid(ply) then return end

    local DMG_EXPLOSION = 350
    local R_INNER = 520
    local R_OUTER = R_INNER * 1.15

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
        if IsValid(ent) and ent:IsPlayer() and ent:GetTeam() ~= ply:GetTeam() then
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
    -- Set the exposure time for the hanfei role at the start of each round
    hook.Add("TTTBeginRound", "ttt2_hanfei_timer", function()
        -- Get the exposure time from ConVar
        timer.Simple(GetConVar("ttt2_hanfei_exposetime"):GetInt(), function()
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
                    local info = LANG.MsgAll("ttt2_hanfei_chat_reveal", { playername = hanfei_players }, MSG_CHAT_WARN)
                end
            end
        end)
    end)

    -- CONSTANTS
    -- Enum for tracker mode
    local TRACKER_MODE = { NONE = 0, RADAR = 1, TRACKER = 2 }

    -- Adding loadout on role change/spawn
    function ROLE:GiveRoleLoadout(ply, isRoleChange)
        -- Assign equipment and weapons to the player
        -- If player doesn't have ak47, give ak47
        if not ply:HasWeapon("weapon_ttt_hanf_ak47") then
            ply:GiveEquipmentWeapon("weapon_ttt_hanf_ak47")
        end

        -- If player does not have C4, give C4
        if not ply:HasWeapon("weapon_ttt_hanf_c4") then
            ply:GiveEquipmentWeapon("weapon_ttt_hanf_c4")
        end

        -- Give the player extra ammo
        ply:GiveAmmo(90, "SMG1")

        -- Give the player radar equipment or trackerequipment
        if GetConVar("ttt2_hanfei_tracker_mode"):GetInt() == TRACKER_MODE.RADAR then
            ply:GiveEquipmentItem("item_ttt_radar")
        elseif GetConVar("ttt2_hanfei_tracker_mode"):GetInt() == TRACKER_MODE.TRACKER then
            if ply:HasEquipmentItem("item_ttt_tracker") then
                ply:GiveEquipmentItem("item_ttt_tracker")
            else
                LANG.MsgAll("tracker_not_available", nil, MSG_CHAT_WARN)
            end
        end

        -- Give the player kraber equipment
        -- ply:GiveEquipmentItem("weapon_ttt_kraber")

        -- Give the player armor and set the life value
        ply:GiveArmor(GetConVar("ttt2_hanfei_armor"):GetInt())

        -- Give the player set the life value
        ply:SetHealth(GetConVar("ttt2_hanfei_hp"):GetInt())
    end

    function ROLE:RemoveRoleLoadout(ply, isRoleChange)
        if isRoleChange then
            -- Removes the player's equipment and weapons
            -- Remove ak47 if the player has one
            --[[if ply:HasWeapon("weapon_ttt_hanf_ak47") then
				ply:RemoveEquipmentWeapon("weapon_ttt_hanf_ak47")
			end--]]

            -- If player has C4, remove C4
            if ply:HasWeapon("weapon_ttt_hanf_c4") then
                ply:RemoveEquipmentWeapon("weapon_ttt_hanf_c4")
            end

            ply:RemoveAmmo(30, "SMG1")

            -- If player has kraber, remove kraber
            --[[if ply:HasWeapon("weapon_ttt_kraber") then
				ply:RemoveEquipmentWeapon("weapon_ttt_kraber")
			end--]]

            -- If player has tracker or radar, remove  tracker or radar
            if GetConVar("ttt2_hanfei_tracker_mode"):GetInt() == TRACKER_MODE.RADAR then
                ply:RemoveEquipmentItem("item_ttt_radar")
            elseif GetConVar("ttt2_hanfei_tracker_mode"):GetInt() == TRACKER_MODE.TRACKER then
                ply:RemoveEquipmentItem("item_ttt_tracker")
            end

            -- Remove the player's armor
            -- Note: there is an error in your original code, it should be "ttt2_hanfei_armor" not "ttt2_hanfei_armor"
            ply:RemoveArmor(GetConVar("ttt2_hanfei_armor"):GetInt())
        end
    end

    hook.Add("PlayerDeath", "ttt2_hanfei_death", function(victim, inflictor, attacker)
        if IsValid(victim) and victim:IsPlayer() and victim:GetSubRole() == ROLE_HANFEI then
            local pos = victim:GetPos()
            local hanfei_player = ""

            for k, v in ipairs(player.GetAll()) do
                if v:GetSubRole() == ROLE_HANFEI then
                    hanfei_player = hanfei_player .. v:Nick() .. ", "
                end
            end

            -- remove the last comma and space
            hanfei_player = string.sub(hanfei_player, 1, -3)

            -- Send the message three times
            for i = 1, 3 do
                local info = LANG.MsgAll("ttt2_hanfei_chat_explode_info", { playername = hanfei_player }, MSG_CHAT_WARN)
            end

            timer.Simple(2.05, function()
                hanfei_explode(victim, pos)
            end)

            for k, v in ipairs(player.GetAll()) do
                if not v:Alive() then return end
                if v:IsSpec() then return end

                victim:EmitSound("weapons/hanfei/jihad.wav", math.random(100, 150), math.random(95, 105))
            end
        end
    end)
end

if CLIENT then
    function ROLE:AddToSettingsMenu(parent)
        local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

        form:MakeSlider({
            serverConvar = "ttt2_hanfei_hp",
            label = "label_hanfei_hp",
            min = 0,
            max = 500,
            decimal = 0
        })

        form:MakeSlider({
            serverConvar = "ttt2_hanfei_armor",
            label = "label_hanfei_armor",
            min = 0,
            max = 500,
            decimal = 0
        })

        form:MakeSlider({
            serverConvar = "ttt2_hanfei_exposetime",
            label = "label_hanfei_exposetime",
            min = 0,
            max = 120,
            decimal = 0
        })

        form:MakeSlider({
            serverConvar = "ttt2_hanfei_tracker_mode",
            label = "label_hanfei_tracker_mode",
            min = 0,
            max = 2,
            decimal = 0
        })
    end
end
