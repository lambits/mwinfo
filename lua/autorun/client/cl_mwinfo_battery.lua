CreateConVar("mwinfo_battery", 0, FCVAR_ARCHIVE, "Enables Battery display at the top left")

hook.Add("mwinfo-init", "mwinfo-battery", function(typetable)
    local i = #typetable + 1
    
    typetable[i] = {}
    
    typetable[i].ConVar = "mwinfo_battery"
    typetable[i].Name = "Battery"
    typetable[i].Info = function()
        local battery = system.BatteryPower()
        return tostring(battery .. "%")
    end
end)

