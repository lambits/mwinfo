MWInfo = MWInfo or {}
MWInfo.Types = MWInfo.Types or {}

surface.CreateFont("mwtype-font-name", {
    font = "Roboto",
    size = 18,
    weight = 500,
})

surface.CreateFont("mwtype-font-info", {
    font = "Roboto",
    size = 18,
    weight = 1000,
})

hook.Add("InitPostEntity", "mwinfo-trueinit", function()
    hook.Run("mwinfo-init", MWInfo.Types)
end)

hook.Add("Think", "mwinfo-updatetable", function()
    table.sort(MWInfo.Types, function(a, b)
        return GetConVar(a.ConVar):GetInt() < GetConVar(b.ConVar):GetInt()
    end)
end)

local nameColor = Color(150, 150, 150)
local infoColor = Color(200, 200, 200)
local bgColor = Color(0, 0, 0, 200)
hook.Add("DrawOverlay", "mwinfo-update", function()
    if not IsValid(LocalPlayer()) then return end

    local totalsize = 0
    for k, v in ipairs(MWInfo.Types) do
        --[[
            v.ConVar = "mwinfo_fps"
            v.Name = "FPS"
            v.Info = provide a function that returns a string
        ]]
        if GetConVar(v.ConVar):GetBool() then
            local firstx, firsty = 0, 0
            local firstEmpty = (v.Name == "" or v.Name == nil)
            if not firstEmpty then
                surface.SetFont("mwtype-font-info")
                firstx, firsty = surface.GetTextSize(" " .. v.Name .. ": ")
            end
            
            surface.SetFont(firstEmpty and "mwtype-font-info" or "mwtype-font-name")
            local calculationString = (firstEmpty and " " or "") .. v.Info() .. " "
            local secondx, secondy = surface.GetTextSize(calculationString)
            firsty = secondy

            totalsize = totalsize + 5 + secondx + (firstEmpty and 0 or firstx)
            draw.RoundedBox(0, totalsize - (firstEmpty and 0 or firstx) - secondx, 0, (firstEmpty and 0 or firstx) + secondx, firsty, bgColor)
            if not firstEmpty then
                draw.SimpleText(" " .. v.Name .. ": ", "mwtype-font-info", totalsize - (firstx + secondx), 0, infoColor)
            end

            draw.SimpleText(calculationString, (firstEmpty and "mwtype-font-info" or "mwtype-font-name"), totalsize - secondx, 0, (firstEmpty and infoColor or nameColor))
        end
    end
end)
