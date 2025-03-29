--[[
    Script: ReplicatedStorage.Client.Handlers.ControllerAimAssistHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v6 = require(l_Shared_0.Utils.TypeValidators.validateLivingCharacter);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v9 = false;
local function v18() --[[ Line: 23 ]] --[[ Name: getAimAssistTarget ]]
    -- upvalues: l_LocalPlayer_0 (copy), v6 (copy), l_CollectionService_0 (copy), l_CurrentCamera_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not v6(l_Character_0) then
        return;
    else
        local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
        local v12 = nil;
        local v13 = 10;
        for _, v15 in l_CollectionService_0:GetTagged("Enemy") do
            if v6(v15) then
                local l_HumanoidRootPart_1 = v15:FindFirstChild("HumanoidRootPart");
                if not l_HumanoidRootPart_1 then
                    return;
                elseif (l_HumanoidRootPart_1.Position - l_HumanoidRootPart_0.Position).Magnitude < 200 then
                    local v17 = math.deg((math.acos((l_CurrentCamera_0.CFrame.LookVector:Dot((l_HumanoidRootPart_1.Position - l_CurrentCamera_0.CFrame.Position).Unit)))));
                    if v17 < v13 then
                        v13 = v17;
                        v12 = l_HumanoidRootPart_1;
                    end;
                end;
            end;
        end;
        return v12;
    end;
end;
local function v21() --[[ Line: 68 ]] --[[ Name: canEnableAimAssist ]]
    -- upvalues: v6 (copy), l_LocalPlayer_0 (copy)
    if not v6(l_LocalPlayer_0.Character) then
        return false;
    else
        for _, v20 in l_LocalPlayer_0.Character:GetChildren() do
            if v20:IsA("Tool") and v20:HasTag("Weapon") then
                return true;
            end;
        end;
        return false;
    end;
end;
l_ContextActionService_0:BindAction("AimAssist", function(_, v23, _) --[[ Line: 84 ]] --[[ Name: onAim ]]
    -- upvalues: v9 (ref)
    if v23 == Enum.UserInputState.Begin then
        v9 = true;
    elseif v23 == Enum.UserInputState.End then
        v9 = false;
    end;
    return Enum.ContextActionResult.Pass;
end, false, Enum.KeyCode.ButtonL2);
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 96 ]]
    -- upvalues: v9 (ref), v21 (copy), v18 (copy), l_CurrentCamera_0 (copy)
    if v9 then
        if not v21() then
            return;
        else
            local v25 = v18();
            if v25 then
                local l_CFrame_0 = l_CurrentCamera_0.CFrame;
                local l_Unit_0 = (v25.Position - l_CFrame_0.Position).Unit;
                local v28 = l_CFrame_0.LookVector:Lerp(l_Unit_0, 0.1);
                l_CurrentCamera_0.CFrame = CFrame.new(l_CFrame_0.Position, l_CFrame_0.Position + v28);
            end;
        end;
    end;
end);