--[[
    Script: StarterPlayer.StarterPlayerScripts.LightningTest
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.LightningBolt);
local v2 = require(l_ReplicatedStorage_0.Packages.LightningBolt.LightningExplosion);
local v3 = require(l_ReplicatedStorage_0.Packages.LightningBolt.LightningSparks);
local l_LocalPlayer_0 = game.Players.LocalPlayer;
l_ReplicatedStorage_0.Remotes.LightningReplicate.OnClientEvent:Connect(function(v5, v6, v7) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), l_LocalPlayer_0 (copy)
    local v8 = Random.new(v7);
    local v9 = game.ReplicatedStorage.Assets.LightningModel:Clone();
    v9.Parent = game.Workspace;
    v9.Part1.Position = v5;
    v9.Part2.Position = v6;
    local v10 = v1.new(v9.Part1.Attachment1, v9.Part2.Attachment2, 20);
    local v11 = 15.39600717839002;
    local v12 = 15.39600717839002;
    v10.CurveSize0 = v11;
    v10.CurveSize1 = v12;
    v10.Color = Color3.fromRGB(193, 217, 255);
    v10.AnimationSpeed = 0.5;
    v10.Thickness = 3;
    v10.MinRadius = 0;
    v10.MaxRadius = 20;
    v11 = 1;
    v12 = 1;
    v10.MinThicknessMultiplier = v11;
    v10.MaxThicknessMultiplier = v12;
    v10.ColorOffsetSpeed = 4;
    v10.Frequency = 6;
    v11 = v3.new(v10, 5);
    v12 = 10;
    local v13 = 20;
    v11.MinSpeed = v12;
    v11.MaxSpeed = v13;
    v12 = 3;
    v13 = 6;
    v11.MinDistance = v12;
    v11.MaxDistance = v13;
    v12 = 9;
    v13 = 11;
    v11.MinPartsPerSpark = v12;
    v11.MaxPartsPerSpark = v13;
    v10.Enabled = false;
    v12 = v2.new(v9.Part1.Attachment1.WorldPosition, 0.5, 5, ColorSequence.new(Color3.fromRGB(178, 255, 252)), Color3.fromRGB(221, 255, 202));
    v13 = game.SoundService.Lightning:GetChildren()[v8:NextInteger(1, #game.SoundService.Lightning:GetChildren())]:Clone();
    v13.Parent = v9.Part1;
    v13.PlayOnRemove = true;
    v13:Destroy();
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 then
        local v15 = math.clamp(4 * (1 - (l_Character_0.HumanoidRootPart.Position - v5).Magnitude / 300), 0, 1.5);
        game.Lighting.ExposureCompensation = v15;
        task.delay(0.25, function() --[[ Line: 51 ]]
            game.Lighting.ExposureCompensation = 0;
        end);
    end;
    for _ = 1, 6 do
        v10.Enabled = true;
        task.wait(0.05);
        v10.Enabled = false;
        task.wait(0.015);
    end;
    task.wait(1);
    v10:Destroy();
    v9:Destroy();
end);