if SERVER then 
 
	AddCSLuaFile()
 
	SWEP.Weight = 5
 
	SWEP.AutoSwitchTo = false
	SWEP.AutoSwitchFrom = false
 
elseif CLIENT then 
	SWEP.PrintName = "Clairvoyance - WIP"
	SWEP.Slot = 0
	SWEP.SlotPos = 6
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
	
	function SWEP:DrawHUD()
		local x = ScrW() / 2
		local y = ScrH() / 2
		surface.SetDrawColor( 50, 50, 50, 255 )
		local gap = math.abs(math.sin(CurTime() * 1.5) * 6);
		local length = gap + 5
		surface.DrawLine( x - length, y, x - gap, y )
		surface.DrawLine( x + length, y, x + gap, y )
		surface.DrawLine( x, y - length, x, y - gap )
		surface.DrawLine( x, y + length, x, y + gap )
	end
	
end
 
SWEP.Author = "Blue-Pentagram"
SWEP.Instructions = "left click to enable, right click to disable"
SWEP.Contact = "-To Be Added-"
SWEP.Purpose = "Allow you to see though walls and objects."
SWEP.Category = "Esper Abilitys"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel	= "models/weapons/c_arms_citizen.mdl"
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
	LocalPlayer().ClairvoyanceEnabled = false
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

function SWEP:OnRemove(ply)
	ply.ClairvoyanceEnabled = false
end
 
function SWEP:PrimaryAttack()
	LocalPlayer().ClairvoyanceEnabled = true
end

function SWEP:SecondaryAttack()
	LocalPlayer().ClairvoyanceEnabled = false
end

hook.Add( "PreDrawHalos", "AddHalos", function()
		if LocalPlayer().ClairvoyanceEnabled then
			halo.Add(ents.FindByClass( "prop_physics*" ), Color( 0, 0, 255 ), 1, 1, 2,true,true)
			halo.Add(ents.FindByClass( "player*" ), Color( 0, 0, 255 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "ents_*" ), Color( 255, 0, 255 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "ent_*" ), Color( 255, 0, 255 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "*_ent" ), Color( 255, 0, 255 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "*_ents" ), Color( 255, 0, 255 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "money_*" ), Color( 0, 255, 0 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "weapon_*" ), Color( 0, 0, 255 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "swep_*" ), Color( 255, 0, 0 ), 1, 1, 2, true,true)
			halo.Add(ents.FindByClass( "death_note" ), Color( 255, 0, 0 ), 1, 1, 2, true,true)
		end
	
end )