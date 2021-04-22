local TickBaseRelaxTime, RelaxTimeSlider

function OnLoadScript()
	TickBaseRelaxTime = GetTickbaseRelaxTime()
	RelaxTimeSlider = CreateMenuSlider("Doubletap ChargeTime", 1, 0, 1, "LuaRelaxTimeSlider")
end

function OnCreateMove()
	if RelaxTimeSlider ~= nil then
		SetTickbaseRelaxTime(RelaxTimeSlider:GetFloat())
	end
end

function OnUnloadScript()
	SetTickbaseRelaxTime(TickBaseRelaxTime)
end

RegisterCallback("CreateMove", OnCreateMove)
RegisterCallback("LoadScript", OnLoadScript)
RegisterCallback("UnloadScript", OnUnloadScript)