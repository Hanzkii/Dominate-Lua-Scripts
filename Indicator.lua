function OnPaint()
	local DT = FindMenuControl("Rage_Global_DoubletapKeyBool")
	local width, height = GetScreenSize()
	local LocalPlayer = LocalPlayer()
	local TicksRecharged = GetRechargedTicks()
	local PIMult = TicksRecharged / 16
	local FinishRad = PIMult * math.pi * 2

	if DT:GetBool() == true and GetIsAlive(LocalPlayer) and TicksRecharged > 0 then --we alive and dt on
		if TicksRecharged > 15 then --completed recharging
			DrawText(50, height / 1.22, 50, 255, 50, 255, "Verdana", 24, "DT", true, true)
		else
			DrawText(50, height / 1.22, 50, 50, 50, 255, "Verdana", 24, "DT", true, true)
		end
		DrawFilledCircle(20,  height / 1.22, FinishRad * 2, 50, 255, 50, 255)
	else
		DrawText(50, height / 1.22, 50, 50, 50, 255, "Verdana", 24, "DT", true, true)
	end
end
RegisterCallback("Paint", OnPaint)