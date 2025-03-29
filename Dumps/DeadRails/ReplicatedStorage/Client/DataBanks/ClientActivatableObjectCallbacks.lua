--[[
    Script: ReplicatedStorage.Client.DataBanks.ClientActivatableObjectCallbacks
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_CaptureService_0 = game:GetService("CaptureService");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v7 = require(l_Packages_0.Satchel);
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v9 = require(l_Shared_0.Utils.DraggableObjectUtil);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Client");
local v11 = nil;
local v12 = require(l_script_FirstAncestor_0.Controllers.MouseController);
local _ = v9.isValidDraggableObject;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_TweenService_0 = game:GetService("TweenService");
local v17 = TweenInfo.new(0.5, Enum.EasingStyle.Quad);
local v18 = {};
local v19 = {
    PlayerList = true, 
    Health = true, 
    Backpack = true, 
    Chat = true, 
    EmotesMenu = true, 
    Captures = true
};
local v20 = {
    BadgesNotificationsActive = true, 
    PointsNotificationsActive = true
};
local function v26() --[[ Line: 46 ]] --[[ Name: pushUI ]]
    -- upvalues: v19 (copy), v7 (copy), l_StarterGui_0 (copy), v20 (copy), l_LocalPlayer_0 (copy), v18 (copy)
    for v21 in pairs(v19) do
        if v21 == "Backpack" then
            v19[v21] = v7:GetBackpackEnabled();
            v7:SetBackpackEnabled(false);
        else
            v19[v21] = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType[v21]);
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v21], false);
        end;
    end;
    for v22 in pairs(v20) do
        v20[v22] = l_StarterGui_0:GetCore(v22);
        l_StarterGui_0:SetCore(v22, false);
    end;
    local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
    if l_PlayerGui_0 then
        for _, v25 in ipairs(l_PlayerGui_0:GetChildren()) do
            if v25:IsA("ScreenGui") and v25.Enabled then
                table.insert(v18, v25);
                v25.Enabled = false;
            end;
        end;
    end;
end;
local function v33() --[[ Line: 76 ]] --[[ Name: popUI ]]
    -- upvalues: v19 (copy), v7 (copy), l_StarterGui_0 (copy), v20 (copy), v18 (copy)
    for v27, v28 in pairs(v19) do
        if v27 == "Backpack" then
            v7:SetBackpackEnabled(v28);
        else
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v27], v28);
        end;
    end;
    for v29, v30 in pairs(v20) do
        l_StarterGui_0:SetCore(v29, v30);
    end;
    for _, v32 in ipairs(v18) do
        if v32.Parent then
            v32.Enabled = true;
        end;
    end;
    table.clear(v18);
end;
return {
    Camera = function(v34, v35, v36) --[[ Line: 103 ]] --[[ Name: Camera ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_CurrentCamera_0 (copy), v26 (copy), l_CaptureService_0 (copy), v12 (copy), v33 (copy)
        if not v35 or not v36 then
            return;
        elseif not v34 or not v34:IsDescendantOf(workspace) then
            return;
        else
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            local l_LockFirstPerson_0 = Enum.CameraMode.LockFirstPerson;
            local l_CameraMinZoomDistance_0 = l_LocalPlayer_0.CameraMinZoomDistance;
            local l_CameraMaxZoomDistance_0 = l_LocalPlayer_0.CameraMaxZoomDistance;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 119 ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_workspace_ServerTimeNow_0 (ref), v36 (copy), v34 (copy), l_CurrentCamera_0 (ref), v26 (ref), l_CaptureService_0 (ref), v12 (ref), v33 (ref), l_CameraMinZoomDistance_0 (copy), l_CameraMaxZoomDistance_0 (copy), l_LockFirstPerson_0 (copy)
                l_LocalPlayer_0.CameraMode = Enum.CameraMode.Classic;
                l_LocalPlayer_0.CameraMinZoomDistance = 10;
                l_LocalPlayer_0.CameraMinZoomDistance = 10;
                while l_workspace_ServerTimeNow_0 < v36 do
                    task.wait();
                    l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                end;
                local l_v34_FirstChild_0 = v34:FindFirstChild("CaptureAttachment", true);
                local l_CameraType_0 = l_CurrentCamera_0.CameraType;
                local l_CFrame_0 = l_CurrentCamera_0.CFrame;
                l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                l_CurrentCamera_0.CFrame = l_v34_FirstChild_0.WorldCFrame;
                v26();
                l_CaptureService_0:CaptureScreenshot(function(v44) --[[ Line: 139 ]]
                    -- upvalues: v12 (ref), l_CaptureService_0 (ref)
                    local v45 = v12.getCurrentMouseBehavior();
                    v12.setMouseIconVisible(true);
                    v12.setMouseBehavior(Enum.MouseBehavior.Default, true);
                    v12.setMouseBehaviorLocked(false);
                    l_CaptureService_0:PromptSaveCapturesToGallery({
                        v44
                    }, function(...) --[[ Line: 146 ]]
                        -- upvalues: v12 (ref), v45 (copy)
                        v12.setMouseIconVisible(false);
                        v12.setMouseBehavior(v45);
                        v12.setMouseBehaviorLocked(true);
                    end);
                end);
                task.wait();
                v33();
                l_CurrentCamera_0.CFrame = l_CFrame_0;
                l_CurrentCamera_0.CameraType = l_CameraType_0;
                l_LocalPlayer_0.CameraMinZoomDistance = l_CameraMinZoomDistance_0;
                l_LocalPlayer_0.CameraMaxZoomDistance = l_CameraMaxZoomDistance_0;
                l_LocalPlayer_0.CameraMode = l_LockFirstPerson_0;
            end);
            if not l_status_0 then
                warn("Camera callback failed:", l_result_0);
                l_LocalPlayer_0.CameraMinZoomDistance = l_CameraMinZoomDistance_0;
                l_LocalPlayer_0.CameraMaxZoomDistance = l_CameraMaxZoomDistance_0;
                l_LocalPlayer_0.CameraMode = l_LockFirstPerson_0;
            end;
            return;
        end;
    end, 
    Bond = function(_, v49, v50) --[[ Line: 174 ]] --[[ Name: Bond ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_TweenService_0 (copy), v17 (copy), v11 (ref)
        if not v49 then
            return;
        else
            l_LocalPlayer_0.PlayerGui.BondGui.BondInfo.BondCount.Text = v50;
            l_TweenService_0:Create(l_LocalPlayer_0.PlayerGui.BondGui.BondInfo, v17, {
                Position = UDim2.fromScale(0.01, 0.593)
            }):Play();
            if v11 then
                task.cancel(v11);
                v11 = nil;
            end;
            v11 = task.delay(5, function() --[[ Line: 189 ]]
                -- upvalues: l_TweenService_0 (ref), l_LocalPlayer_0 (ref), v17 (ref)
                l_TweenService_0:Create(l_LocalPlayer_0.PlayerGui.BondGui.BondInfo, v17, {
                    Position = UDim2.fromScale(-0.51, 0.593)
                }):Play();
                print("Close");
            end);
            return;
        end;
    end
};