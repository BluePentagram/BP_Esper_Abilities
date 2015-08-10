	
	
function EsperHud() -- Consider functions like a cyber button, and everything INSIDE the function turns on when this cyber button is pressed.
	x = 25
	y = 30
	surface.SetFont( "Default" )
	surface.SetDrawColor( 255, 255, 255, 255) 
	if LocalPlayer():HasWeapon("esper_clairvoyance") then
		surface.SetTextPos( x, y )
		if LocalPlayer().ClairvoyanceEnabled then
			surface.DrawText( "Clairvoyance - Enabled" )
		else
			surface.DrawText( "Clairvoyance - Disabled" )
		end
		y = y + 15
	end
	if LocalPlayer():HasWeapon("esper_telepathy") then
		surface.SetTextPos( x, y )
		surface.DrawText( "Telepath - " )
		y = y + 15
	end
	if LocalPlayer():HasWeapon("esper_teleport") then
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
	end
end 
hook.Add("HUDPaint", "EsperHud", EsperHud) -- I'll explain hooks and functions in a second