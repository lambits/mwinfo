CreateConVar("mwinfo_fps", 0, FCVAR_ARCHIVE, "Enables FPS counter at the top left")

hook.Add("mwinfo-init", "mwinfo-fps", function(typetable)
    local i = #typetable + 1
    
    typetable[i] = {}
    
    typetable[i].ConVar = "mwinfo_fps"
    typetable[i].Name = "FPS"
    typetable[i].Info = function()
        local fps = math.floor(1 / FrameTime())
        return tostring(fps)
    end
end)

