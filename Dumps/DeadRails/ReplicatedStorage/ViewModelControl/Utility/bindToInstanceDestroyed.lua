--[[
    Script: ReplicatedStorage.ViewModelControl.Utility.bindToInstanceDestroyed
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_DestructionHandler_0 = script.DestructionHandler;
return function(v2, v3) --[[ Line: 10 ]] --[[ Name: bindToInstanceDestroyed ]]
    -- upvalues: l_DestructionHandler_0 (copy), l_LocalPlayer_0 (copy)
    local v4 = l_DestructionHandler_0:Clone();
    v4.Parent = l_LocalPlayer_0.PlayerScripts;
    task.defer(function() --[[ Line: 15 ]]
        -- upvalues: v4 (copy), v2 (copy), v3 (copy)
        v4.Bind:Fire(v2, v3);
    end);
end;