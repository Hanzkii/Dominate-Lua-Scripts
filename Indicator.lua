function OnPaint()
	local DT = FindMenuControl("Rage_Global_DoubletapKeyBool")
	local width, height = GetScreenSize()
	local LocalPlayer = LocalPlayer()
	local TicksRecharged = GetRechargedTicks()
	local PIMult = TicksRecharged / 16
	local FinishRad = PIMult * math.pi * 2
	local Height = height / 1.5
	local Color = TicksRecharged * (255 / 16)

	if DT:GetBool() == true and GetIsAlive(LocalPlayer) and TicksRecharged > 0 then --we alive and dt on
		DrawText(50, Height, 50, Color, 50, 255, "Verdana", 24, "DT", true, true)
		DrawFilledCircle(20,  Height, FinishRad * 2, 50, Color, 50, 255)
	else
		DrawText(50, Height, 50, 50, 50, 255, "Verdana", 24, "DT", true, true)
	end
end
RegisterCallback("Paint", OnPaint)
