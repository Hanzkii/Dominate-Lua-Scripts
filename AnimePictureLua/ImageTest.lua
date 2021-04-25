local Girl, Girl2

function OnLoadScript()
    Girl = LoadImage("C:\\Users\\Public\\Documents\\Dominate.Systems\\Scripts\\Images\\girl.png")
    Girl2 = LoadImage("C:\\Users\\Public\\Documents\\Dominate.Systems\\Scripts\\Images\\girl2.png")
end

function OnPaint()
    if Girl ~= nil and Girl2 ~= nil then

        --------------------------------For Debugging--------------------------------------------------------------
        local GirlX, GirlY = ImageDiamensions(Girl)  
        local Girl2X, Girl2Y = ImageDiamensions(Girl2) 
        local width, height = GetScreenSize() 
        DrawText(10, 450, 255, 255, 255, 255, "", 20, "ScreenSize: " .. width .. "," .. height, false, true)
        DrawText(10, 500, 255, 255, 255, 255, "", 20, "Girl Image Size: " .. GirlX .. "," .. GirlY, false, true)
        DrawText(10, 550, 255, 255, 255, 255, "", 20, "Girl2 Image Size: " .. Girl2X .. "," .. Girl2Y, false, true)
        -----------------------------------------------------------------------------------------------------------

      --DrawImage(File, ScreenX, ScreenY, Alpha)
        DrawImage(Girl, math.floor((width / 2) - GirlX), math.floor(height - GirlY), 255)
        DrawImage(Girl2, math.floor((width / 3.5) - 600), math.floor(height - Girl2Y - 20), 255)
    end
end

function OnUnloadScript()
        UnloadImage(Girl)
        UnloadImage(Girl2)
end

RegisterCallback("Paint", OnPaint)
RegisterCallback("LoadScript", OnLoadScript)
RegisterCallback("UnloadScript", OnUnloadScript)