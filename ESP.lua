function OnPaint()
	local maxclients = GetMaxClients()
	for i = 0, maxclients-1 do
		if IsValidEntity(i) and IsPlayer(i) and IsEnemy(i) then
			if  GetIsAlive(i) and not GetIsDormant(i) then

				local playerinfo = GetPlayerInfo(i)
				local x, y, z = GetOrigin(i)
				local HeadX, HeadY  = WorldToScreen(x, y, z + 72)
				local LegsX, LegsY  = WorldToScreen(x, y, z - 5)
				local hp = GetHealth(i)

				if HeadX ~= nil and HeadY ~= nil  and LegsX ~= nil  and LegsY ~= nil and playerinfo ~= nil then

					local BoxHeight = LegsY - HeadY
					local BoxWidth = BoxHeight / 4
					local BoxLeft = LegsX - BoxWidth
					local BoxRight = LegsX + BoxWidth
					local BoxTop = HeadY
					local BoxBottom = HeadY + BoxHeight

					LoadFont("Tahoma")
					local textwidth, textheight = GetTextSize("Tahoma", 12, playerinfo.m_szName)
					local TextTop = HeadY - 14
					local TextBot = LegsY + 14
					local TextCenter = HeadX + 32 - textwidth

					--esp
					DrawRectangle(BoxLeft, BoxTop, BoxWidth + BoxWidth + 1, 1, 255, 255, 255, 255) --up
					DrawRectangle(BoxLeft, BoxBottom,BoxWidth + BoxWidth + 1, 1, 255, 255, 255, 255) --down
					DrawRectangle(BoxLeft, BoxTop, 1, BoxHeight + 2,   255, 255, 255, 255) --left
					DrawRectangle(BoxRight, BoxTop, 1, BoxHeight + 2,   255, 255, 255, 255) --right
					--

					--hp
					if hp > 100 then
						hp = 100
					end

					if hp < 100 then
						DrawText(BoxLeft - 9, BoxTop - 9 - BoxHeight *  0.01 * hp + BoxHeight, 255, 255, 255, 255, "Tahoma", 10, hp)
					end

					DrawRectangle(BoxLeft - 4, BoxTop - BoxHeight *  0.01 * hp + BoxHeight,  2,  BoxHeight * 0.01 * hp + 2,   (hp + 40 / 60) * 255, (hp  / 100) * 255, 0, 255) --left
					--

					--name
					DrawText(TextCenter, TextTop, 255, 255, 255, 255, "Tahoma", 12, playerinfo.m_szName)
					--
				end
			end
		end
	end
end

RegisterCallback("Paint", OnPaint)