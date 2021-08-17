--ez pz Hanzki
local ViewModelFov, oViewModelFov
function OnLoadScript() --Get original fov
	ViewModelFov = FindMenuControl("Visuals_Effects_ViewModelFov")
	oViewModelFov = ViewModelFov:GetInt()
end

function OnPaint()
	local WeaponInfo = GetWeaponInfo(LocalPlayer())
	local IsScoped = GetEntityProp(LocalPlayer(), "DT_CSPlayer", "m_bIsScoped")
	local WeaponName = string.gsub(WeaponInfo.m_szWeaponName, "weapon_", "")

	if WeaponName == "aug" or WeaponName == "sg556" then
		if IsScoped then
			ViewModelFov:SetInt(160);
		else
			ViewModelFov:SetInt(oViewModelFov);
		end
	end
end

function OnUnloadScript() --Reset fov
	ViewModelFov:SetInt(oViewModelFov);
end

RegisterCallback("Paint", OnPaint)
RegisterCallback("LoadScript", OnLoadScript)
RegisterCallback("UnloadScript", OnUnloadScript)