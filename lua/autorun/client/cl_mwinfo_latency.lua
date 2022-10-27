CreateConVar("mwinfo_latency", 0, FCVAR_ARCHIVE, "Enables Ping counter at the top left")

hook.Add("mwinfo-init", "mwinfo-latency", function(typetable)
    local i = #typetable + 1
    
    typetable[i] = {}
    
    typetable[i].ConVar = "mwinfo_latency"
    typetable[i].Name = "Latency"
    typetable[i].Info = function()
        local target = LocalPlayer():GetObserverTarget()
        if not IsValid(target) or not target:IsPlayer() then
            target = LocalPlayer()
        end
        local lag = target:Ping()
        return tostring(lag)
    end
end)

