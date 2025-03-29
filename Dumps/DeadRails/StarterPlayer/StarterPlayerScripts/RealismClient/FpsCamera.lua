--[[
    Script: StarterPlayer.StarterPlayerScripts.RealismClient.FpsCamera
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v27 = {
    HeadMirrors = {}, 
    HeadAttachments = {
        FaceCenterAttachment = true, 
        FaceFrontAttachment = true, 
        HairAttachment = true, 
        HatAttachment = true
    }, 
    InvalidRotationStates = {
        Swimming = true, 
        Climbing = true, 
        Dead = true
    }, 
    Warn = function(_, ...) --[[ Line: 42 ]] --[[ Name: Warn ]]
        warn("[FpsCamera]", ...);
    end, 
    Connect = function(v5, v6, v7) --[[ Line: 49 ]] --[[ Name: Connect ]]
        return v7:Connect(function(...) --[[ Line: 50 ]]
            -- upvalues: v5 (copy), v6 (copy)
            v5[v6](v5, ...);
        end);
    end, 
    IsInFirstPerson = function(_) --[[ Line: 58 ]] --[[ Name: IsInFirstPerson ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            if l_CurrentCamera_0.CameraType.Name == "Scriptable" then
                return false;
            else
                return (l_CurrentCamera_0.Focus.Position - l_CurrentCamera_0.CFrame.Position).Magnitude <= 1;
            end;
        else
            return false;
        end;
    end, 
    GetSubjectPosition = function(v10) --[[ Line: 78 ]] --[[ Name: GetSubjectPosition ]]
        if v10:IsInFirstPerson() then
            local l_CameraSubject_0 = workspace.CurrentCamera.CameraSubject;
            if l_CameraSubject_0 and l_CameraSubject_0:IsA("Humanoid") and l_CameraSubject_0.Health > 0 then
                local l_Parent_0 = l_CameraSubject_0.Parent;
                local v13 = l_Parent_0 and l_Parent_0:FindFirstChild("Head");
                if v13 and v13:IsA("BasePart") then
                    local l_CFrame_0 = v13.CFrame;
                    return (l_CFrame_0 * CFrame.new(0, v13.Size.Y / 3, 0)).Position, l_CFrame_0.LookVector;
                end;
            end;
        end;
        return v10:GetBaseSubjectPosition();
    end, 
    IsValidPartToModify = function(v15, v16) --[[ Line: 102 ]] --[[ Name: IsValidPartToModify ]]
        if v16:FindFirstAncestorOfClass("Tool") then
            return false;
        else
            if v16:IsA("Decal") then
                v16 = v16.Parent;
            end;
            if v16 and v16:IsA("BasePart") then
                local l_v16_FirstAncestorWhichIsA_0 = v16:FindFirstAncestorWhichIsA("Accoutrement");
                if l_v16_FirstAncestorWhichIsA_0 then
                    if v16.Name ~= "Handle" then
                        local l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0 = l_v16_FirstAncestorWhichIsA_0:FindFirstChild("Handle", true);
                        if l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0 and l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0:IsA("BasePart") then
                            v16 = l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0;
                        end;
                    end;
                    for _, v20 in pairs(v16:GetChildren()) do
                        if v20:IsA("Attachment") and v15.HeadAttachments[v20.Name] then
                            return true;
                        end;
                    end;
                elseif v16.Name == "Head" then
                    local l_Parent_1 = v16.Parent;
                    local l_CurrentCamera_1 = workspace.CurrentCamera;
                    local v23 = l_Parent_1 and l_Parent_1:FindFirstChildOfClass("Humanoid");
                    if v23 and l_CurrentCamera_1.CameraSubject == v23 then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, 
    MountBaseCamera = function(v24, v25) --[[ Line: 147 ]] --[[ Name: MountBaseCamera ]]
        local l_GetSubjectPosition_0 = v25.GetSubjectPosition;
        v24.GetBaseSubjectPosition = l_GetSubjectPosition_0;
        if l_GetSubjectPosition_0 then
            v25.GetBaseSubjectPosition = l_GetSubjectPosition_0;
            v25.GetSubjectPosition = v24.GetSubjectPosition;
            return;
        else
            v24:Warn("MountBaseCamera - Could not find BaseCamera:GetSubjectPosition()!");
            return;
        end;
    end
};
v27.UpdateTransparency = function(v28, ...) --[[ Line: 162 ]] --[[ Name: UpdateTransparency ]]
    -- upvalues: v27 (copy)
    assert(v28 ~= v27);
    v28:BaseUpdate(...);
    if v28.ForceRefresh then
        v28.ForceRefresh = false;
        if v28.SetSubject then
            v28:SetSubject(workspace.CurrentCamera.CameraSubject);
        end;
    end;
end;
v27.SetupTransparency = function(v29, v30, ...) --[[ Line: 179 ]] --[[ Name: SetupTransparency ]]
    -- upvalues: v27 (copy)
    assert(v29 ~= v27);
    v29:BaseSetupTransparency(v30, ...);
    if v29.AttachmentListener then
        v29.AttachmentListener:Disconnect();
    end;
    v29.AttachmentListener = v30.DescendantAdded:Connect(function(v31) --[[ Line: 187 ]]
        -- upvalues: v29 (copy)
        if v31:IsA("Attachment") and v29.HeadAttachments[v31.Name] then
            if typeof(v29.cachedParts) == "table" then
                v29.cachedParts[v31.Parent] = true;
            end;
            if v29.transparencyDirty ~= nil then
                v29.transparencyDirty = true;
            end;
        end;
    end);
end;
v27.MountTransparency = function(v32, v33) --[[ Line: 204 ]] --[[ Name: MountTransparency ]]
    local l_Update_0 = v33.Update;
    if l_Update_0 then
        v33.BaseUpdate = l_Update_0;
        v33.Update = v32.UpdateTransparency;
    else
        v32:Warn("MountTransparency - Could not find Transparency:Update()!");
    end;
    if v33.IsValidPartToModify then
        v33.IsValidPartToModify = v32.IsValidPartToModify;
        v33.HeadAttachments = v32.HeadAttachments;
        v33.ForceRefresh = true;
    else
        v32:Warn("MountTransparency - Could not find Transparency:IsValidPartToModify(part)!");
    end;
    if v33.SetupTransparency then
        v33.BaseSetupTransparency = v33.SetupTransparency;
        v33.SetupTransparency = v32.SetupTransparency;
        return;
    else
        v32:Warn("MountTransparency - Could not find Transparency:SetupTransparency(character)!");
        return;
    end;
end;
v27.GetShadowAngle = function(_) --[[ Line: 233 ]] --[[ Name: GetShadowAngle ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_l_Lighting_0_SunDirection_0 = l_Lighting_0:GetSunDirection();
    if l_l_Lighting_0_SunDirection_0.Y < -0.3 then
        l_l_Lighting_0_SunDirection_0 = l_Lighting_0:GetMoonDirection();
    end;
    return l_l_Lighting_0_SunDirection_0;
end;
v27.MirrorProperty = function(_, v38, v39, v40) --[[ Line: 247 ]] --[[ Name: MirrorProperty ]]
    v38:GetPropertyChangedSignal(v40):Connect(function() --[[ Line: 248 ]]
        -- upvalues: v39 (copy), v40 (copy), v38 (copy)
        v39[v40] = v38[v40];
    end);
end;
v27.AddHeadMirror = function(v41, v42) --[[ Line: 256 ]] --[[ Name: AddHeadMirror ]]
    if v42:IsA("BasePart") and v41:IsValidPartToModify(v42) then
        local v43 = v42:Clone();
        v43:ClearAllChildren();
        v43.Locked = true;
        v43.Anchored = true;
        v43.CanCollide = false;
        v43.Parent = v41.MirrorBin;
        local function v47(v44) --[[ Line: 266 ]] --[[ Name: onChildAdded ]]
            -- upvalues: v43 (copy), v41 (copy)
            local v45 = nil;
            if v44:IsA("DataModelMesh") then
                v45 = "Scale";
            elseif v44:IsA("Decal") then
                v45 = "Transparency";
            end;
            if v45 then
                local v46 = v44:Clone();
                v46.Parent = v43;
                v41:MirrorProperty(v44, v46, v45);
            end;
        end;
        for _, v49 in pairs(v42:GetChildren()) do
            local v50 = nil;
            if v49:IsA("DataModelMesh") then
                v50 = "Scale";
            elseif v49:IsA("Decal") then
                v50 = "Transparency";
            end;
            if v50 then
                local v51 = v49:Clone();
                v51.Parent = v43;
                v41:MirrorProperty(v49, v51, v50);
            end;
        end;
        v41.HeadMirrors[v42] = v43;
        v41:MirrorProperty(v42, v43, "Transparency");
        v42.ChildAdded:Connect(v47);
    end;
end;
v27.RemoveHeadMirror = function(v52, v53) --[[ Line: 298 ]] --[[ Name: RemoveHeadMirror ]]
    local v54 = v52.HeadMirrors[v53];
    if v54 then
        v54:Destroy();
        v52.HeadMirrors[v53] = nil;
    end;
end;
v27.OnRotationTypeChanged = function(v55) --[[ Line: 311 ]] --[[ Name: OnRotationTypeChanged ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_RunService_0 (copy)
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v57 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if v57 and v57:IsA("Humanoid") then
        if l_UserGameSettings_0.RotationType == Enum.RotationType.CameraRelative then
            v57.AutoRotate = false;
            l_RunService_0:BindToRenderStep("FpsCamera", 1000, function(v58) --[[ Line: 321 ]]
                -- upvalues: v57 (copy), l_RunService_0 (ref), l_CurrentCamera_2 (copy), v55 (copy)
                if v57.AutoRotate or not v57:IsDescendantOf(game) or v57.SeatPart and v57.SeatPart:IsA("VehicleSeat") then
                    l_RunService_0:UnbindFromRenderStep("FpsCamera");
                    return;
                elseif l_CurrentCamera_2.CameraType.Name == "Scriptable" then
                    return;
                else
                    local l_RootPart_0 = v57.RootPart;
                    local v60 = l_RootPart_0 and l_RootPart_0:IsGrounded();
                    if l_RootPart_0 and not v60 then
                        local l_v57_State_0 = v57:GetState();
                        local v62 = true;
                        if v55.InvalidRotationStates[l_v57_State_0.Name] then
                            v62 = false;
                        end;
                        if v57.Sit and v57.SeatPart and l_RootPart_0:GetRootPart() ~= l_RootPart_0 then
                            v62 = false;
                        end;
                        if v62 then
                            local l_Position_0 = l_RootPart_0.Position;
                            local v64 = math.min(0.2, v58 * 40 / 3);
                            local l_Unit_0 = (l_CurrentCamera_2.CFrame.LookVector * Vector3.new(1, 0, 1, 0)).Unit;
                            local v66 = CFrame.new(l_Position_0, l_Position_0 + l_Unit_0);
                            l_RootPart_0.CFrame = l_RootPart_0.CFrame:Lerp(v66, v64);
                        end;
                    end;
                    if v55:IsInFirstPerson() then
                        local l_CFrame_1 = l_CurrentCamera_2.CFrame;
                        local l_v55_SubjectPosition_0, _ = v55:GetSubjectPosition(v57);
                        if l_v55_SubjectPosition_0 then
                            local v70 = l_v55_SubjectPosition_0 - l_CFrame_1.Position;
                            l_CFrame_1 = l_CFrame_1 + v70;
                            l_CurrentCamera_2.CFrame = l_CFrame_1;
                            local l_l_CurrentCamera_2_0 = l_CurrentCamera_2;
                            l_l_CurrentCamera_2_0.Focus = l_l_CurrentCamera_2_0.Focus + v70;
                        end;
                        local l_v55_ShadowAngle_0 = v55:GetShadowAngle();
                        local v73 = l_CFrame_1.LookVector:Dot(l_v55_ShadowAngle_0);
                        if v73 < 0 then
                            for v74, v75 in pairs(v55.HeadMirrors) do
                                v75.CFrame = v74.CFrame + l_v55_ShadowAngle_0 * 9;
                            end;
                        end;
                        v55.MirrorBin.Parent = v73 < 0 and l_CurrentCamera_2 or nil;
                        return;
                    else
                        v55.MirrorBin.Parent = nil;
                        return;
                    end;
                end;
            end);
            return;
        else
            v57.AutoRotate = true;
            v55.MirrorBin.Parent = nil;
        end;
    end;
end;
v27.OnCharacterAdded = function(v76, v77) --[[ Line: 398 ]] --[[ Name: OnCharacterAdded ]]
    local l_MirrorBin_0 = v76.MirrorBin;
    if l_MirrorBin_0 then
        l_MirrorBin_0:ClearAllChildren();
        l_MirrorBin_0.Parent = nil;
    end;
    v76.HeadMirrors = {};
    for _, v80 in pairs(v77:GetDescendants()) do
        v76:AddHeadMirror(v80);
    end;
    v76:Connect("AddHeadMirror", v77.DescendantAdded);
    v76:Connect("RemoveHeadMirror", v77.DescendantRemoving);
end;
local v81 = false;
v27.Start = function(v82) --[[ Line: 421 ]] --[[ Name: Start ]]
    -- upvalues: v81 (ref), l_Players_0 (copy), l_UserGameSettings_0 (copy)
    if v81 then
        return;
    else
        v81 = true;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local l_Character_0 = l_LocalPlayer_0.Character;
        local l_PlayerModule_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule");
        local l_l_PlayerModule_0_FirstChild_0 = l_PlayerModule_0:FindFirstChild("BaseCamera", true);
        local l_l_PlayerModule_0_FirstChild_1 = l_PlayerModule_0:FindFirstChild("TransparencyController", true);
        if l_l_PlayerModule_0_FirstChild_0 and l_l_PlayerModule_0_FirstChild_0:IsA("ModuleScript") then
            v82:MountBaseCamera((require(l_l_PlayerModule_0_FirstChild_0)));
        else
            v82:Warn("Start - Could not find BaseCamera module!");
        end;
        if l_l_PlayerModule_0_FirstChild_1 and l_l_PlayerModule_0_FirstChild_1:IsA("ModuleScript") then
            v82:MountTransparency((require(l_l_PlayerModule_0_FirstChild_1)));
        else
            v82:Warn("Start - Cound not find TransparencyController module!");
        end;
        v82:Connect("OnRotationTypeChanged", (l_UserGameSettings_0:GetPropertyChangedSignal("RotationType")));
        v82.MirrorBin = Instance.new("Folder");
        v82.MirrorBin.Name = "HeadMirrors";
        if l_Character_0 then
            v82:OnCharacterAdded(l_Character_0);
        end;
        v82:Connect("OnCharacterAdded", l_LocalPlayer_0.CharacterAdded);
        return;
    end;
end;
return v27;