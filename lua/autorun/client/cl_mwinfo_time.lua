CreateConVar("mwinfo_time", 0, FCVAR_ARCHIVE, "Enables Clock display at the top left")

hook.Add("mwinfo-init", "mwinfo-time", function(typetable)
    local i = #typetable + 1
    
    typetable[i] = {}
    
    typetable[i].ConVar = "mwinfo_time"
    typetable[i].Name = ""
    typetable[i].Info = function()
        local time = os.date("%H:%M" , os.time())
        return tostring(time)
    end
end)

