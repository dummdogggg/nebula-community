--[[
    Script: ReplicatedStorage.Client.Effects.bulletTrail
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: bulletTrail ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy)
    local l_Magnitude_0 = (v3 - v4).Magnitude;
    local v6 = l_Magnitude_0 / 400;
    local v7 = TweenInfo.new(v6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v8 = l_ReplicatedStorage_0.Assets.BulletTrail:Clone();
    v8.CFrame = CFrame.lookAt(v3, v4);
    v8.StartAttachment.Position = Vector3.new(0, 0, 0, 0);
    v8.EndAttachment.Position = Vector3.new(0, 0, -l_Magnitude_0);
    v8.Parent = l_Workspace_0;
    local v9 = l_TweenService_0:Create(v8.StartAttachment, v7, {
        Position = v8.EndAttachment.Position
    });
    v9:Play();
    v9.Completed:Once(function() --[[ Line: 20 ]]
        -- upvalues: v8 (copy)
        v8:Destroy();
    end);
end;