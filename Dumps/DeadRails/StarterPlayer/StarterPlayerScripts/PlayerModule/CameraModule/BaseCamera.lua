--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseCamera
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_CameraToggleStateController_0 = require(script.Parent:WaitForChild("CameraToggleStateController"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUI_0 = require(script.Parent:WaitForChild("CameraUI"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v13 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixGamepadMaxZoom");
end);
v13 = l_status_0 and l_result_0;
l_status_0 = l_FlagUtil_0.getUserFlag("UserFixCameraOffsetJitter2");
l_result_0 = l_FlagUtil_0.getUserFlag("UserOrganizeBaseCameraConnections");
local _ = Vector2.new(0, 0);
local v17 = {
    CHARACTER_ADDED = "CHARACTER_ADDED", 
    CAMERA_MODE_CHANGED = "CAMERA_MODE_CHANGED", 
    CAMERA_MIN_DISTANCE_CHANGED = "CAMERA_MIN_DISTANCE_CHANGED", 
    CAMERA_MAX_DISTANCE_CHANGED = "CAMERA_MAX_DISTANCE_CHANGED"
};
local v18 = {};
v18.__index = v18;
v18.new = function() --[[ Line: 80 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), l_ConnectionUtil_0 (copy), l_LocalPlayer_0 (copy), l_result_0 (copy), l_UserGameSettings_0 (copy)
    local v19 = setmetatable({}, v18);
    v19._connections = l_ConnectionUtil_0.new();
    v19.gamepadZoomLevels = {
        0, 
        10, 
        20
    };
    v19.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
    v19.cameraType = nil;
    v19.cameraMovementMode = nil;
    v19.lastCameraTransform = nil;
    v19.lastUserPanCamera = tick();
    v19.humanoidRootPart = nil;
    v19.humanoidCache = {};
    v19.lastSubject = nil;
    v19.lastSubjectPosition = Vector3.new(0, 5, 0, 0);
    v19.lastSubjectCFrame = CFrame.new(v19.lastSubjectPosition);
    v19.currentSubjectDistance = math.clamp(12.5, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v19.inFirstPerson = false;
    v19.inMouseLockedMode = false;
    v19.portraitMode = false;
    v19.isSmallTouchScreen = false;
    v19.resetCameraAngle = true;
    v19.enabled = false;
    v19.PlayerGui = nil;
    v19.cameraChangedConn = nil;
    v19.viewportSizeChangedConn = nil;
    v19.shouldUseVRRotation = false;
    v19.VRRotationIntensityAvailable = false;
    v19.lastVRRotationIntensityCheckTime = 0;
    v19.lastVRRotationTime = 0;
    v19.vrRotateKeyCooldown = {};
    v19.cameraTranslationConstraints = Vector3.new(1, 1, 1, 0);
    v19.humanoidJumpOrigin = nil;
    v19.trackingHumanoid = nil;
    v19.cameraFrozen = false;
    v19.subjectStateChangedConn = nil;
    v19.gamepadZoomPressConnection = nil;
    v19.mouseLockOffset = Vector3.new(0, 0, 0, 0);
    if not l_result_0 then
        if l_LocalPlayer_0.Character then
            v19:OnCharacterAdded(l_LocalPlayer_0.Character);
        end;
        l_LocalPlayer_0.CharacterAdded:Connect(function(v20) --[[ Line: 145 ]]
            -- upvalues: v19 (copy)
            v19:OnCharacterAdded(v20);
        end);
        if v19.playerCameraModeChangeConn then
            v19.playerCameraModeChangeConn:Disconnect();
        end;
        v19.playerCameraModeChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 150 ]]
            -- upvalues: v19 (copy)
            v19:OnPlayerCameraPropertyChange();
        end);
        if v19.minDistanceChangeConn then
            v19.minDistanceChangeConn:Disconnect();
        end;
        v19.minDistanceChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 155 ]]
            -- upvalues: v19 (copy)
            v19:OnPlayerCameraPropertyChange();
        end);
        if v19.maxDistanceChangeConn then
            v19.maxDistanceChangeConn:Disconnect();
        end;
        v19.maxDistanceChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 160 ]]
            -- upvalues: v19 (copy)
            v19:OnPlayerCameraPropertyChange();
        end);
        if v19.playerDevTouchMoveModeChangeConn then
            v19.playerDevTouchMoveModeChangeConn:Disconnect();
        end;
        v19.playerDevTouchMoveModeChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 165 ]]
            -- upvalues: v19 (copy)
            v19:OnDevTouchMovementModeChanged();
        end);
        v19:OnDevTouchMovementModeChanged();
        if v19.gameSettingsTouchMoveMoveChangeConn then
            v19.gameSettingsTouchMoveMoveChangeConn:Disconnect();
        end;
        v19.gameSettingsTouchMoveMoveChangeConn = l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 171 ]]
            -- upvalues: v19 (copy)
            v19:OnGameSettingsTouchMovementModeChanged();
        end);
        v19:OnGameSettingsTouchMovementModeChanged();
        v19.hasGameLoaded = game:IsLoaded();
        if not v19.hasGameLoaded then
            v19.gameLoadedConn = game.Loaded:Connect(function() --[[ Line: 179 ]]
                -- upvalues: v19 (copy)
                v19.hasGameLoaded = true;
                v19.gameLoadedConn:Disconnect();
                v19.gameLoadedConn = nil;
            end);
        end;
        v19:OnPlayerCameraPropertyChange();
    end;
    l_UserGameSettings_0:SetCameraYInvertVisible();
    l_UserGameSettings_0:SetGamepadCameraSensitivityVisible();
    return v19;
end;
v18.GetModuleName = function(_) --[[ Line: 196 ]] --[[ Name: GetModuleName ]]
    return "BaseCamera";
end;
if l_result_0 then
    v18._setUpConfigurations = function(v22) --[[ Line: 201 ]] --[[ Name: _setUpConfigurations ]]
        -- upvalues: v17 (copy), l_LocalPlayer_0 (copy)
        v22._connections:trackConnection(v17.CHARACTER_ADDED, l_LocalPlayer_0.CharacterAdded:Connect(function(v23) --[[ Line: 202 ]]
            -- upvalues: v22 (copy)
            v22:OnCharacterAdded(v23);
        end));
        if l_LocalPlayer_0.Character then
            v22:OnCharacterAdded(l_LocalPlayer_0.Character);
        end;
        v22._connections:trackConnection(v17.CAMERA_MODE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 209 ]]
            -- upvalues: v22 (copy)
            v22:OnPlayerCameraPropertyChange();
        end));
        v22._connections:trackConnection(v17.CAMERA_MIN_DISTANCE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 212 ]]
            -- upvalues: v22 (copy)
            v22:OnPlayerCameraPropertyChange();
        end));
        v22._connections:trackConnection(v17.CAMERA_MAX_DISTANCE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 215 ]]
            -- upvalues: v22 (copy)
            v22:OnPlayerCameraPropertyChange();
        end));
        v22:OnPlayerCameraPropertyChange();
    end;
end;
v18.OnCharacterAdded = function(v24, v25) --[[ Line: 222 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_UserInputService_0 (copy), l_LocalPlayer_0 (copy)
    v24.resetCameraAngle = v24.resetCameraAngle or v24:GetEnabled();
    v24.humanoidRootPart = nil;
    if l_UserInputService_0.TouchEnabled then
        v24.PlayerGui = l_LocalPlayer_0:WaitForChild("PlayerGui");
        for _, v27 in ipairs(v25:GetChildren()) do
            if v27:IsA("Tool") then
                v24.isAToolEquipped = true;
            end;
        end;
        v25.ChildAdded:Connect(function(v28) --[[ Line: 232 ]]
            -- upvalues: v24 (copy)
            if v28:IsA("Tool") then
                v24.isAToolEquipped = true;
            end;
        end);
        v25.ChildRemoved:Connect(function(v29) --[[ Line: 237 ]]
            -- upvalues: v24 (copy)
            if v29:IsA("Tool") then
                v24.isAToolEquipped = false;
            end;
        end);
    end;
end;
v18.GetHumanoidRootPart = function(v30) --[[ Line: 245 ]] --[[ Name: GetHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if not v30.humanoidRootPart and l_LocalPlayer_0.Character then
        local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            v30.humanoidRootPart = l_Humanoid_0.RootPart;
        end;
    end;
    return v30.humanoidRootPart;
end;
v18.GetBodyPartToFollow = function(_, v33, _) --[[ Line: 257 ]] --[[ Name: GetBodyPartToFollow ]]
    if v33:GetState() == Enum.HumanoidStateType.Dead then
        local l_Parent_0 = v33.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return l_Parent_0:FindFirstChild("Head") or v33.RootPart;
        end;
    end;
    return v33.RootPart;
end;
v18.GetSubjectCFrame = function(v36) --[[ Line: 269 ]] --[[ Name: GetSubjectCFrame ]]
    -- upvalues: l_status_0 (copy)
    local l_lastSubjectCFrame_0 = v36.lastSubjectCFrame;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v39 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    if not v39 then
        return l_lastSubjectCFrame_0;
    else
        if v39:IsA("Humanoid") then
            local v40 = v39:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_0 = v39.CameraOffset;
            if l_status_0 and v36:GetIsMouseLocked() then
                l_CameraOffset_0 = Vector3.new();
            end;
            local l_RootPart_0 = v39.RootPart;
            if v40 and v39.Parent and v39.Parent:IsA("Model") then
                l_RootPart_0 = v39.Parent:FindFirstChild("Head") or l_RootPart_0;
            end;
            if l_RootPart_0 and l_RootPart_0:IsA("BasePart") then
                local v43 = nil;
                if v39.RigType == Enum.HumanoidRigType.R15 then
                    if v39.AutomaticScalingEnabled then
                        v43 = Vector3.new(0, 1.5, 0, 0);
                        local l_RootPart_1 = v39.RootPart;
                        if l_RootPart_0 == l_RootPart_1 then
                            v43 = v43 + Vector3.new(0, (l_RootPart_1.Size.Y - Vector3.new(2, 2, 1, 0).Y) / 2, 0);
                        end;
                    else
                        v43 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v43 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v40 then
                    v43 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectCFrame_0 = l_RootPart_0.CFrame * CFrame.new(v43 + l_CameraOffset_0);
            end;
        elseif v39:IsA("BasePart") then
            l_lastSubjectCFrame_0 = v39.CFrame;
        elseif v39:IsA("Model") then
            l_lastSubjectCFrame_0 = if v39.PrimaryPart then v39:GetPrimaryPartCFrame() else CFrame.new();
        end;
        if l_lastSubjectCFrame_0 then
            v36.lastSubjectCFrame = l_lastSubjectCFrame_0;
        end;
        return l_lastSubjectCFrame_0;
    end;
end;
v18.GetSubjectVelocity = function(_) --[[ Line: 343 ]] --[[ Name: GetSubjectVelocity ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v47 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if not v47 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v47:IsA("BasePart") then
        return v47.Velocity;
    else
        if v47:IsA("Humanoid") then
            local l_RootPart_2 = v47.RootPart;
            if l_RootPart_2 then
                return l_RootPart_2.Velocity;
            end;
        elseif v47:IsA("Model") then
            local l_PrimaryPart_0 = v47.PrimaryPart;
            if l_PrimaryPart_0 then
                return l_PrimaryPart_0.Velocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v18.GetSubjectRotVelocity = function(_) --[[ Line: 372 ]] --[[ Name: GetSubjectRotVelocity ]]
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v52 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if not v52 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v52:IsA("BasePart") then
        return v52.RotVelocity;
    else
        if v52:IsA("Humanoid") then
            local l_RootPart_3 = v52.RootPart;
            if l_RootPart_3 then
                return l_RootPart_3.RotVelocity;
            end;
        elseif v52:IsA("Model") then
            local l_PrimaryPart_1 = v52.PrimaryPart;
            if l_PrimaryPart_1 then
                return l_PrimaryPart_1.RotVelocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v18.StepZoom = function(v55) --[[ Line: 401 ]] --[[ Name: StepZoom ]]
    -- upvalues: l_CameraInput_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_0 = v55.currentSubjectDistance;
    local v57 = l_CameraInput_0.getZoomDelta();
    if math.abs(v57) > 0 then
        local v58 = nil;
        v58 = if v57 > 0 then math.max(l_currentSubjectDistance_0 + v57 * (l_currentSubjectDistance_0 * 0.5 + 1), v55.FIRST_PERSON_DISTANCE_THRESHOLD) else math.max((l_currentSubjectDistance_0 + v57) / (1 - v57 * 0.5), 0.5);
        if v58 < v55.FIRST_PERSON_DISTANCE_THRESHOLD then
            v58 = 0.5;
        end;
        v55:SetCameraToSubjectDistance(v58);
    end;
    return l_ZoomController_0.GetZoomRadius();
end;
v18.GetSubjectPosition = function(v59) --[[ Line: 426 ]] --[[ Name: GetSubjectPosition ]]
    -- upvalues: l_status_0 (copy)
    local l_lastSubjectPosition_0 = v59.lastSubjectPosition;
    local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
    local v62 = l_CurrentCamera_3 and l_CurrentCamera_3.CameraSubject;
    if v62 then
        if v62:IsA("Humanoid") then
            local v63 = v62:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_1 = v62.CameraOffset;
            if l_status_0 and v59:GetIsMouseLocked() then
                l_CameraOffset_1 = Vector3.new();
            end;
            local l_RootPart_4 = v62.RootPart;
            if v63 and v62.Parent and v62.Parent:IsA("Model") then
                l_RootPart_4 = v62.Parent:FindFirstChild("Head") or l_RootPart_4;
            end;
            if l_RootPart_4 and l_RootPart_4:IsA("BasePart") then
                local v66 = nil;
                if v62.RigType == Enum.HumanoidRigType.R15 then
                    if v62.AutomaticScalingEnabled then
                        v66 = Vector3.new(0, 1.5, 0, 0);
                        if l_RootPart_4 == v62.RootPart then
                            v66 = v66 + Vector3.new(0, v62.RootPart.Size.Y / 2 - Vector3.new(2, 2, 1, 0).Y / 2, 0);
                        end;
                    else
                        v66 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v66 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v63 then
                    v66 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectPosition_0 = l_RootPart_4.CFrame.p + l_RootPart_4.CFrame:vectorToWorldSpace(v66 + l_CameraOffset_1);
            end;
        elseif v62:IsA("VehicleSeat") then
            l_lastSubjectPosition_0 = v62.CFrame.p + v62.CFrame:vectorToWorldSpace((Vector3.new(0, 5, 0, 0)));
        elseif v62:IsA("SkateboardPlatform") then
            l_lastSubjectPosition_0 = v62.CFrame.p + Vector3.new(0, 5, 0, 0);
        elseif v62:IsA("BasePart") then
            l_lastSubjectPosition_0 = v62.CFrame.p;
        elseif v62:IsA("Model") then
            l_lastSubjectPosition_0 = if v62.PrimaryPart then v62:GetPrimaryPartCFrame().p else v62:GetModelCFrame().p;
        end;
        v59.lastSubject = v62;
        v59.lastSubjectPosition = l_lastSubjectPosition_0;
        return l_lastSubjectPosition_0;
    else
        return nil;
    end;
end;
v18.OnViewportSizeChanged = function(v67) --[[ Line: 503 ]] --[[ Name: OnViewportSizeChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    v67.portraitMode = l_ViewportSize_0.X < l_ViewportSize_0.Y;
    v67.isSmallTouchScreen = l_UserInputService_0.TouchEnabled and (l_ViewportSize_0.Y < 500 or l_ViewportSize_0.X < 700);
end;
v18.OnCurrentCameraChanged = function(v69) --[[ Line: 511 ]] --[[ Name: OnCurrentCameraChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.TouchEnabled then
        if v69.viewportSizeChangedConn then
            v69.viewportSizeChangedConn:Disconnect();
            v69.viewportSizeChangedConn = nil;
        end;
        local l_CurrentCamera_4 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_4 then
            v69:OnViewportSizeChanged();
            v69.viewportSizeChangedConn = l_CurrentCamera_4:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 522 ]]
                -- upvalues: v69 (copy)
                v69:OnViewportSizeChanged();
            end);
        end;
    end;
    if v69.cameraSubjectChangedConn then
        v69.cameraSubjectChangedConn:Disconnect();
        v69.cameraSubjectChangedConn = nil;
    end;
    local l_CurrentCamera_5 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_5 then
        v69.cameraSubjectChangedConn = l_CurrentCamera_5:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 536 ]]
            -- upvalues: v69 (copy)
            v69:OnNewCameraSubject();
        end);
        v69:OnNewCameraSubject();
    end;
end;
if not l_result_0 then
    v18.OnDynamicThumbstickEnabled = function(v72) --[[ Line: 544 ]] --[[ Name: OnDynamicThumbstickEnabled ]]
        -- upvalues: l_UserInputService_0 (copy)
        if l_UserInputService_0.TouchEnabled then
            v72.isDynamicThumbstickEnabled = true;
        end;
    end;
    v18.OnDynamicThumbstickDisabled = function(v73) --[[ Line: 550 ]] --[[ Name: OnDynamicThumbstickDisabled ]]
        v73.isDynamicThumbstickEnabled = false;
    end;
    v18.OnGameSettingsTouchMovementModeChanged = function(v74) --[[ Line: 554 ]] --[[ Name: OnGameSettingsTouchMovementModeChanged ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_UserGameSettings_0 (copy)
        if l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
            if l_UserGameSettings_0.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or l_UserGameSettings_0.TouchMovementMode == Enum.TouchMovementMode.Default then
                v74:OnDynamicThumbstickEnabled();
                return;
            else
                v74:OnDynamicThumbstickDisabled();
            end;
        end;
    end;
    v18.OnDevTouchMovementModeChanged = function(v75) --[[ Line: 565 ]] --[[ Name: OnDevTouchMovementModeChanged ]]
        -- upvalues: l_LocalPlayer_0 (copy)
        if l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
            v75:OnDynamicThumbstickEnabled();
            return;
        else
            v75:OnGameSettingsTouchMovementModeChanged();
            return;
        end;
    end;
end;
v18.OnPlayerCameraPropertyChange = function(v76) --[[ Line: 574 ]] --[[ Name: OnPlayerCameraPropertyChange ]]
    v76:SetCameraToSubjectDistance(v76.currentSubjectDistance);
end;
v18.InputTranslationToCameraAngleChange = function(_, v78, v79) --[[ Line: 579 ]] --[[ Name: InputTranslationToCameraAngleChange ]]
    return v78 * v79;
end;
v18.GamepadZoomPress = function(v80) --[[ Line: 585 ]] --[[ Name: GamepadZoomPress ]]
    -- upvalues: l_LocalPlayer_0 (copy), v13 (ref)
    local l_v80_CameraToSubjectDistance_0 = v80:GetCameraToSubjectDistance();
    local l_CameraMaxZoomDistance_0 = l_LocalPlayer_0.CameraMaxZoomDistance;
    for v83 = #v80.gamepadZoomLevels, 1, -1 do
        local v84 = v80.gamepadZoomLevels[v83];
        if l_CameraMaxZoomDistance_0 >= v84 then
            if v84 < l_LocalPlayer_0.CameraMinZoomDistance then
                v84 = l_LocalPlayer_0.CameraMinZoomDistance;
                if v13 and l_CameraMaxZoomDistance_0 == v84 then
                    break;
                end;
            end;
            if v13 or l_CameraMaxZoomDistance_0 ~= v84 then
                if v84 + (l_CameraMaxZoomDistance_0 - v84) / 2 < l_v80_CameraToSubjectDistance_0 then
                    v80:SetCameraToSubjectDistance(v84);
                    return;
                else
                    l_CameraMaxZoomDistance_0 = v84;
                end;
            else
                break;
            end;
        end;
    end;
    v80:SetCameraToSubjectDistance(v80.gamepadZoomLevels[#v80.gamepadZoomLevels]);
end;
v18.Enable = function(v85, v86) --[[ Line: 630 ]] --[[ Name: Enable ]]
    if v85.enabled ~= v86 then
        v85.enabled = v86;
        v85:OnEnabledChanged();
    end;
end;
v18.OnEnabledChanged = function(v87) --[[ Line: 638 ]] --[[ Name: OnEnabledChanged ]]
    -- upvalues: l_result_0 (copy), l_CameraInput_0 (copy), l_LocalPlayer_0 (copy)
    if v87.enabled then
        if l_result_0 then
            v87:_setUpConfigurations();
        end;
        l_CameraInput_0.setInputEnabled(true);
        v87.gamepadZoomPressConnection = l_CameraInput_0.gamepadZoomPress:Connect(function() --[[ Line: 646 ]]
            -- upvalues: v87 (copy)
            v87:GamepadZoomPress();
        end);
        if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
            v87.currentSubjectDistance = 0.5;
            if not v87.inFirstPerson then
                v87:EnterFirstPerson();
            end;
        end;
        if v87.cameraChangedConn then
            v87.cameraChangedConn:Disconnect();
            v87.cameraChangedConn = nil;
        end;
        v87.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 658 ]]
            -- upvalues: v87 (copy)
            v87:OnCurrentCameraChanged();
        end);
        v87:OnCurrentCameraChanged();
        return;
    else
        if l_result_0 then
            v87._connections:disconnectAll();
        end;
        l_CameraInput_0.setInputEnabled(false);
        if v87.gamepadZoomPressConnection then
            v87.gamepadZoomPressConnection:Disconnect();
            v87.gamepadZoomPressConnection = nil;
        end;
        v87:Cleanup();
        return;
    end;
end;
v18.GetEnabled = function(v88) --[[ Line: 678 ]] --[[ Name: GetEnabled ]]
    return v88.enabled;
end;
v18.Cleanup = function(v89) --[[ Line: 682 ]] --[[ Name: Cleanup ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v89.subjectStateChangedConn then
        v89.subjectStateChangedConn:Disconnect();
        v89.subjectStateChangedConn = nil;
    end;
    if v89.viewportSizeChangedConn then
        v89.viewportSizeChangedConn:Disconnect();
        v89.viewportSizeChangedConn = nil;
    end;
    if v89.cameraChangedConn then
        v89.cameraChangedConn:Disconnect();
        v89.cameraChangedConn = nil;
    end;
    v89.lastCameraTransform = nil;
    v89.lastSubjectCFrame = nil;
    l_CameraUtils_0.restoreMouseBehavior();
end;
v18.UpdateMouseBehavior = function(v90) --[[ Line: 703 ]] --[[ Name: UpdateMouseBehavior ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_CameraUI_0 (copy), l_CameraInput_0 (copy), l_CameraToggleStateController_0 (copy), l_CameraUtils_0 (copy)
    local v91 = l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    if v90.isCameraToggle and v91 == false then
        l_CameraUI_0.setCameraModeToastEnabled(true);
        l_CameraInput_0.enableCameraToggleInput();
        l_CameraToggleStateController_0(v90.inFirstPerson);
        return;
    else
        l_CameraUI_0.setCameraModeToastEnabled(false);
        l_CameraInput_0.disableCameraToggleInput();
        if v90.inFirstPerson or v90.inMouseLockedMode then
            l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.CameraRelative);
            return;
        else
            l_CameraUtils_0.restoreRotationType();
            if l_CameraInput_0.getRotationActivated() then
                l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
                return;
            else
                l_CameraUtils_0.restoreMouseBehavior();
                return;
            end;
        end;
    end;
end;
v18.UpdateForDistancePropertyChange = function(v92) --[[ Line: 731 ]] --[[ Name: UpdateForDistancePropertyChange ]]
    v92:SetCameraToSubjectDistance(v92.currentSubjectDistance);
end;
v18.SetCameraToSubjectDistance = function(v93, v94) --[[ Line: 737 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_1 = v93.currentSubjectDistance;
    if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
        v93.currentSubjectDistance = 0.5;
        if not v93.inFirstPerson then
            v93:EnterFirstPerson();
        end;
    else
        local v96 = math.clamp(v94, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
        if v96 < 1 then
            v93.currentSubjectDistance = 0.5;
            if not v93.inFirstPerson then
                v93:EnterFirstPerson();
            end;
        else
            v93.currentSubjectDistance = v96;
            if v93.inFirstPerson then
                v93:LeaveFirstPerson();
            end;
        end;
    end;
    l_ZoomController_0.SetZoomParameters(v93.currentSubjectDistance, (math.sign(v94 - l_currentSubjectDistance_1)));
    return v93.currentSubjectDistance;
end;
v18.SetCameraType = function(v97, v98) --[[ Line: 771 ]] --[[ Name: SetCameraType ]]
    v97.cameraType = v98;
end;
v18.GetCameraType = function(v99) --[[ Line: 776 ]] --[[ Name: GetCameraType ]]
    return v99.cameraType;
end;
v18.SetCameraMovementMode = function(v100, v101) --[[ Line: 781 ]] --[[ Name: SetCameraMovementMode ]]
    v100.cameraMovementMode = v101;
end;
v18.GetCameraMovementMode = function(v102) --[[ Line: 785 ]] --[[ Name: GetCameraMovementMode ]]
    return v102.cameraMovementMode;
end;
v18.SetIsMouseLocked = function(v103, v104) --[[ Line: 789 ]] --[[ Name: SetIsMouseLocked ]]
    v103.inMouseLockedMode = v104;
end;
v18.GetIsMouseLocked = function(v105) --[[ Line: 793 ]] --[[ Name: GetIsMouseLocked ]]
    return v105.inMouseLockedMode;
end;
v18.SetMouseLockOffset = function(v106, v107) --[[ Line: 797 ]] --[[ Name: SetMouseLockOffset ]]
    v106.mouseLockOffset = v107;
end;
v18.GetMouseLockOffset = function(v108) --[[ Line: 801 ]] --[[ Name: GetMouseLockOffset ]]
    return v108.mouseLockOffset;
end;
v18.InFirstPerson = function(v109) --[[ Line: 805 ]] --[[ Name: InFirstPerson ]]
    return v109.inFirstPerson;
end;
v18.EnterFirstPerson = function(v110) --[[ Line: 809 ]] --[[ Name: EnterFirstPerson ]]
    v110.inFirstPerson = true;
    v110:UpdateMouseBehavior();
end;
v18.LeaveFirstPerson = function(v111) --[[ Line: 814 ]] --[[ Name: LeaveFirstPerson ]]
    v111.inFirstPerson = false;
    v111:UpdateMouseBehavior();
end;
v18.GetCameraToSubjectDistance = function(v112) --[[ Line: 820 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v112.currentSubjectDistance;
end;
v18.GetMeasuredDistanceToFocus = function(_) --[[ Line: 827 ]] --[[ Name: GetMeasuredDistanceToFocus ]]
    local l_CurrentCamera_6 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_6 then
        return (l_CurrentCamera_6.CoordinateFrame.p - l_CurrentCamera_6.Focus.p).magnitude;
    else
        return nil;
    end;
end;
v18.GetCameraLookVector = function(_) --[[ Line: 835 ]] --[[ Name: GetCameraLookVector ]]
    return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1, 0);
end;
v18.CalculateNewLookCFrameFromArg = function(v116, v117, v118) --[[ Line: 839 ]] --[[ Name: CalculateNewLookCFrameFromArg ]]
    local v119 = v117 or v116:GetCameraLookVector();
    local v120 = math.asin(v119.Y);
    local v121 = math.clamp(v118.Y, v120 + -1.3962634015954636, v120 + 1.3962634015954636);
    local v122 = Vector2.new(v118.X, v121);
    local v123 = CFrame.new(Vector3.new(0, 0, 0, 0), v119);
    return CFrame.Angles(0, -v122.X, 0) * v123 * CFrame.Angles(-v122.Y, 0, 0);
end;
v18.CalculateNewLookVectorFromArg = function(v124, v125, v126) --[[ Line: 849 ]] --[[ Name: CalculateNewLookVectorFromArg ]]
    return v124:CalculateNewLookCFrameFromArg(v125, v126).LookVector;
end;
v18.CalculateNewLookVectorVRFromArg = function(v127, v128) --[[ Line: 854 ]] --[[ Name: CalculateNewLookVectorVRFromArg ]]
    local l_unit_0 = ((v127:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1, 0)).unit;
    local v130 = Vector2.new(v128.X, 0);
    local v131 = CFrame.new(Vector3.new(0, 0, 0, 0), l_unit_0);
    return ((CFrame.Angles(0, -v130.X, 0) * v131 * CFrame.Angles(-v130.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1, 0)).unit;
end;
v18.GetHumanoid = function(v132) --[[ Line: 864 ]] --[[ Name: GetHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v133 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    if v133 then
        local v134 = v132.humanoidCache[l_LocalPlayer_0];
        if v134 and v134.Parent == v133 then
            return v134;
        else
            v132.humanoidCache[l_LocalPlayer_0] = nil;
            local l_Humanoid_1 = v133:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_1 then
                v132.humanoidCache[l_LocalPlayer_0] = l_Humanoid_1;
            end;
            return l_Humanoid_1;
        end;
    else
        return nil;
    end;
end;
v18.GetHumanoidPartToFollow = function(_, v137, v138) --[[ Line: 882 ]] --[[ Name: GetHumanoidPartToFollow ]]
    if v138 == Enum.HumanoidStateType.Dead then
        local l_Parent_1 = v137.Parent;
        if l_Parent_1 then
            return l_Parent_1:FindFirstChild("Head") or v137.Torso;
        else
            return v137.Torso;
        end;
    else
        return v137.Torso;
    end;
end;
v18.OnNewCameraSubject = function(v140) --[[ Line: 896 ]] --[[ Name: OnNewCameraSubject ]]
    if v140.subjectStateChangedConn then
        v140.subjectStateChangedConn:Disconnect();
        v140.subjectStateChangedConn = nil;
    end;
end;
v18.IsInFirstPerson = function(v141) --[[ Line: 903 ]] --[[ Name: IsInFirstPerson ]]
    return v141.inFirstPerson;
end;
v18.Update = function(_, _) --[[ Line: 907 ]] --[[ Name: Update ]]
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
v18.GetCameraHeight = function(v144) --[[ Line: 911 ]] --[[ Name: GetCameraHeight ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled and not v144.inFirstPerson then
        return 0.25881904510252074 * v144.currentSubjectDistance;
    else
        return 0;
    end;
end;
return v18;