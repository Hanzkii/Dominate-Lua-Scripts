
function OnPaint()
	LoadFont("Tahoma")
	local DT = FindMenuControl("Rage_Global_DoubletapKeyBool")
	local OverrideDMG = FindMenuControl("Rage_Global_OverrideMindmgKeyBool")
	local FD = FindMenuControl("AntiAim_Misc_FakeDuckBool")
	local width, height = GetScreenSize()
	local LocalPlayer = LocalPlayer()
	local TicksRecharged = GetRechargedTicks()
	local CircleRad = 10 * (TicksRecharged / 16)

	if GetIsAlive(LocalPlayer) then

		if FD:GetBool() == true then
			DrawText(5, math.floor(height / 1.5), 0, 255, 0, 255, "Tahoma", 24, "FD", false, true)
		else
			DrawText(5, math.floor(height / 1.5), 0, 0, 0, 255, "Tahoma", 24, "FD", false, true)
		end

		if DT:GetBool() == true  and TicksRecharged > 0 and not FD:GetBool() == true then
			DrawText(5,  math.floor(height / 1.55), 0, 255, 0, 255, "Tahoma", 24, "DT", false, true)
			DrawFilledCircle(45,   math.floor(height / 1.55), math.floor(CircleRad), 0, 255, 0, 255)
		else
			DrawText(5,  math.floor(height / 1.55), 0, 0, 0, 255, "Tahoma", 24, "DT", false, true)
		end

		if OverrideDMG:GetBool() == true then
			DrawText(5, math.floor(height / 1.60), 0, 255, 0, 255, "Tahoma", 24, "Damage", false, true)
		else
			DrawText(5, math.floor(height / 1.60), 0, 0, 0, 255, "Tahoma", 24, "Damage", false, true)
		end

	end

end
RegisterCallback("Paint", OnPaint)
