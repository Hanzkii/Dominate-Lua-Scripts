function OnPaint()
    local DT = FindMenuControl("Rage_Global_DoubletapKeyBool")
    local width, height = GetScreenSize()
    local LocalPlayer = LocalPlayer()
    local TicksRecharged = GetRechargedTicks()
    local CircleRad = 10 * (TicksRecharged / 16)
    local Height = height / 1.5
    local Color = TicksRecharged * (255 / 16)

    if DT:GetBool() == true and GetIsAlive(LocalPlayer) and TicksRecharged > 0 then --we alive and dt on
        DrawText(50, Height, 0, Color, 0, 255, "Verdana", 24, "DT", true, true)
        DrawFilledCircle(20,  Height, math.floor(CircleRad), 0, Color, 0, 255)
    else
        DrawText(50, Height, 0, 0, 0, 255, "Verdana", 24, "DT", true, true)
    end
end
RegisterCallback("Paint", OnPaint)
