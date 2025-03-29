--[[
    Script: ReplicatedStorage.Client.Effects.bulletImpact
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Workspace");
local l_SoundService_0 = game:GetService("SoundService");
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local _ = require(l_Shared_0.Utils.castRays);
local v11 = {
    [Enum.Material.Metal] = {
        soundFolder = l_SoundService_0.BulletSounds.Metal, 
        effect = function(v5, _) --[[ Line: 11 ]] --[[ Name: effect ]]
            local l_Sparks_0 = v5:FindFirstChild("Sparks");
            if l_Sparks_0 then
                l_Sparks_0:Emit(25);
            end;
        end
    }, 
    [Enum.Material.Wood] = {
        soundFolder = l_SoundService_0.BulletSounds.Wood, 
        effect = function(v8, v9) --[[ Line: 22 ]] --[[ Name: effect ]]
            local l_Blood_0 = v8:FindFirstChild("Blood");
            if l_Blood_0 then
                l_Blood_0.Color = ColorSequence.new(v9.Color);
                l_Blood_0:Emit(25);
            end;
        end
    }
};
v11[Enum.Material.DiamondPlate] = v11[Enum.Material.Metal];
v11[Enum.Material.WoodPlanks] = v11[Enum.Material.Wood];
local v15 = {
    soundFolder = l_SoundService_0.BulletSounds.Dirt, 
    effect = function(v12, v13) --[[ Line: 44 ]] --[[ Name: effect ]]
        local l_Blood_1 = v12:FindFirstChild("Blood");
        if l_Blood_1 then
            l_Blood_1.Color = ColorSequence.new(v13.Color);
            l_Blood_1:Emit(25);
        end;
    end
};
return function(v16, v17) --[[ Line: 54 ]] --[[ Name: bulletImpact ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v11 (copy), v15 (copy)
    local v18 = l_ReplicatedStorage_0.Assets.BloodAttachholder.BloodAttach:Clone();
    v18.Position = v17.position;
    v18.Parent = workspace.Terrain;
    local v19 = Random.new(v16);
    if v17.taggedHumanoid and v17.instance then
        local v20 = false;
        local l_instance_0 = v17.instance;
        local l_FirstAncestorOfClass_0 = v17.instance:FindFirstAncestorOfClass("Model");
        if l_FirstAncestorOfClass_0 then
            if l_FirstAncestorOfClass_0:GetAttribute("BloodColor") then
                v18.Blood.Color = ColorSequence.new(l_FirstAncestorOfClass_0:GetAttribute("BloodColor"));
            end;
            local l_l_FirstAncestorOfClass_0_FirstChild_0 = l_FirstAncestorOfClass_0:FindFirstChild(v17.instance.Name .. "_Armor");
            if l_l_FirstAncestorOfClass_0_FirstChild_0 then
                local l_l_l_FirstAncestorOfClass_0_FirstChild_0_Attribute_0 = l_l_FirstAncestorOfClass_0_FirstChild_0:GetAttribute("ArmorCoverPercent");
                if not l_l_l_FirstAncestorOfClass_0_FirstChild_0_Attribute_0 then
                    warn("Armor is missing number Attribute ArmorCoverPercent", l_l_FirstAncestorOfClass_0_FirstChild_0.Name);
                end;
                if v19:NextInteger(0, 100) < l_l_l_FirstAncestorOfClass_0_FirstChild_0_Attribute_0 then
                    v20 = true;
                    local l_l_l_FirstAncestorOfClass_0_FirstChild_0_FirstChildWhichIsA_0 = l_l_FirstAncestorOfClass_0_FirstChild_0:FindFirstChildWhichIsA("MeshPart", true);
                    if l_l_l_FirstAncestorOfClass_0_FirstChild_0_FirstChildWhichIsA_0 then
                        l_instance_0 = l_l_l_FirstAncestorOfClass_0_FirstChild_0_FirstChildWhichIsA_0;
                    end;
                end;
            end;
        end;
        if v20 then
            local v26 = v11[Enum.Material.Metal];
            local l_Children_0 = v26.soundFolder:GetChildren();
            local v28 = l_Children_0[math.random(1, #l_Children_0)]:Clone();
            v28.PlaybackSpeed = math.random(80, 120) / 100;
            v28.Parent = v18;
            task.wait();
            v28:Play();
            v26.effect(v18, l_instance_0);
        else
            if (v17.instance.Name == "Head" or v17.instance.Name == "VisualHead") and not v17.instance:GetAttribute("SoundCooldown") then
                v18.HeadHit:Play();
                v17.instance:SetAttribute("SoundCooldown", true);
                task.delay(0.15, function() --[[ Line: 111 ]]
                    -- upvalues: v17 (copy)
                    if v17.instance:IsDescendantOf(workspace) then
                        v17.instance:SetAttribute("SoundCooldown", false);
                    end;
                end);
            else
                local l_Parent_0 = v17.taggedHumanoid.Parent;
                if not l_Parent_0:GetAttribute("BodyShotCooldown") then
                    v18.BodyHit:Play();
                    l_Parent_0:SetAttribute("BodyShotCooldown", true);
                    task.delay(0.15, function() --[[ Line: 121 ]]
                        -- upvalues: l_Parent_0 (copy)
                        if l_Parent_0:IsDescendantOf(workspace) then
                            l_Parent_0:SetAttribute("BodyShotCooldown", false);
                        end;
                    end);
                else
                    v18.BodyHit.Volume = 0.1;
                    v18.BodyHit:Play();
                end;
            end;
            v18.Blood:Emit(50);
        end;
    elseif v17.instance then
        local v30 = v11[v17.material] or v15;
        local l_Children_1 = v30.soundFolder:GetChildren();
        local v32 = l_Children_1[math.random(1, #l_Children_1)]:Clone();
        v32.PlaybackSpeed = math.random(80, 120) / 100;
        v32.Parent = v18;
        task.wait();
        v32:Play();
        v30.effect(v18, v17.instance);
    end;
    task.delay(1, function() --[[ Line: 152 ]]
        -- upvalues: v18 (copy)
        v18:Destroy();
    end);
end;