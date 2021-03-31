local m_flSize = 40
local RedFactor = 189
local GreenFactor = 10
local BlueFactor = 255
local AlphaFactor = 255
local AlphaFactorFill = 87
local R = RedFactor
local G = GreenFactor
local B = BlueFactor
local A = AlphaFactor
local AF = AlphaFactorFill

function OnPaint()

    if IsDoubleTapActive() then

        m_nLocalPlayerIndex = LocalPlayer()

        if m_nLocalPlayerIndex ~= nil and IsPlayer(m_nLocalPlayerIndex) and GetIsAlive(m_nLocalPlayerIndex) then
        
            m_flX, m_flY, m_flZ = GetEntityProp(m_nLocalPlayerIndex, "DT_BasePlayer", "m_vecOrigin")
        
            if m_flX ~= nil then
        
                m_flCenterX, m_flCenterY = WorldToScreen(m_flX, m_flY, m_flZ)
                m_flFrontX, m_flFrontY = WorldToScreen(m_flX + m_flSize, m_flY, m_flZ)
                m_flFrontRightX, m_flFrontRightY = WorldToScreen(m_flX + m_flSize, m_flY + m_flSize, m_flZ)
                m_flRightX, m_flRightY = WorldToScreen(m_flX, m_flY + m_flSize, m_flZ)
                m_flBackRightX, m_flBackRightY = WorldToScreen(m_flX - m_flSize, m_flY + m_flSize, m_flZ)
                m_flBackX, m_flBackY = WorldToScreen(m_flX - m_flSize, m_flY, m_flZ)
                m_flBackLeftX, m_flBackLeftY = WorldToScreen(m_flX - m_flSize, m_flY - m_flSize, m_flZ)
                m_flLeftX, m_flLeftY = WorldToScreen(m_flX, m_flY - m_flSize, m_flZ)
                m_flFrontLeftX, m_flFrontLeftY = WorldToScreen(m_flX + m_flSize, m_flY - m_flSize, m_flZ)
            
                if m_flCenterX ~= nil and m_flFrontX ~= nil and m_flFrontRightX ~= nil and m_flRightX ~= nil and m_flBackRightX ~= nil and 
                m_flBackX ~= nil and m_flBackLeftX ~= nil and m_flLeftX ~= nil and m_flFrontLeftX ~= nil then
                
                    DrawCircle3D(m_flX, m_flY, m_flZ, m_flSize, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    --[[DrawLine(m_flCenterX, m_flCenterY, m_flFrontX, m_flFrontY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    DrawLine(m_flCenterX, m_flCenterY, m_flFrontRightX, m_flFrontRightY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    DrawLine(m_flCenterX, m_flCenterY, m_flRightX, m_flRightY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    DrawLine(m_flCenterX, m_flCenterY, m_flBackRightX, m_flBackRightY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    DrawLine(m_flCenterX, m_flCenterY, m_flBackX, m_flBackY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    DrawLine(m_flCenterX, m_flCenterY, m_flBackLeftX, m_flBackLeftY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    DrawLine(m_flCenterX, m_flCenterY, m_flLeftX, m_flLeftY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)
                    DrawLine(m_flCenterX, m_flCenterY, m_flFrontLeftX, m_flFrontLeftY, RedFactor, GreenFactor, BlueFactor, AlphaFactor)]]
                
                    m_nTicksRecharged = GetRechargedTicks()
                    
                    if m_nTicksRecharged > 0 then
                        
                        m_flPIMult = m_nTicksRecharged / 16
                        m_flFinishRad = m_flPIMult * math.pi * 2;

                        DrawCone3D(m_flX, m_flY, m_flZ, 0, m_flFinishRad, m_flSize, R, G, B, AF)

                    end

                    --[[if m_nTicksRecharged > 0 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flFrontX, m_flFrontY, m_flFrontRightX, m_flFrontRightY, R, G, B, A)

                    end

                    if m_nTicksRecharged > 2 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flFrontRightX, m_flFrontRightY, m_flRightX, m_flRightY, R, G, B, A)

                    end

                    if m_nTicksRecharged > 4 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flRightX, m_flRightY, m_flBackRightX, m_flBackRightY, R, G, B, A)

                    end

                    if m_nTicksRecharged > 6 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flBackRightX, m_flBackRightY, m_flBackX, m_flBackY, R, G, B, A)

                    end

                    if m_nTicksRecharged > 8 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flBackX, m_flBackY, m_flBackLeftX, m_flBackLeftY, R, G, B, A)

                    end

                    if m_nTicksRecharged > 10 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flBackLeftX, m_flBackLeftY, m_flLeftX, m_flLeftY, R, G, B, A)

                    end

                    if m_nTicksRecharged > 12 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flLeftX, m_flLeftY, m_flFrontLeftX, m_flFrontLeftY, R, G, B, A)

                    end

                    if m_nTicksRecharged > 14 then

                        DrawPolygon(m_flCenterX, m_flCenterY, m_flFrontLeftX, m_flFrontLeftY, m_flFrontX, m_flFrontY, R, G, B, A)

                    end]]

                end
            
            end

        end
    
    end

end

RegisterCallback("Paint", OnPaint)