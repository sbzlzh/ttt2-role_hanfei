if SERVER then
    AddCSLuaFile()

    AddCSLuaFile("autorun/ak47_sound.lua")
end

if CLIENT then
    SWEP.PrintName = "Hanf-Ak47"
    SWEP.Slot = 6
    SWEP.Icon = "vgui/ttt/ak47_icon"
    SWEP.ViewModelFlip = false
    SWEP.ViewModelFOV = 75
    SWEP.DrawCrosshair = false
    SWEP.UseHands = true
    SWEP.EquipMenuData = {
        type = "item_weapon",
        desc = "AK47 for Hanf"
    }
end

SWEP.Gun                 = ("weapon_ttt_hanf_ak47")

SWEP.HoldType            = "ar2"

SWEP.ViewModel           = "models/weapons/v_irq_ak47.mdl" -- Weapon view model
SWEP.WorldModel          = "models/weapons/w_irq_ak47.mdl" -- Weapon world model
SWEP.ShowWorldModel      = false
SWEP.Base                = "weapon_tttbase"
SWEP.Spawnable           = true
SWEP.AdminSpawnable      = true

SWEP.Primary.Sound       = Sound("gunshot_irq_ak47") -- Script that calls the primary fire sound
--SWEP.Primary.SilencedSound 	= Sound("")		-- Sound if the weapon is silenced
SWEP.Primary.Ammo        = "SMG1"
SWEP.Primary.Delay       = 0.095
SWEP.Primary.Recoil      = 1.2
SWEP.Primary.Cone        = 0.02
SWEP.Primary.Damage      = 25
SWEP.Primary.Automatic   = true
SWEP.Primary.ClipSize    = 35
SWEP.Primary.ClipMax     = 70
SWEP.Primary.DefaultClip = 35

-- enter iron sight info and bone mod info below
SWEP.IronSightsPos       = Vector(-6.56, -11, 2.4)
SWEP.IronSightsAng       = Vector(2.4, 0, 0)
SWEP.SightsPos           = Vector(-1.976, 0, 0.699)
SWEP.SightsAng           = Vector(0.129, 0, 0)
SWEP.RunSightsPos        = Vector(5.26, -6.123, -0.514)
SWEP.RunSightsAng        = Vector(-19.5, 63.31, -19.584)

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind                = WEAPON_EQUIP1

-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2,
-- then this gun can be spawned as a random weapon.
SWEP.AutoSpawnable       = false

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
SWEP.AmmoEnt             = "item_ammo_smg1_ttt"

-- If LimitedStock is true, you can only buy one per round.
SWEP.LimitedStock        = true

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy              = { nil }

-- If IsSilent is true, victims will not scream upon death.
SWEP.IsSilent            = false

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights            = false

SWEP.WElements           = {
    ["ak_47"] = {
        type = "Model",
        model = "models/weapons/w_irq_ak47.mdl",
        bone = "ValveBiped.Bip01_R_Hand",
        rel = "",
        pos = Vector(2.325, 0.717, 0.347),
        angle = Angle(-2.712, -3.168, -180),
        size = Vector(1, 1, 1),
        color = Color(255, 255, 255, 255),
        surpresslightning = false,
        material = "",
        skin = 0,
        bodygroup = {}
    }
}

SWEP.Offset = {
    Pos = {
        Up = 0,
        Right = 1,
        Forward = -2,
    },

    Ang = {
        Up = 0,
        Right = 355,
        Forward = 180,
    },

    Scale = 1
}

function SWEP:Reload()
    if (self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0) then return end

    self:DefaultReload(ACT_VM_RELOAD)
    self:SetIronsights(false)
    self:SetZoom(false)
end

function SWEP:OnDrop()
    self:Remove()
end

function SWEP:DrawWorldModel()
    local hand, offset, rotate
    local pl = self:GetOwner()

    if IsValid(pl) then
        local boneIndex = pl:LookupBone("ValveBiped.Bip01_R_Hand")

        if boneIndex then
            local pos, ang = pl:GetBonePosition(boneIndex)

            pos, ang = self:ApplyOffset(pos, ang)

            self:SetRenderOrigin(pos)
            self:SetRenderAngles(ang)
            self:DrawModel()
        end
    else
        self:SetRenderOrigin(nil)
        self:SetRenderAngles(nil)
        self:DrawModel()
    end
end

function SWEP:ApplyOffset(pos, ang)
    pos = pos + ang:Forward() * self.Offset.Pos.Forward + ang:Right() * self.Offset.Pos.Right + ang:Up() * self.Offset.Pos.Up

    ang:RotateAroundAxis(ang:Up(), self.Offset.Ang.Up)
    ang:RotateAroundAxis(ang:Right(), self.Offset.Ang.Right)
    ang:RotateAroundAxis(ang:Forward(), self.Offset.Ang.Forward)

    return pos, ang
end
