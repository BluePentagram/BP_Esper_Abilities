if SERVER then 
 
	AddCSLuaFile()
 
	SWEP.Weight = 5
 
	SWEP.AutoSwitchTo = false
	SWEP.AutoSwitchFrom = false
 
elseif CLIENT then 
	SWEP.PrintName = "Teleport - WIP"
	SWEP.Slot = 0
	SWEP.SlotPos = 6
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
 
SWEP.Author = "Blue-Pentagram"
SWEP.Instructions = "-To Be Added-"
SWEP.Contact = "-To Be Added-"
SWEP.Purpose = "-To Be Added-"
SWEP.Category = "Esper Abilitys"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel	= "models/weapons/v_357.mdl"
SWEP.WorldModel	= "models/weapons/w_357.mdl"
 
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
 
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.HoldType = "normal"

function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
end

function SWEP:DrawWorldModel()
     -- self:DrawModel()
end

function SWEP:Initialize()
	self:SetWeaponHoldType( self.HoldType )
end

function SWEP:Reload()
end
 
function SWEP:Think()
end
 
function SWEP:PrimaryAttack()

end

function SWEP:SecondaryAttack()

end