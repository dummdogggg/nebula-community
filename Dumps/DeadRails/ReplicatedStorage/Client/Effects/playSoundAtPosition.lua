--[[
    Script: ReplicatedStorage.Client.Effects.playSoundAtPosition
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0, v1) --[[ Line: 3 ]] --[[ Name: playSoundAtPosition ]]
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.WorldPosition = v1;
    l_Attachment_0.Parent = workspace.Terrain;
    local v3 = v0:Clone();
    v3.Parent = l_Attachment_0;
    v3:Play();
    v3.Ended:Once(function() --[[ Line: 12 ]]
        -- upvalues: l_Attachment_0 (copy)
        l_Attachment_0:Destroy();
    end);
end;