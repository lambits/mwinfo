CreateConVar("mwinfo_players", 0, FCVAR_ARCHIVE, "Enables Player counter at the top left")

hook.Add("mwinfo-init", "mwinfo-players", function(typetable)
    local i = #typetable + 1
    
    typetable[i] = {}
    
    typetable[i].ConVar = "mwinfo_players"
    typetable[i].Name = "Players"
    typetable[i].Info = function()
        local players = player.GetCount()
        return tostring(players)
    end
end)

