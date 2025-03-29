--[[
    Script: ReplicatedStorage.ViewModelControl.Utility.bindToInstanceDestroyed.DestructionHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

script.Bind.Event:Connect(function(v0, v1) --[[ Line: 6 ]]
    local v2 = nil;
    local v3 = nil;
    v3 = v0.AncestryChanged:Connect(function() --[[ Line: 12 ]]
        -- upvalues: v0 (copy), v2 (ref), v3 (ref), v1 (copy)
        if not v0:IsDescendantOf(game) then
            v2:Disconnect();
            v3:Disconnect();
            v1();
            script:Destroy();
        end;
    end);
    v2 = v0.Destroying:Once(function() --[[ Line: 21 ]]
        -- upvalues: v3 (ref), v1 (copy)
        v3:Disconnect();
        v1();
        script:Destroy();
    end);
end);