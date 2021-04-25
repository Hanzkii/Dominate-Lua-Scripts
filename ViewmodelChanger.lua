local ViewModelX, ViewModelY, ViewModelZ, Righthand

function OnLoadScript()
	ViewModelX = CreateMenuSlider("Viewmodel X", 0, -2.5, 2.5, "ViewModelXSlider")
	ViewModelY = CreateMenuSlider("Viewmodel Y", 0, -2, 2, "ViewModelYSlider")
	ViewModelZ = CreateMenuSlider("Viewmodel Z", 0, -2, 2, "ViewModelZSlider")
	Righthand = CreateMenuCheckbox("CL_Righthand", true, "RighthandCheckbox")
end

function OnPaint()
	if ViewModelX ~= nil and ViewModelY ~= nil and ViewModelZ ~= nil and Righthand ~= nil then
		ConVarSetFloat("viewmodel_offset_x", ViewModelX:GetFloat());
		ConVarSetFloat("viewmodel_offset_y", ViewModelY:GetFloat());
		ConVarSetFloat("viewmodel_offset_z", ViewModelZ:GetFloat());
		ConVarSetBool("cl_righthand", Righthand:GetBool());
	end
end

function OnUnloadScript() --Todo use ConVarGetBool and ConVarGetFloat when they work again
	ConVarSetFloat("viewmodel_offset_x", 0);
	ConVarSetFloat("viewmodel_offset_y", 0);
	ConVarSetFloat("viewmodel_offset_z", 0);
	ConVarSetBool("cl_righthand", 1);
end

RegisterCallback("Paint", OnPaint)
RegisterCallback("LoadScript", OnLoadScript)
RegisterCallback("UnloadScript", OnUnloadScript)