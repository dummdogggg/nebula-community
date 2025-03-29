--[[
    Script: ReplicatedStorage.Packages.LightningBolt
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_clock_0 = os.clock;
local v1 = nil;
local v2 = nil;
local v3 = nil;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
DiscretePulse = function(v5, v6, v7, v8, v9, v10, v11) --[[ Line: 14 ]] --[[ Name: DiscretePulse ]]
    return (math.clamp(v7 / (2 * v8) - math.abs((v5 - v9 * v6 + 0.5 * v7) / v8), v10, v11));
end;
NoiseBetween = function(v12, v13, v14, v15, v16) --[[ Line: 18 ]] --[[ Name: NoiseBetween ]]
    return v15 + (v16 - v15) * (math.noise(v12, v13, v14) + 0.5);
end;
CubicBezier = function(v17, v18, v19, v20, v21) --[[ Line: 22 ]] --[[ Name: CubicBezier ]]
    return v17 * (1 - v21) ^ 3 + v18 * 3 * v21 * (1 - v21) ^ 2 + v19 * 3 * (1 - v21) * v21 ^ 2 + v20 * v21 ^ 3;
end;
local l_ImageHandleAdornment_0 = Instance.new("ImageHandleAdornment");
l_ImageHandleAdornment_0.Name = "BoltAdorn";
l_ImageHandleAdornment_0.Image = "http://www.roblox.com/asset/?id=4955566540";
l_ImageHandleAdornment_0.Transparency = 1;
l_ImageHandleAdornment_0.Color3 = Color3.new(1, 1, 1);
l_ImageHandleAdornment_0.ZIndex = 0;
l_ImageHandleAdornment_0.Size = Vector2.new(0, 0);
local _ = Random.new();
local v24 = {};
local v25 = {};
v25.__index = v25;
v25.new = function(v26, v27, v28) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: v25 (copy), v3 (ref), l_LocalPlayer_0 (copy), v1 (ref), v2 (ref), l_ImageHandleAdornment_0 (copy), l_clock_0 (copy), v24 (copy)
    local v29 = setmetatable({}, v25);
    v29.Enabled = true;
    v29.Attachment0 = v26;
    v29.Attachment1 = v27;
    local v30 = 0;
    local v31 = 0;
    v29.CurveSize0 = v30;
    v29.CurveSize1 = v31;
    v30 = 0;
    v31 = 2.4;
    v29.MinRadius = v30;
    v29.MaxRadius = v31;
    v29.Frequency = 1;
    v29.AnimationSpeed = 7;
    v29.Thickness = 2;
    v30 = 0.2;
    v31 = 1;
    v29.MinThicknessMultiplier = v30;
    v29.MaxThicknessMultiplier = v31;
    v30 = 0;
    v31 = 1;
    v29.MinTransparency = v30;
    v29.MaxTransparency = v31;
    v29.PulseSpeed = 2;
    v29.PulseLength = 1000000;
    v29.FadeLength = 0.2;
    v29.ContractFrom = 0.5;
    v29.Color = Color3.new(1, 1, 1);
    v29.ColorOffsetSpeed = 3;
    v29.Parts = {};
    v3 = workspace.CurrentCamera;
    if l_LocalPlayer_0.PlayerGui:FindFirstChild("LightningBeams") == nil then
        v1 = Instance.new("ScreenGui");
        v1.Name = "LightningBeams";
        v1.ResetOnSpawn = false;
        v1.Parent = l_LocalPlayer_0.PlayerGui;
        v2 = Instance.new("Part");
        v30 = v2;
        v31 = v2;
        local l_v2_0 = v2;
        local v33 = true;
        local v34 = true;
        local v35 = false;
        v30.Anchored = v33;
        v31.Locked = v34;
        l_v2_0.CanCollide = v35;
        v2.CFrame = CFrame.new();
        v2.Size = Vector3.new(0, 0, 0, 0);
        v2.Transparency = 1;
        v2.Parent = v1;
        v2.Name = "AdorneePart";
    end;
    v30 = v26;
    v31 = v27;
    local l_v1_0 = v1;
    local l_WorldPosition_0 = v30.WorldPosition;
    local v38 = v30.WorldPosition + v30.WorldAxis * v29.CurveSize0;
    local v39 = v31.WorldPosition - v31.WorldAxis * v29.CurveSize1;
    local l_WorldPosition_1 = v31.WorldPosition;
    local l_l_WorldPosition_0_0 = l_WorldPosition_0;
    local l_l_WorldPosition_0_1 = l_WorldPosition_0;
    local v43 = v28 or 30;
    for v44 = 1, v43 do
        local v45 = v44 / v43;
        local v46 = CubicBezier(l_WorldPosition_0, v38, v39, l_WorldPosition_1, v45);
        local v47 = v44 ~= v43 and CFrame.lookAt(l_l_WorldPosition_0_1, v46).Position or v46;
        local v48 = l_ImageHandleAdornment_0:Clone();
        v48.Parent = l_v1_0;
        v48.Adornee = v2;
        v29.Parts[v44] = v48;
        l_l_WorldPosition_0_0 = v47;
        l_l_WorldPosition_0_1 = v46;
    end;
    v29.PartsHidden = false;
    v29.DisabledTransparency = 1;
    v29.StartT = l_clock_0();
    v29.RanNum = math.random() * 100;
    v29.RefIndex = #v24 + 1;
    v24[v29.RefIndex] = v29;
    return v29;
end;
v25.Destroy = function(v49) --[[ Line: 127 ]] --[[ Name: Destroy ]]
    -- upvalues: v24 (copy)
    v24[v49.RefIndex] = nil;
    for v50 = 1, #v49.Parts do
        v49.Parts[v50]:Destroy();
        if v50 % 100 == 0 then
            wait();
        end;
    end;
    v49 = nil;
end;
local l_Cross_0 = Vector3.new().Cross;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 142 ]]
    -- upvalues: v24 (copy), l_clock_0 (copy), l_Cross_0 (copy), v3 (ref)
    for _, v53 in pairs(v24) do
        if v53.Enabled == true then
            v53.PartsHidden = false;
            local v54 = 1 - v53.MaxTransparency;
            local v55 = 1 - v53.MinTransparency;
            local l_MinRadius_0 = v53.MinRadius;
            local l_MaxRadius_0 = v53.MaxRadius;
            local l_Thickness_0 = v53.Thickness;
            local l_Parts_0 = v53.Parts;
            local v60 = #l_Parts_0;
            local l_RanNum_0 = v53.RanNum;
            local l_StartT_0 = v53.StartT;
            local l_AnimationSpeed_0 = v53.AnimationSpeed;
            local l_Frequency_0 = v53.Frequency;
            local l_MinThicknessMultiplier_0 = v53.MinThicknessMultiplier;
            local l_MaxThicknessMultiplier_0 = v53.MaxThicknessMultiplier;
            local l_Attachment0_0 = v53.Attachment0;
            local l_Attachment1_0 = v53.Attachment1;
            local l_CurveSize0_0 = v53.CurveSize0;
            local l_CurveSize1_0 = v53.CurveSize1;
            local l_WorldPosition_2 = l_Attachment0_0.WorldPosition;
            local v72 = l_Attachment0_0.WorldPosition + l_Attachment0_0.WorldAxis * l_CurveSize0_0;
            local v73 = l_Attachment1_0.WorldPosition - l_Attachment1_0.WorldAxis * l_CurveSize1_0;
            local l_WorldPosition_3 = l_Attachment1_0.WorldPosition;
            local v75 = l_clock_0() - l_StartT_0;
            local l_PulseLength_0 = v53.PulseLength;
            local l_PulseSpeed_0 = v53.PulseSpeed;
            local l_FadeLength_0 = v53.FadeLength;
            local l_Color_0 = v53.Color;
            local l_ColorOffsetSpeed_0 = v53.ColorOffsetSpeed;
            local v81 = 1 - v53.ContractFrom;
            local l_l_WorldPosition_2_0 = l_WorldPosition_2;
            local l_l_WorldPosition_2_1 = l_WorldPosition_2;
            if v75 < (l_PulseLength_0 + 1) / l_PulseSpeed_0 then
                for v84 = 1, v60 do
                    local v85 = l_Parts_0[v84];
                    local v86 = v84 / v60;
                    local v87 = DiscretePulse(v86, l_PulseSpeed_0, l_PulseLength_0, l_FadeLength_0, v75, v54, v55);
                    local v88 = CubicBezier(l_WorldPosition_2, v72, v73, l_WorldPosition_3, v86);
                    local v89 = -v75;
                    local v90 = l_AnimationSpeed_0 * v89 + l_Frequency_0 * 10 * v86 - 0.2 + l_RanNum_0 * 4;
                    local v91 = 5 * (l_AnimationSpeed_0 * 0.01 * v89 / 10 + l_Frequency_0 * v86) + l_RanNum_0 * 4;
                    local v92 = NoiseBetween(5 * v90, 1.5, 1 * v91, 0, 0.6283185307179586) + NoiseBetween(0.5 * v90, 1.5, 0.1 * v91, 0, 5.654866776461628);
                    local v93 = NoiseBetween(3.4, v91, v90, l_MinRadius_0, l_MaxRadius_0) * math.exp(-5000 * (v86 - 0.5) ^ 10);
                    local v94 = NoiseBetween(2.3, v91, v90, l_MinThicknessMultiplier_0, l_MaxThicknessMultiplier_0);
                    local v95 = v84 ~= v60 and (CFrame.new(l_l_WorldPosition_2_1, v88) * CFrame.Angles(0, 0, v92) * CFrame.Angles(math.acos((math.clamp(NoiseBetween(v91, v90, 2.7, 6.123233995736766E-17, 1), -1, 1))), 0, 0) * CFrame.new(0, 0, -v93)).Position or v88;
                    local v96 = v95 - l_l_WorldPosition_2_0;
                    if v81 < v87 then
                        v85.Size = Vector2.new(l_Thickness_0 * v94 * v87, v96.Magnitude + l_Thickness_0 * v94 * v87 * 0.2);
                        local v97 = 0.5 * (l_l_WorldPosition_2_0 + v95);
                        local l_Unit_0 = v96.Unit;
                        local l_Unit_1 = l_Cross_0(v3.CFrame.Position - v97, l_Unit_0).Unit;
                        v85.CFrame = CFrame.fromMatrix(v97, l_Unit_1, l_Unit_0);
                        v85.Transparency = 1 - v87;
                    elseif v81 - 1 / (v60 * l_FadeLength_0) < v87 then
                        local v100 = (1 - (v87 - (v81 - 1 / (v60 * l_FadeLength_0))) * v60 * l_FadeLength_0) * (v86 < v75 * l_PulseSpeed_0 - 0.5 * l_PulseLength_0 and 1 or -1);
                        v85.Size = Vector2.new(l_Thickness_0 * v94 * v87, (1 - math.abs(v100)) * v96.Magnitude + l_Thickness_0 * v94 * v87 * 0.2);
                        local v101 = l_l_WorldPosition_2_0 + (v95 - l_l_WorldPosition_2_0) * (math.max(0, v100) + (1 - math.abs(v100)) * 0.5);
                        local l_Unit_2 = v96.Unit;
                        local l_Unit_3 = l_Cross_0(v3.CFrame.Position - v101, l_Unit_2).Unit;
                        v85.CFrame = CFrame.fromMatrix(v101, l_Unit_3, l_Unit_2);
                        v85.Transparency = 1 - v87;
                    else
                        v85.Transparency = 1;
                    end;
                    if typeof(l_Color_0) == "Color3" then
                        v85.Color3 = l_Color_0;
                    else
                        v86 = (l_RanNum_0 + v86 - v75 * l_ColorOffsetSpeed_0) % 1;
                        local l_Keypoints_0 = l_Color_0.Keypoints;
                        for v105 = 1, #l_Keypoints_0 - 1 do
                            if l_Keypoints_0[v105].Time < v86 and v86 < l_Keypoints_0[v105 + 1].Time then
                                v85.Color3 = l_Keypoints_0[v105].Value:lerp(l_Keypoints_0[v105 + 1].Value, (v86 - l_Keypoints_0[v105].Time) / (l_Keypoints_0[v105 + 1].Time - l_Keypoints_0[v105].Time));
                                break;
                            end;
                        end;
                    end;
                    l_l_WorldPosition_2_0 = v95;
                    l_l_WorldPosition_2_1 = v88;
                end;
            else
                v53:Destroy();
            end;
        elseif v53.PartsHidden == false then
            v53.PartsHidden = true;
            local l_DisabledTransparency_0 = v53.DisabledTransparency;
            for v107 = 1, #v53.Parts do
                v53.Parts[v107].Transparency = l_DisabledTransparency_0;
            end;
        end;
    end;
end);
return v25;