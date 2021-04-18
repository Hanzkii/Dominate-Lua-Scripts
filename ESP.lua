function OnPaint()
	local maxclients = GetMaxClients()
	for i = 0, maxclients-1 do
		if IsValidEntity(i) and IsPlayer(i) and IsEnemy(i) then
			if  GetIsAlive(i) and not GetIsDormant(i) then

				local playerinfo = GetPlayerInfo(i)
				local WeaponInfo = GetWeaponInfo(i)
				local m_iClip1 = GetEntityWeaponProp(i, "DT_BaseCombatWeapon", "m_iClip1")
				local m_iPrimaryReserveAmmoCount = GetEntityWeaponProp(i, "DT_BaseCombatWeapon", "m_iPrimaryReserveAmmoCount")
				local x, y, z = GetOrigin(i)
				local HeadX, HeadY  = WorldToScreen(x, y, z + 72)
				local LegsX, LegsY  = WorldToScreen(x, y, z - 5)
				local hp = GetHealth(i)

				if HeadX ~= nil and HeadY ~= nil  and LegsX ~= nil  and LegsY ~= nil and playerinfo ~= nil and WeaponInfo ~= nil  and m_iClip1 ~= nil and m_iPrimaryReserveAmmoCount ~= nil then

					local BoxHeight = LegsY - HeadY
					local BoxWidth = BoxHeight / 4
					local BoxLeft = LegsX - BoxWidth
					local BoxRight = LegsX + BoxWidth
					local BoxTop = HeadY
					local BoxBottom = HeadY + BoxHeight

					LoadFont("Tahoma")
					local TextTop = HeadY - 14
					local TextBot = LegsY + 14
					local TextCenter = HeadX 

					--esp
					DrawRectangle(math.floor(BoxLeft), math.floor(BoxTop), math.floor(BoxWidth + BoxWidth + 1), 1, 255, 255, 255, 255) --up
					DrawRectangle(math.floor(BoxLeft), math.floor(BoxBottom), math.floor(BoxWidth + BoxWidth + 1), 1, 255, 255, 255, 255) --down
					DrawRectangle(math.floor(BoxLeft), math.floor(BoxTop), 1, math.floor(BoxHeight + 2),   255, 255, 255, 255) --left
					DrawRectangle(math.floor(BoxRight), math.floor(BoxTop), 1, math.floor(BoxHeight + 2),   255, 255, 255, 255) --right
					--

					--hp
					if hp > 100 then
						hp = 100
					end

					if hp < 100 then
						DrawText(math.floor(BoxLeft - 9), math.floor(BoxTop - 9 - BoxHeight *  0.01 * hp + BoxHeight), 255, 255, 255, 255, "Tahoma", 10, hp)
					end

					DrawRectangle(math.floor(BoxLeft - 4), math.floor(BoxTop - BoxHeight *  0.01 * hp + BoxHeight),  2,  math.floor(BoxHeight * 0.01 * hp + 2),   math.floor((hp + 40 / 60) * 255), math.floor((hp  / 100) * 255), 0, 255) --left
					--

					--name
					DrawText(math.floor(TextCenter), math.floor(TextTop), 255, 255, 255, 255, "Tahoma", 12, playerinfo.m_szName, true, true)
					--

					--weapon 
					DrawText(math.floor(TextCenter), math.floor(TextBot), 255, 255, 255, 255, "Tahoma", 12, string.gsub(WeaponInfo.m_szWeaponName, "weapon_", ""), true, true)

					if m_iPrimaryReserveAmmoCount > 0 then -- Dont draw if uses weapon with 0 ammo like Knife
						DrawText(math.floor(TextCenter), math.floor(TextBot + 14), 255, 255, 255, 255, "Tahoma", 12, m_iClip1 .. " / " .. m_iPrimaryReserveAmmoCount, true, true)
					end
					--
					 
				end
			end
		end
	end
end

RegisterCallback("Paint", OnPaint)
