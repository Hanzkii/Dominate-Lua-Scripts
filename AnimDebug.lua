local Order, Sequence, PrevCycle, Weight, WeightDeltaRate, PlaybackRate, Cycle
local Moving = false
function math.sign(v)
	return (v >= 0 and 1) or -1
end

function Round(v, bracket)
	bracket = bracket or 1
	return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
end

function OnPaint()
	LoadFont("Tahoma")

	local width, height = GetScreenSize()
	local LocalPlayer = LocalPlayer()
	local maxclients = GetMaxClients()
	--DrawRectangle(x, y, width, height, red, green, blue, alpha)
	DrawRectangle(0, math.floor(height - 330), 800, 290, 50, 50, 50, 255)
	if  GetIsAlive(LocalPlayer)  then
		for i = 0 , 12 do
			local Data = GetAnimationOverlay(LocalPlayer, i)
			if Data ~= nil then

				DrawText(math.floor(10), math.floor((height / 1.4) + (i * 20)), 255, 255, 255, 255, "Tahoma", 14,
				"m_nOrder: " .. Round(Data.m_nOrder)
				.. " m_nSequence: " .. Round(Data.m_nSequence)
				.. " m_flPrevCycle: " .. Round(Data.m_flPrevCycle,  0.01 )
				.. " m_flWeight: " .. Round(Data.m_flWeight,  0.01 )
				.. " m_flWeightDeltaRate: " .. Round(Data.m_flWeightDeltaRate,  0.01 )
				.. " m_flPlaybackRate: " .. Round(Data.m_flPlaybackRate,  0.01 )
				.. " m_flCycle: " .. Round(Data.m_flCycle, 0.01 )
				, false, true)

				Order = Data.m_nOrder
				Sequence = Data.m_nSequence
				PrevCycle = Data.m_flPrevCycle
				Weight = Data.m_flWeight
				WeightDeltaRate = Data.m_flWeightDeltaRate
				PlaybackRate = Data.m_flPlaybackRate
				Cycle = Data.m_flCycle

				if Order == 6 and Weight > 0.01 then
					Moving = true
				end
			

				if Order == 6 and Weight < 0.01 then
					Moving = false
				end


				if Moving then
					DrawText(math.floor(10), math.floor(height / 1.7), 0, 255, 0, 255, "Tahoma", 20, "Moving")
				else
					DrawText(math.floor(10), math.floor(height / 1.7), 0, 255, 0, 255, "Tahoma", 20, "Not Moving")
					
					if Order == 3 and Weight == 0 and WeightDeltaRate == 0 and Cycle > 0.9 then
						DrawText(math.floor(10), math.floor(height / 1.8), 0, 255, 0, 255, "Tahoma", 20, "Micromovement")

					else
						if Order == 3 and Weight > 0 and Weight < 1 and Cycle > 0.01 and Cycle < 0.03 and WeightDeltaRate > 0 then
							DrawText(math.floor(10), math.floor(height / 2), 0, 255, 0, 255, "Tahoma", 20, "Max Desync LBY")
						end
						if Order == 3 and Weight < 1 and Weight > 0 and Cycle < 0.03 and WeightDeltaRate < 0 then
							DrawText(math.floor(10), math.floor(height / 1.9), 0, 255, 0, 255, "Tahoma", 20, "Low Desync LBY")
						end
					end
				end

		
			end
		end
	end
end

RegisterCallback("Paint", OnPaint)