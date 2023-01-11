if SERVER then
	AddCSLuaFile()
	AddCSLuaFile("autorun/aksound.lua")
end

if CLIENT then
    SWEP.PrintName = "Ak-47"
    SWEP.Slot = 6
    SWEP.Icon = "vgui/ttt/ak47_icon"
    SWEP.ViewModelFlip = false
    SWEP.ViewModelFOV = 70
    SWEP.DrawCrosshair = false
   
    SWEP.EquipMenuData = {
        type = "item_weapon",
        desc = "Hanfei's weapon"
    }
end

SWEP.Gun = ("weapon_ttt_ak57")

SWEP.HoldType 				= "ar2"	

SWEP.ViewModel				= "models/weapons/v_irq_ak47.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_irq_ak47.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= false
SWEP.Base 				= "weapon_tttbase"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("gunshot_irq_ak47")		-- Script that calls the primary fire sound
--SWEP.Primary.SilencedSound 	= Sound("")		-- Sound if the weapon is silenced
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Delay = 0.095
SWEP.Primary.Recoil = 1.2
SWEP.Primary.Cone = 0.02
SWEP.Primary.Damage = 25
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 35
SWEP.Primary.ClipMax = 70
SWEP.Primary.DefaultClip = 35
SWEP.Kind = WEAPON_EQUIP1
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.LimitedStock = true
SWEP.CanBuy = { nil }


-- enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-1.976,0,0.699)	--Iron Sight positions and angles. Use the Iron sights utility in 
SWEP.IronSightsAng = Vector(0.129,0,0)	            --Clavus's Swep Construction Kit to get these vectors
SWEP.SightsPos = Vector(-1.976,0,0.699)
SWEP.SightsAng = Vector(0.129,0,0)
SWEP.RunSightsPos = Vector(5.26,-6.123,-0.514)	--These are for the angles your viewmodel will be when running
SWEP.RunSightsAng = Vector(-19.5,63.31,-19.584)

SWEP.WElements = {
	["ak_47"] = { type = "Model", model = "models/weapons/w_irq_ak47.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.325, 0.717, 0.347), angle = Angle(-2.712, -3.168, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
if CLIENT then
   -- Text shown in the equip menu
   SWEP.EquipMenuData = {
      type = "Weapon",
      desc = "The Infamous Ak-47 .\n\nA Strong and fast rifle."
   }
end

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
    }
}

function SWEP:DrawWorldModel( )
    local hand, offset, rotate
    if not IsValid( self.Owner ) then self:DrawModel( )return end
    if not self.Hand then
        self.Hand = self.Owner:LookupAttachment( "anim_attachment_rh" )
    end

    hand = self.Owner:GetAttachment( self.Hand )

    if not hand then self:DrawModel( ) return end

    offset = hand.Ang:Right( ) * self.Offset.Pos.Right + hand.Ang:Forward( ) * self.Offset.Pos.Forward + hand.Ang:Up( ) * self.Offset.Pos.Up

    hand.Ang:RotateAroundAxis( hand.Ang:Right( ), self.Offset.Ang.Right )
    hand.Ang:RotateAroundAxis( hand.Ang:Forward( ), self.Offset.Ang.Forward )
    hand.Ang:RotateAroundAxis( hand.Ang:Up( ), self.Offset.Ang.Up )

    self:SetRenderOrigin( hand.Pos + offset )
    self:SetRenderAngles( hand.Ang )

    self:DrawModel( )
end

function SWEP:Reload()
    if ( self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
    self:DefaultReload( ACT_VM_RELOAD )
    self:SetIronsights( false )
    self:SetZoom( false )
end

function SWEP:DrawWorldModel( )
    local hand, offset, rotate
	
    local pl = self:GetOwner()
	
    if IsValid( pl ) then
	
        local boneIndex = pl:LookupBone( "ValveBiped.Bip01_R_Hand" )
		
            if boneIndex then
			
                local pos, ang = pl:GetBonePosition( boneIndex )
                pos = pos + ang:Forward() * self.Offset.Pos.Forward + ang:Right() * self.Offset.Pos.Right + ang:Up() * self.Offset.Pos.Up
                ang:RotateAroundAxis( ang:Up(), self.Offset.Ang.Up)
                ang:RotateAroundAxis( ang:Right(), self.Offset.Ang.Right )
                ang:RotateAroundAxis( ang:Forward(),  self.Offset.Ang.Forward )
                self:SetRenderOrigin( pos )
                self:SetRenderAngles( ang )
                self:DrawModel()
            end
    else
        self:SetRenderOrigin( nil )
        self:SetRenderAngles( nil )
        self:DrawModel()
    end
end

function SWEP:OnDrop()
	--self:Remove()
end