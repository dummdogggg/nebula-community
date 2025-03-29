--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = {};
v0.__index = v0;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local l_CommonUtils_0 = script.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_Keyboard_0 = require(script:WaitForChild("Keyboard"));
local l_Gamepad_0 = require(script:WaitForChild("Gamepad"));
local l_DynamicThumbstick_0 = require(script:WaitForChild("DynamicThumbstick"));
local v13 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate");
end);
v13 = l_status_0 and l_result_0;
l_status_0 = l_FlagUtil_0.getUserFlag("UserControlModuleEnableIdempotent");
l_result_0 = require(script:WaitForChild("TouchThumbstick"));
local l_ClickToMoveController_0 = require(script:WaitForChild("ClickToMoveController"));
local l_TouchJump_0 = require(script:WaitForChild("TouchJump"));
local l_VehicleController_0 = require(script:WaitForChild("VehicleController"));
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local v20 = {
    [Enum.TouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbstick] = l_result_0, 
    [Enum.DevTouchMovementMode.Thumbstick] = l_result_0, 
    [Enum.TouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.ClickToMove] = l_ClickToMoveController_0, 
    [Enum.DevTouchMovementMode.ClickToMove] = l_ClickToMoveController_0, 
    [Enum.TouchMovementMode.Default] = l_DynamicThumbstick_0, 
    [Enum.ComputerMovementMode.Default] = l_Keyboard_0, 
    [Enum.ComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.Scriptable] = nil, 
    [Enum.ComputerMovementMode.ClickToMove] = l_ClickToMoveController_0, 
    [Enum.DevComputerMovementMode.ClickToMove] = l_ClickToMoveController_0
};
local v21 = {
    [Enum.UserInputType.Keyboard] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton1] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton2] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton3] = l_Keyboard_0, 
    [Enum.UserInputType.MouseWheel] = l_Keyboard_0, 
    [Enum.UserInputType.MouseMovement] = l_Keyboard_0, 
    [Enum.UserInputType.Gamepad1] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad2] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad3] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad4] = l_Gamepad_0
};
local v22 = nil;
v0.new = function() --[[ Line: 95 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), l_VehicleController_0 (copy), l_Value_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), l_GuiService_0 (copy)
    local v23 = setmetatable({}, v0);
    v23.controllers = {};
    v23.activeControlModule = nil;
    v23.activeController = nil;
    v23.touchJumpController = nil;
    v23.moveFunction = l_Players_0.LocalPlayer.Move;
    v23.humanoid = nil;
    v23.lastInputType = Enum.UserInputType.None;
    v23.controlsEnabled = true;
    v23.humanoidSeatedConn = nil;
    v23.vehicleController = nil;
    v23.touchControlFrame = nil;
    v23.currentTorsoAngle = 0;
    v23.inputMoveVector = Vector3.new(0, 0, 0, 0);
    v23.vehicleController = l_VehicleController_0.new(l_Value_0);
    l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v24) --[[ Line: 121 ]]
        -- upvalues: v23 (copy)
        v23:OnCharacterAdded(v24);
    end);
    l_Players_0.LocalPlayer.CharacterRemoving:Connect(function(v25) --[[ Line: 122 ]]
        -- upvalues: v23 (copy)
        v23:OnCharacterRemoving(v25);
    end);
    if l_Players_0.LocalPlayer.Character then
        v23:OnCharacterAdded(l_Players_0.LocalPlayer.Character);
    end;
    l_RunService_0:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(v26) --[[ Line: 127 ]]
        -- upvalues: v23 (copy)
        v23:OnRenderStepped(v26);
    end);
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v27) --[[ Line: 131 ]]
        -- upvalues: v23 (copy)
        v23:OnLastInputTypeChanged(v27);
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 136 ]]
        -- upvalues: v23 (copy)
        v23:OnTouchMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 139 ]]
        -- upvalues: v23 (copy)
        v23:OnTouchMovementModeChange();
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 143 ]]
        -- upvalues: v23 (copy)
        v23:OnComputerMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 146 ]]
        -- upvalues: v23 (copy)
        v23:OnComputerMovementModeChange();
    end);
    v23.playerGui = nil;
    v23.touchGui = nil;
    v23.playerGuiAddedConn = nil;
    l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 155 ]]
        -- upvalues: v23 (copy)
        v23:UpdateTouchGuiVisibility();
        v23:UpdateActiveControlModuleEnabled();
    end);
    if l_UserInputService_0.TouchEnabled then
        v23.playerGui = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if v23.playerGui then
            v23:CreateTouchGuiContainer();
            v23:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
            return v23;
        else
            v23.playerGuiAddedConn = l_Players_0.LocalPlayer.ChildAdded:Connect(function(v28) --[[ Line: 166 ]]
                -- upvalues: v23 (copy), l_UserInputService_0 (ref)
                if v28:IsA("PlayerGui") then
                    v23.playerGui = v28;
                    v23:CreateTouchGuiContainer();
                    v23.playerGuiAddedConn:Disconnect();
                    v23.playerGuiAddedConn = nil;
                    v23:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
                end;
            end);
            return v23;
        end;
    else
        v23:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
        return v23;
    end;
end;
v0.GetMoveVector = function(v29) --[[ Line: 186 ]] --[[ Name: GetMoveVector ]]
    if v29.activeController then
        return v29.activeController:GetMoveVector();
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
local function _(v30) --[[ Line: 193 ]] --[[ Name: NormalizeAngle ]]
    v30 = (v30 + 12.566370614359172) % 6.283185307179586;
    if v30 > 3.141592653589793 then
        v30 = v30 - 6.283185307179586;
    end;
    return v30;
end;
local function _(v32, v33) --[[ Line: 201 ]] --[[ Name: AverageAngle ]]
    local v34 = (v33 - v32 + 12.566370614359172) % 6.283185307179586;
    if v34 > 3.141592653589793 then
        v34 = v34 - 6.283185307179586;
    end;
    local v35 = (v32 + v34 / 2 + 12.566370614359172) % 6.283185307179586;
    if v35 > 3.141592653589793 then
        v35 = v35 - 6.283185307179586;
    end;
    return v35;
end;
v0.GetEstimatedVRTorsoFrame = function(v37) --[[ Line: 206 ]] --[[ Name: GetEstimatedVRTorsoFrame ]]
    -- upvalues: l_VRService_0 (copy)
    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local _, v40, _ = l_l_VRService_0_UserCFrame_0:ToEulerAnglesYXZ();
    v40 = -v40;
    if not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v37.currentTorsoAngle = v40;
    else
        local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local l_l_VRService_0_UserCFrame_2 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
        local v44 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_1.Position;
        local v45 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_2.Position;
        local v46 = -math.atan2(v44.X, v44.Z);
        local v47 = (-math.atan2(v45.X, v45.Z) - v46 + 12.566370614359172) % 6.283185307179586;
        if v47 > 3.141592653589793 then
            v47 = v47 - 6.283185307179586;
        end;
        v47 = (v46 + v47 / 2 + 12.566370614359172) % 6.283185307179586;
        if v47 > 3.141592653589793 then
            v47 = v47 - 6.283185307179586;
        end;
        local l_v47_0 = v47;
        v47 = (v40 - v37.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v47 > 3.141592653589793 then
            v47 = v47 - 6.283185307179586;
        end;
        local l_v47_1 = v47;
        local v50 = (l_v47_0 - v37.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v50 > 3.141592653589793 then
            v50 = v50 - 6.283185307179586;
        end;
        v47 = v50;
        v50 = false;
        if v47 > -1.5707963267948966 then
            v50 = v47 < 1.5707963267948966;
        end;
        if not v50 then
            v47 = l_v47_1;
        end;
        local v51 = math.min(v47, l_v47_1);
        local v52 = math.max(v47, l_v47_1);
        local v53 = 0;
        if v51 > 0 then
            v53 = v51;
        elseif v52 < 0 then
            v53 = v52;
        end;
        v37.currentTorsoAngle = v53 + v37.currentTorsoAngle;
    end;
    return CFrame.new(l_l_VRService_0_UserCFrame_0.Position) * CFrame.fromEulerAnglesYXZ(0, -v37.currentTorsoAngle, 0);
end;
v0.GetActiveController = function(v54) --[[ Line: 250 ]] --[[ Name: GetActiveController ]]
    return v54.activeController;
end;
v0.UpdateActiveControlModuleEnabled = function(v55) --[[ Line: 255 ]] --[[ Name: UpdateActiveControlModuleEnabled ]]
    -- upvalues: l_Players_0 (copy), l_ClickToMoveController_0 (copy), l_result_0 (copy), l_DynamicThumbstick_0 (copy), l_TouchJump_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local function _() --[[ Line: 257 ]]
        -- upvalues: v55 (copy), l_Players_0 (ref)
        v55.activeController:Enable(false);
        if v55.touchJumpController then
            v55.touchJumpController:Enable(false);
        end;
        if v55.moveFunction then
            v55.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
    end;
    local function v57() --[[ Line: 268 ]]
        -- upvalues: v55 (copy), l_ClickToMoveController_0 (ref), l_result_0 (ref), l_DynamicThumbstick_0 (ref), l_TouchJump_0 (ref), l_Players_0 (ref)
        if v55.touchControlFrame and (v55.activeControlModule == l_ClickToMoveController_0 or v55.activeControlModule == l_result_0 or v55.activeControlModule == l_DynamicThumbstick_0) then
            if not v55.controllers[l_TouchJump_0] then
                v55.controllers[l_TouchJump_0] = l_TouchJump_0.new();
            end;
            v55.touchJumpController = v55.controllers[l_TouchJump_0];
            v55.touchJumpController:Enable(true, v55.touchControlFrame);
        elseif v55.touchJumpController then
            v55.touchJumpController:Enable(false);
        end;
        if v55.activeControlModule == l_ClickToMoveController_0 then
            v55.activeController:Enable(true, l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, v55.touchJumpController);
            return;
        elseif v55.touchControlFrame then
            v55.activeController:Enable(true, v55.touchControlFrame);
            return;
        else
            v55.activeController:Enable(true);
            return;
        end;
    end;
    if not v55.activeController then
        return;
    elseif not v55.controlsEnabled then
        v55.activeController:Enable(false);
        if v55.touchJumpController then
            v55.touchJumpController:Enable(false);
        end;
        if v55.moveFunction then
            v55.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    elseif not l_GuiService_0.TouchControlsEnabled and l_UserInputService_0.TouchEnabled and (v55.activeControlModule == l_ClickToMoveController_0 or v55.activeControlModule == l_result_0 or v55.activeControlModule == l_DynamicThumbstick_0) then
        v55.activeController:Enable(false);
        if v55.touchJumpController then
            v55.touchJumpController:Enable(false);
        end;
        if v55.moveFunction then
            v55.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    else
        v57();
        return;
    end;
end;
v0.Enable = function(v58, v59) --[[ Line: 327 ]] --[[ Name: Enable ]]
    -- upvalues: l_status_0 (copy)
    if v59 == nil then
        v59 = true;
    end;
    if l_status_0 and v58.controlsEnabled == v59 then
        return;
    else
        v58.controlsEnabled = v59;
        if not v58.activeController then
            return;
        else
            v58:UpdateActiveControlModuleEnabled();
            return;
        end;
    end;
end;
v0.Disable = function(v60) --[[ Line: 344 ]] --[[ Name: Disable ]]
    -- upvalues: l_status_0 (copy)
    if l_status_0 then
        v60:Enable(false);
        return;
    else
        v60.controlsEnabled = false;
        v60:UpdateActiveControlModuleEnabled();
        return;
    end;
end;
v0.SelectComputerMovementModule = function(_) --[[ Line: 356 ]] --[[ Name: SelectComputerMovementModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v21 (copy), v22 (ref), l_UserGameSettings_0 (copy), l_Keyboard_0 (copy), l_ClickToMoveController_0 (copy), v20 (copy)
    if not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.GamepadEnabled then
        return nil, false;
    else
        local v62 = nil;
        local l_DevComputerMovementMode_0 = l_Players_0.LocalPlayer.DevComputerMovementMode;
        if l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.UserChoice then
            v62 = v21[v22];
            if l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v62 == l_Keyboard_0 then
                v62 = l_ClickToMoveController_0;
            end;
        else
            v62 = v20[l_DevComputerMovementMode_0];
            if not v62 and l_DevComputerMovementMode_0 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", l_DevComputerMovementMode_0);
            end;
        end;
        if v62 then
            return v62, true;
        elseif l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true;
        else
            return nil, false;
        end;
    end;
end;
v0.SelectTouchModule = function(_) --[[ Line: 394 ]] --[[ Name: SelectTouchModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v20 (copy), l_UserGameSettings_0 (copy)
    if not l_UserInputService_0.TouchEnabled then
        return nil, false;
    else
        local v65 = nil;
        local l_DevTouchMovementMode_0 = l_Players_0.LocalPlayer.DevTouchMovementMode;
        if l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.UserChoice then
            v65 = v20[l_UserGameSettings_0.TouchMovementMode];
        elseif l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true;
        else
            v65 = v20[l_DevTouchMovementMode_0];
        end;
        return v65, true;
    end;
end;
local function v70() --[[ Line: 410 ]] --[[ Name: getGamepadRightThumbstickPosition ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1);
    for _, v69 in pairs(l_l_UserInputService_0_GamepadState_0) do
        if v69.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v69.Position;
        end;
    end;
    return (Vector3.new(0, 0, 0, 0));
end;
v0.calculateRawMoveVector = function(v71, v72, v73) --[[ Line: 420 ]] --[[ Name: calculateRawMoveVector ]]
    -- upvalues: l_Workspace_0 (copy), l_VRService_0 (copy), v70 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v73;
    else
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        if l_VRService_0.VREnabled and v72.RootPart then
            local l_l_VRService_0_UserCFrame_3 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            l_l_VRService_0_UserCFrame_3 = v71:GetEstimatedVRTorsoFrame();
            l_CFrame_0 = if (l_CurrentCamera_0.Focus.Position - l_CFrame_0.Position).Magnitude < 3 then l_CFrame_0 * l_l_VRService_0_UserCFrame_3 else l_CurrentCamera_0.CFrame * (l_l_VRService_0_UserCFrame_3.Rotation + l_l_VRService_0_UserCFrame_3.Position * l_CurrentCamera_0.HeadScale);
        end;
        if v72:GetState() == Enum.HumanoidStateType.Swimming then
            if l_VRService_0.VREnabled then
                v73 = Vector3.new(v73.X, 0, v73.Z);
                if v73.Magnitude < 0.01 then
                    return (Vector3.new(0, 0, 0, 0));
                else
                    local v77 = -v70().Y * 1.3962634015954636;
                    local v78 = math.atan2(-v73.X, -v73.Z);
                    local _, v80, _ = l_CFrame_0:ToEulerAnglesYXZ();
                    v78 = v78 + v80;
                    return CFrame.fromEulerAnglesYXZ(v77, v78, 0).LookVector;
                end;
            else
                return l_CFrame_0:VectorToWorldSpace(v73);
            end;
        else
            local v82 = nil;
            local v83 = nil;
            local _, _, _, v87, v88, v89, _, _, v92, _, _, v95 = l_CFrame_0:GetComponents();
            if v92 < 1 and v92 > -1 then
                v82 = v95;
                v83 = v89;
            else
                v82 = v87;
                v83 = -v88 * math.sign(v92);
            end;
            local v96 = math.sqrt(v82 * v82 + v83 * v83);
            return (Vector3.new((v82 * v73.X + v83 * v73.Z) / v96, 0, (v82 * v73.Z - v83 * v73.X) / v96));
        end;
    end;
end;
v0.OnRenderStepped = function(v97, v98) --[[ Line: 479 ]] --[[ Name: OnRenderStepped ]]
    -- upvalues: l_Gamepad_0 (copy), l_VRService_0 (copy), l_Players_0 (copy)
    if v97.activeController and v97.activeController.enabled and v97.humanoid then
        local l_MoveVector_0 = v97.activeController:GetMoveVector();
        local v100 = v97.activeController:IsMoveVectorCameraRelative();
        local l_v97_ClickToMoveController_0 = v97:GetClickToMoveController();
        if v97.activeController == l_v97_ClickToMoveController_0 then
            l_v97_ClickToMoveController_0:OnRenderStepped(v98);
        elseif l_MoveVector_0.magnitude > 0 then
            l_v97_ClickToMoveController_0:CleanupPath();
        else
            l_v97_ClickToMoveController_0:OnRenderStepped(v98);
            l_MoveVector_0 = l_v97_ClickToMoveController_0:GetMoveVector();
            v100 = l_v97_ClickToMoveController_0:IsMoveVectorCameraRelative();
        end;
        local v102 = false;
        if v97.vehicleController then
            local v103, v104 = v97.vehicleController:Update(l_MoveVector_0, v100, v97.activeControlModule == l_Gamepad_0);
            l_MoveVector_0 = v103;
            v102 = v104;
        end;
        if v100 then
            l_MoveVector_0 = v97:calculateRawMoveVector(v97.humanoid, l_MoveVector_0);
        end;
        v97.inputMoveVector = l_MoveVector_0;
        if l_VRService_0.VREnabled then
            l_MoveVector_0 = v97:updateVRMoveVector(l_MoveVector_0);
        end;
        v97.moveFunction(l_Players_0.LocalPlayer, l_MoveVector_0, false);
        v97.humanoid.Jump = v97.activeController:GetIsJumping() or v97.touchJumpController and v97.touchJumpController:GetIsJumping();
    end;
end;
v0.updateVRMoveVector = function(v105, v106) --[[ Line: 528 ]] --[[ Name: updateVRMoveVector ]]
    -- upvalues: l_VRService_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v108 = l_CurrentCamera_1.Focus.Position - l_CurrentCamera_1.CFrame.Position;
    local v109 = false;
    if v108.Magnitude < 5 then
        v109 = true;
    end;
    if v106.Magnitude == 0 and v109 and l_VRService_0.AvatarGestures and v105.humanoid and not v105.humanoid.Sit then
        local l_l_VRService_0_UserCFrame_4 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        l_l_VRService_0_UserCFrame_4 = l_l_VRService_0_UserCFrame_4.Rotation + l_l_VRService_0_UserCFrame_4.Position * l_CurrentCamera_1.HeadScale;
        local v111 = -0.7 * v105.humanoid.RootPart.Size.Y / 2;
        local v112 = (l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_4 * CFrame.new(0, v111, 0)).Position - v105.humanoid.RootPart.CFrame.Position;
        return (Vector3.new(v112.x, 0, v112.z));
    else
        return v106;
    end;
end;
v0.OnHumanoidSeated = function(v113, v114, v115) --[[ Line: 553 ]] --[[ Name: OnHumanoidSeated ]]
    -- upvalues: l_Value_0 (copy)
    if v114 then
        if v115 and v115:IsA("VehicleSeat") then
            if not v113.vehicleController then
                v113.vehicleController = v113.vehicleController.new(l_Value_0);
            end;
            v113.vehicleController:Enable(true, v115);
            return;
        end;
    elseif v113.vehicleController then
        v113.vehicleController:Enable(false, v115);
    end;
end;
v0.OnCharacterAdded = function(v116, v117) --[[ Line: 568 ]] --[[ Name: OnCharacterAdded ]]
    v116.humanoid = v117:FindFirstChildOfClass("Humanoid");
    while not v116.humanoid do
        v117.ChildAdded:wait();
        v116.humanoid = v117:FindFirstChildOfClass("Humanoid");
    end;
    v116:UpdateTouchGuiVisibility();
    if v116.humanoidSeatedConn then
        v116.humanoidSeatedConn:Disconnect();
        v116.humanoidSeatedConn = nil;
    end;
    v116.humanoidSeatedConn = v116.humanoid.Seated:Connect(function(v118, v119) --[[ Line: 581 ]]
        -- upvalues: v116 (copy)
        v116:OnHumanoidSeated(v118, v119);
    end);
end;
v0.OnCharacterRemoving = function(v120, _) --[[ Line: 586 ]] --[[ Name: OnCharacterRemoving ]]
    v120.humanoid = nil;
    v120:UpdateTouchGuiVisibility();
end;
v0.UpdateTouchGuiVisibility = function(v122) --[[ Line: 592 ]] --[[ Name: UpdateTouchGuiVisibility ]]
    -- upvalues: l_GuiService_0 (copy)
    if v122.touchGui then
        local v123 = v122.humanoid and l_GuiService_0.TouchControlsEnabled;
        v122.touchGui.Enabled = not not v123;
    end;
end;
v0.SwitchToController = function(v124, v125) --[[ Line: 606 ]] --[[ Name: SwitchToController ]]
    -- upvalues: l_Value_0 (copy)
    if not v125 then
        if v124.activeController then
            v124.activeController:Enable(false);
        end;
        v124.activeController = nil;
        v124.activeControlModule = nil;
        return;
    else
        if not v124.controllers[v125] then
            v124.controllers[v125] = v125.new(l_Value_0);
        end;
        if v124.activeController ~= v124.controllers[v125] then
            if v124.activeController then
                v124.activeController:Enable(false);
            end;
            v124.activeController = v124.controllers[v125];
            v124.activeControlModule = v125;
            v124:UpdateActiveControlModuleEnabled();
        end;
        return;
    end;
end;
v0.OnLastInputTypeChanged = function(v126, v127) --[[ Line: 634 ]] --[[ Name: OnLastInputTypeChanged ]]
    -- upvalues: v22 (ref), v21 (copy)
    if v22 == v127 then
        warn("LastInputType Change listener called with current type.");
    end;
    v22 = v127;
    if v22 == Enum.UserInputType.Touch then
        local v128, v129 = v126:SelectTouchModule();
        if v129 then
            while not v126.touchControlFrame do
                wait();
            end;
            v126:SwitchToController(v128);
        end;
    elseif v21[v22] ~= nil then
        local v130 = v126:SelectComputerMovementModule();
        if v130 then
            v126:SwitchToController(v130);
        end;
    end;
    v126:UpdateTouchGuiVisibility();
end;
v0.OnComputerMovementModeChange = function(v131) --[[ Line: 661 ]] --[[ Name: OnComputerMovementModeChange ]]
    local v132, v133 = v131:SelectComputerMovementModule();
    if v133 then
        v131:SwitchToController(v132);
    end;
end;
v0.OnTouchMovementModeChange = function(v134) --[[ Line: 668 ]] --[[ Name: OnTouchMovementModeChange ]]
    local v135, v136 = v134:SelectTouchModule();
    if v136 then
        while not v134.touchControlFrame do
            wait();
        end;
        v134:SwitchToController(v135);
    end;
end;
v0.CreateTouchGuiContainer = function(v137) --[[ Line: 678 ]] --[[ Name: CreateTouchGuiContainer ]]
    -- upvalues: v13 (ref)
    if v137.touchGui then
        v137.touchGui:Destroy();
    end;
    v137.touchGui = Instance.new("ScreenGui");
    v137.touchGui.Name = "TouchGui";
    v137.touchGui.ResetOnSpawn = false;
    v137.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v137:UpdateTouchGuiVisibility();
    if v13 then
        v137.touchGui.ClipToDeviceSafeArea = false;
    end;
    v137.touchControlFrame = Instance.new("Frame");
    v137.touchControlFrame.Name = "TouchControlFrame";
    v137.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
    v137.touchControlFrame.BackgroundTransparency = 1;
    v137.touchControlFrame.Parent = v137.touchGui;
    v137.touchGui.Parent = v137.playerGui;
end;
v0.GetClickToMoveController = function(v138) --[[ Line: 701 ]] --[[ Name: GetClickToMoveController ]]
    -- upvalues: l_ClickToMoveController_0 (copy), l_Value_0 (copy)
    if not v138.controllers[l_ClickToMoveController_0] then
        v138.controllers[l_ClickToMoveController_0] = l_ClickToMoveController_0.new(l_Value_0);
    end;
    return v138.controllers[l_ClickToMoveController_0];
end;
return v0.new();