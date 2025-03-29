--[[
    Script: ReplicatedStorage.ViewModelControl.Utility.ViewModelController
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("SoundService");
local l_Workspace_0 = game:GetService("Workspace");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v5 = require(l_ReplicatedStorage_0.ViewModelControl.Utility.Constants);
local v6 = require(l_ReplicatedStorage_0.ViewModelControl.Utility.lerp);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local v8 = {};
v8.__index = v8;
local v9 = {
    Revolver = l_ReplicatedStorage_0.ViewModelControl.ViewModels.RevolverViewModel, 
    Rifle = l_ReplicatedStorage_0.ViewModelControl.ViewModels.RifleViewModel, 
    Shotgun = l_ReplicatedStorage_0.ViewModelControl.ViewModels.ShotgunViewModel, 
    ["Sawed-Off Shotgun"] = l_ReplicatedStorage_0.ViewModelControl.ViewModels.SawedOffShotgunViewModel, 
    Molotov = l_ReplicatedStorage_0.ViewModelControl.ViewModels.MolotovViewModel, 
    Mauser = l_ReplicatedStorage_0.ViewModelControl.ViewModels.MauserViewModel, 
    ["Holy Water"] = l_ReplicatedStorage_0.ViewModelControl.ViewModels.HolyWaterViewModel, 
    ["Navy Revolver"] = l_ReplicatedStorage_0.ViewModelControl.ViewModels.NavyRevolverViewModel, 
    ["Bolt Action Rifle"] = l_ReplicatedStorage_0.ViewModelControl.ViewModels.BoltActionRifleViewModel, 
    Electrocutioner = l_ReplicatedStorage_0.ViewModelControl.ViewModels.ElectrocutionerViewModel
};
v8.new = function(v10) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: l_LocalPlayer_0 (copy), v9 (copy), v8 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        local v12 = v9[v10.Name];
        if not v12 then
            return;
        else
            local v13 = v12:Clone();
            local l_Color_0 = l_Character_0["Right Arm"].Color;
            v13.RightArm.Color = l_Color_0;
            v13.LeftArm.Color = l_Color_0;
            v13.Parent = game.Workspace;
            local l_Animator_0 = v13.AnimationController.Animator;
            local l_Animations_0 = v13.Animations;
            local v17 = l_Animator_0:LoadAnimation(l_Animations_0.Hold);
            local v18 = nil;
            local v19 = nil;
            if l_Animations_0:FindFirstChild("Shoot") then
                v18 = l_Animator_0:LoadAnimation(l_Animations_0.Shoot);
            end;
            if l_Animations_0:FindFirstChild("Reload") then
                v19 = l_Animator_0:LoadAnimation(l_Animations_0.Reload);
            end;
            local v20 = {
                enabled = false, 
                model = v13, 
                stride = 0, 
                bobbing = 0, 
                toolInstance = v10, 
                handle = v10.Handle, 
                holdAnim = v17, 
                shootAnim = v18, 
                reloadAnim = v19, 
                char = l_Character_0
            };
            setmetatable(v20, v8);
            return v20;
        end;
    end;
end;
v8.update = function(v21, v22) --[[ Line: 91 ]] --[[ Name: update ]]
    -- upvalues: v5 (copy), v6 (copy), l_CurrentCamera_0 (copy), l_Workspace_0 (copy)
    local v23 = (v21.handle.AssemblyLinearVelocity * Vector3.new(1, 0, 1, 0)).Magnitude * v5.VIEW_MODEL_BOBBING_SPEED;
    local v24 = math.min(v23, 1);
    v21.stride = (v21.stride + v23 * v22) % 6.283185307179586;
    v21.bobbing = v6(v21.bobbing, v24, (math.min(v22 * v5.VIEW_MODEL_BOBBING_TRANSITION_SPEED, 1)));
    local v25 = RaycastParams.new();
    v25.FilterType = Enum.RaycastFilterType.Exclude;
    v25.FilterDescendantsInstances = {
        v21.char, 
        v21.model
    };
    local v26 = l_CurrentCamera_0.CFrame * v5.VIEW_MODEL_OFFSET;
    local v27 = l_Workspace_0:Raycast(v26.Position, v26.LookVector * v21.model.Configuration.HoldDistance.Value, v25);
    local v28 = Vector3.new(math.sin(v21.stride), math.sin(v21.stride * 2), 0) * v5.VIEW_MODEL_BOBBING_AMOUNT * v21.bobbing;
    local v29 = CFrame.new(v28);
    local v30 = Vector3.new(0, 0, 0, 0);
    if v27 then
        v30 = Vector3.new(0, 0, v21.model.Configuration.HoldDistance.Value - v27.Distance - 0.7);
    end;
    v21.model:PivotTo(l_CurrentCamera_0.CFrame * (v5.VIEW_MODEL_OFFSET + v30) * v29);
end;
v8.checkForToolInstance = function(v31, v32) --[[ Line: 127 ]] --[[ Name: checkForToolInstance ]]
    if not v32:IsA("BasePart") and not v32:IsA("Decal") then
        return;
    elseif not v32:FindFirstAncestorOfClass("Tool") then
        return;
    else
        table.insert(v31.toolInstances, v32);
        return;
    end;
end;
v8.playShootAnimation = function(v33) --[[ Line: 142 ]] --[[ Name: playShootAnimation ]]
    v33.shootAnim:Play();
    v33.model.Handle.Attachment.Flash:Emit(1);
    v33.model.Handle.Shoot:Play();
end;
v8.playThrowAnimation = function(v34) --[[ Line: 150 ]] --[[ Name: playThrowAnimation ]]
    v34.shootAnim:Play();
    task.wait(0.25);
    local l_Effect_0 = v34.model.Handle:FindFirstChild("Effect");
    if l_Effect_0 then
        l_Effect_0.Enabled = true;
    end;
    local l_BeforeThrowSound_0 = v34.model.Handle:FindFirstChild("BeforeThrowSound");
    if l_BeforeThrowSound_0 then
        l_BeforeThrowSound_0:Play();
    end;
end;
v8.playReloadAnimation = function(v37, v38, v39) --[[ Line: 169 ]] --[[ Name: playReloadAnimation ]]
    local l_reloadAnim_0 = v37.reloadAnim;
    local v41 = v39 / v38;
    local v42 = l_reloadAnim_0.Length / v41;
    v37.shootAnim:Stop();
    local _ = os.clock();
    for _ = 1, v38 do
        v37.model.Handle.Reload.PlaybackSpeed = math.random(90, 110) / 100;
        v37.model.Handle.Reload:Play();
        l_reloadAnim_0:Play(nil, nil, v42);
        l_reloadAnim_0.Stopped:Wait();
    end;
    v37.model.Handle.ReloadFinish:Play();
end;
v8.cancelReloadAnimation = function(v45) --[[ Line: 192 ]] --[[ Name: cancelReloadAnimation ]]
    v45.reloadAnim:Stop();
end;
v8.enable = function(v46) --[[ Line: 196 ]] --[[ Name: enable ]]
    -- upvalues: l_RunService_0 (copy), v5 (copy), l_Workspace_0 (copy)
    if v46.enabled then
        return;
    else
        v46.enabled = true;
        for _, v48 in pairs(v46.toolInstance:GetDescendants()) do
            if v48:IsA("BasePart") then
                v48.LocalTransparencyModifier = 1;
            elseif v48:IsA("SurfaceGui") then
                v48.Enabled = false;
            end;
        end;
        l_RunService_0:BindToRenderStep(v5.VIEW_MODEL_BIND_NAME, Enum.RenderPriority.Camera.Value + 1, function(v49) --[[ Line: 213 ]]
            -- upvalues: v46 (copy)
            v46:update(v49);
        end);
        v46.model.Parent = l_Workspace_0;
        v46.holdAnim:Play();
        return;
    end;
end;
v8.disable = function(v50) --[[ Line: 223 ]] --[[ Name: disable ]]
    -- upvalues: l_RunService_0 (copy), v5 (copy)
    if not v50.enabled then
        return;
    else
        v50.enabled = false;
        l_RunService_0:UnbindFromRenderStep(v5.VIEW_MODEL_BIND_NAME);
        v50.model.Parent = nil;
        v50.holdAnim:Stop();
        return;
    end;
end;
v8.destroy = function(v51) --[[ Line: 235 ]] --[[ Name: destroy ]]
    v51:disable();
    v51.model:Destroy();
end;
return v8;