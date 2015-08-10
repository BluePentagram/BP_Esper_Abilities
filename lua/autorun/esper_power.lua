
if SERVER then

elseif CLIENT then
	function EsperHud() -- Consider functions like a cyber button, and everything INSIDE the function turns on when this cyber button is pressed.
		x = 25
		y = 60
		surface.SetFont( "Default" )
		surface.SetDrawColor( 255, 255, 255, 255) 
		-- if LocalPlayer():HasWeapon("esper_clairvoyance") then
			surface.SetTextPos( x, y )
			if LocalPlayer().ClairvoyanceEnabled then
				surface.DrawText( "Clairvoyance - Enabled" )
			else
				surface.DrawText( "Clairvoyance - Disabled" )
			end
			y = y + 15
		-- end
		-- if LocalPlayer():HasWeapon("esper_telepathy") then
			surface.SetTextPos( x, y )
			if LocalPlayer().TelepathyEnabled then
				surface.DrawText( "Telepath - Disabled" )
			else
				surface.DrawText( "Telepath - " )
			end
			y = y + 15
		-- end
		-- if LocalPlayer():HasWeapon("esper_teleport") then
			surface.SetTextPos( x, y )
			surface.DrawText( "Teleport:" )
			y = y + 15
			surface.SetTextPos( x, y )
			surface.DrawText( "X: ".."WIP" )
			y = y + 15
			surface.SetTextPos( x, y )
			surface.DrawText( "Y: ".."WIP" )
			y = y + 15
			surface.SetTextPos( x, y )
			surface.DrawText( "Z: ".."WIP" )
		-- end
	end 
	hook.Add("HUDPaint", "EsperHud", EsperHud) -- I'll explain hooks and functions in a second
end

hook.Add( "PreDrawHalos", "AddHalos", function()
		if (LocalPlayer():HasWeapon("esper_clairvoyance") and LocalPlayer().ClairvoyanceEnabled) then
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

function EsperTelepathy( ply, text, teamonly )
	if (LocalPlayer():HasWeapon("esper_telepathy") and LocalPlayer().TelepathyEnabled) then
		return ""
	end
end
hook.Add( "PlayerSay", "EsperTelepathy", EsperTelepathy )

function PointGainPlayer(victim,weapon,killer)
	victim.ClairvoyanceEnabled	= false
	victim.TelepathyEnabled		= false
end
hook.Add( "PlayerDeath", "EsperDeath", EsperDeath )
