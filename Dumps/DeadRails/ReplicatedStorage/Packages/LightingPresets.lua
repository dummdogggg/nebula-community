--[[
    Script: ReplicatedStorage.Packages.LightingPresets
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require("./LightingPresets/Properties");
local l_Linear_0 = Enum.EasingStyle.Linear;
local l_Out_0 = Enum.EasingDirection.Out;
local v58 = {
    setLighting = function(v5) --[[ Line: 19 ]] --[[ Name: setLighting ]]
        -- upvalues: l_Lighting_0 (copy), v2 (copy)
        for _, v7 in l_Lighting_0:GetChildren() do
            if not v5:FindFirstChild(v7.Name) then
                v7:Destroy();
            end;
        end;
        if not v5:FindFirstChild("Clouds") then
            local l_Clouds_0 = workspace.Terrain:FindFirstChildOfClass("Clouds");
            if l_Clouds_0 then
                l_Clouds_0:Destroy();
            end;
        end;
        for _, v10 in v2.Lighting do
            local l_v5_Attribute_0 = v5:GetAttribute(v10);
            if l_v5_Attribute_0 ~= nil then
                l_Lighting_0[v10] = l_v5_Attribute_0;
            end;
        end;
        for _, v13 in v5:GetChildren() do
            if v13.Name == "Clouds" then
                local l_Clouds_1 = workspace.Terrain:FindFirstChild("Clouds");
                if not l_Clouds_1 then
                    l_Clouds_1 = Instance.new("Clouds");
                    l_Clouds_1.Parent = workspace.Terrain;
                end;
                for _, v16 in v2[v13.Name] do
                    local l_v13_Attribute_0 = v13:GetAttribute(v16);
                    if l_v13_Attribute_0 ~= nil then
                        l_Clouds_1[v16] = l_v13_Attribute_0;
                    end;
                end;
            elseif v2[v13.ClassName] then
                local l_l_Lighting_0_FirstChild_0 = l_Lighting_0:FindFirstChild(v13.Name);
                if not l_l_Lighting_0_FirstChild_0 then
                    local v19 = v13:Clone();
                    v19.Parent = l_Lighting_0;
                    l_l_Lighting_0_FirstChild_0 = v19;
                end;
                for _, v21 in v2[v13.ClassName] do
                    l_l_Lighting_0_FirstChild_0[v21] = v13[v21];
                end;
            end;
        end;
    end, 
    tweenLightingAsync = function(v22, v23, v24, v25) --[[ Line: 85 ]] --[[ Name: tweenLightingAsync ]]
        -- upvalues: l_Lighting_0 (copy), l_Linear_0 (copy), l_Out_0 (copy), v2 (copy), l_TweenService_0 (copy)
        for _, v27 in l_Lighting_0:GetChildren() do
            if not v22:FindFirstChild(v27.Name) then
                v27:Destroy();
            end;
        end;
        if not v22:FindFirstChild("Clouds") then
            local l_Clouds_2 = workspace.Terrain:FindFirstChildOfClass("Clouds");
            if l_Clouds_2 then
                l_Clouds_2:Destroy();
            end;
        end;
        local v29 = TweenInfo.new(v23, v24 or l_Linear_0, v25 or l_Out_0);
        local v30 = {};
        for _, v32 in v2.Lighting do
            local l_v22_Attribute_0 = v22:GetAttribute(v32);
            if l_v22_Attribute_0 ~= nil then
                if typeof(l_v22_Attribute_0) == "string" then
                    l_Lighting_0[v32] = l_v22_Attribute_0;
                else
                    v30[v32] = l_v22_Attribute_0;
                end;
            end;
        end;
        if v30.ClockTime and v30.ClockTime < l_Lighting_0.ClockTime then
            local l_ClockTime_0 = v30.ClockTime;
            v30.ClockTime = nil;
            local l_NumberValue_0 = Instance.new("NumberValue");
            l_NumberValue_0.Value = l_Lighting_0.ClockTime;
            local v36 = l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 136 ]]
                -- upvalues: l_Lighting_0 (ref), l_NumberValue_0 (copy)
                l_Lighting_0.ClockTime = l_NumberValue_0.Value % 24;
            end);
            local v37 = l_TweenService_0:Create(l_NumberValue_0, v29, {
                Value = l_ClockTime_0 + 24
            });
            v37.Completed:Once(function() --[[ Line: 141 ]]
                -- upvalues: v36 (copy), l_NumberValue_0 (copy)
                v36:Disconnect();
                l_NumberValue_0:Destroy();
            end);
            v37:Play();
        end;
        l_TweenService_0:Create(l_Lighting_0, v29, v30):Play();
        for _, v39 in v22:GetChildren() do
            if v39.Name == "Clouds" then
                local l_Clouds_3 = workspace.Terrain:FindFirstChild("Clouds");
                if not l_Clouds_3 then
                    l_Clouds_3 = Instance.new("Clouds");
                    l_Clouds_3.Parent = workspace.Terrain;
                end;
                local v41 = {};
                for _, v43 in v2[v39.Name] do
                    local l_v39_Attribute_0 = v39:GetAttribute(v43);
                    if l_v39_Attribute_0 ~= nil then
                        if typeof(l_v39_Attribute_0) == "string" then
                            l_Clouds_3[v43] = l_v39_Attribute_0;
                        else
                            v41[v43] = l_v39_Attribute_0;
                        end;
                    end;
                end;
                l_TweenService_0:Create(l_Clouds_3, v29, v41):Play();
            elseif v2[v39.ClassName] then
                local l_l_Lighting_0_FirstChild_1 = l_Lighting_0:FindFirstChild(v39.Name);
                if not l_l_Lighting_0_FirstChild_1 then
                    local v46 = v39:Clone();
                    v46.Parent = l_Lighting_0;
                    l_l_Lighting_0_FirstChild_1 = v46;
                end;
                local v47 = {};
                for _, v49 in v2[v39.ClassName] do
                    local v50 = v39[v49];
                    if v50 ~= nil then
                        if typeof(v50) == "string" then
                            l_l_Lighting_0_FirstChild_1[v49] = v50;
                        else
                            v47[v49] = v50;
                        end;
                    end;
                end;
                l_TweenService_0:Create(l_l_Lighting_0_FirstChild_1, v29, v47):Play();
            end;
        end;
        task.wait(v23);
    end, 
    createPreset = function(v51, v52) --[[ Line: 214 ]] --[[ Name: createPreset ]]
        -- upvalues: v2 (copy)
        local l_Configuration_0 = Instance.new("Configuration");
        for v54, v55 in v51 do
            if table.find(v2.Lighting, v54) then
                l_Configuration_0:SetAttribute(v54, v55);
            end;
        end;
        if v52 then
            for _, v57 in v52 do
                v57.Parent = l_Configuration_0;
            end;
        end;
        return l_Configuration_0;
    end
};
v58.createPresetFromCurrentSettings = function() --[[ Line: 234 ]] --[[ Name: createPresetFromCurrentSettings ]]
    -- upvalues: v2 (copy), l_Lighting_0 (copy), v58 (copy)
    local v59 = {};
    local v60 = {};
    for _, v62 in v2.Lighting do
        v59[v62] = l_Lighting_0[v62];
    end;
    local l_Clouds_4 = workspace.Terrain:FindFirstChildOfClass("Clouds");
    if l_Clouds_4 then
        local l_Configuration_1 = Instance.new("Configuration");
        l_Configuration_1.Name = "Clouds";
        for _, v66 in v2.Clouds do
            l_Configuration_1:SetAttribute(v66, l_Clouds_4[v66]);
        end;
        table.insert(v60, l_Configuration_1);
    end;
    for _, v68 in l_Lighting_0:GetChildren() do
        if v68:IsA("PostEffect") or v68:IsA("Atmosphere") or v68:IsA("Sky") then
            table.insert(v60, (v68:Clone()));
        end;
    end;
    return v58.createPreset(v59, v60);
end;
return v58;