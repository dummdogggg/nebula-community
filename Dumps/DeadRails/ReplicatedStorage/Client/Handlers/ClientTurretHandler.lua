--[[
    Script: ReplicatedStorage.Client.Handlers.ClientTurretHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_TurretStart_0 = l_ReplicatedStorage_0.Remotes.TurretStart;
local v4 = require(l_ReplicatedStorage_0.Packages.ActionService);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0:GetMouse();
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v8 = nil;
local v9 = false;
local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
local function _(v11, v12) --[[ Line: 21 ]] --[[ Name: worldCFrameRotationToC1 ]]
    local l_Part0_0 = v11.Part0;
    local l_C0_0 = v11.C0;
    return v12:Inverse() * l_Part0_0.CFrame * l_C0_0;
end;
local function v18(_, v17) --[[ Line: 27 ]] --[[ Name: shootActionHandler ]]
    -- upvalues: v9 (ref)
    if v17 == Enum.UserInputState.Begin then
        v9 = true;
        return;
    else
        if v17 == Enum.UserInputState.End then
            v9 = false;
        end;
        return;
    end;
end;
l_TurretStart_0.OnClientEvent:Connect(function(v19, v20) --[[ Line: 35 ]]
    -- upvalues: v8 (ref), v4 (copy), v18 (copy), l_LocalPlayer_0 (copy), l_CurrentCamera_0 (copy), l_RunService_0 (copy), l_workspace_ServerTimeNow_0 (ref), v9 (ref)
    local l_Value_0 = v20:FindFirstChild("Configuration"):FindFirstChild("FireCooldown").Value;
    if v8 then
        v8:Disconnect();
        v8 = nil;
    end;
    if v19 then
        v4.bindAction("Shoot", v18, Enum.KeyCode.E, Enum.KeyCode.ButtonR2, 1);
        l_LocalPlayer_0.PlayerGui.TurretGui.Enabled = true;
        l_CurrentCamera_0.CameraSubject = v20.CameraPoint;
        local v22 = RaycastParams.new();
        v22.FilterType = Enum.RaycastFilterType.Exclude;
        v22.FilterDescendantsInstances = {
            v20
        };
        v8 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v20 (copy), l_CurrentCamera_0 (ref), v22 (copy), l_LocalPlayer_0 (ref), l_workspace_ServerTimeNow_0 (ref), l_Value_0 (copy), v9 (ref)
            local l_LookVector_0 = v20.VehicleSeat.CFrame.LookVector;
            local l_Position_0 = v20.Gun.PivotPoint.Position;
            local l_Unit_0 = (l_Position_0 + l_CurrentCamera_0.CFrame.LookVector - l_Position_0).Unit;
            local v26 = Vector3.new(0, 1, 0, 0);
            if math.abs((l_LookVector_0:Dot(v26))) > 0.99 then
                v26 = Vector3.new(1, 0, 0, 0);
            end;
            local l_Unit_1 = l_LookVector_0:Cross(v26).Unit;
            local l_Unit_2 = l_Unit_1:Cross(l_LookVector_0).Unit;
            local v29 = l_Unit_0:Dot(l_Unit_1);
            local v30 = l_Unit_0:Dot(l_Unit_2);
            local v31 = math.atan2(v29, (l_Unit_0:Dot(l_LookVector_0)));
            local v32 = math.asin(v30);
            v31 = math.clamp(v31, -1.5707963267948966, 1.5707963267948966);
            v32 = math.clamp(v32, -1.5707963267948966, 1.5707963267948966);
            local v33 = CFrame.new(l_Position_0) * CFrame.Angles(0, -v31, 0) * CFrame.Angles(0, math.rad(v20.VehicleSeat.Orientation.Y), 0) * CFrame.Angles(v32, 0, 0);
            local l_Motor6D_0 = v20.Tripod.Base.Motor6D;
            local l_Motor6D_1 = v20.Tripod.Base.Motor6D;
            local l_Part0_1 = l_Motor6D_1.Part0;
            local l_C0_1 = l_Motor6D_1.C0;
            l_Motor6D_0.C1 = v33:Inverse() * l_Part0_1.CFrame * l_C0_1;
            l_Motor6D_0 = workspace:Raycast(v20.Gun.FirePoint.Attachment.WorldPosition, v20.Gun.FirePoint.Attachment.WorldCFrame.LookVector * 1000, v22);
            local v38 = nil;
            if l_Motor6D_0 then
                l_Motor6D_1 = l_Motor6D_0.Position;
                l_Part0_1, l_C0_1 = l_CurrentCamera_0:WorldToScreenPoint(l_Motor6D_1);
                v38 = UDim2.fromOffset(l_Part0_1.X, l_Part0_1.Y);
            else
                l_Motor6D_1, l_Part0_1 = l_CurrentCamera_0:WorldToScreenPoint(v20.Gun.FirePoint.Attachment.WorldPosition + v20.Gun.FirePoint.Attachment.WorldCFrame.LookVector * 1000);
                v38 = l_Motor6D_1;
                v38 = UDim2.fromOffset(l_Motor6D_1.X, l_Motor6D_1.Y);
            end;
            l_LocalPlayer_0.PlayerGui.TurretGui.Crosshair.Position = v38;
            if v20.ClosestAmmo.Value then
                l_LocalPlayer_0.PlayerGui.TurretGui.Ammo.Text = v20.ClosestAmmo.Value.Ammo.Value;
            else
                l_LocalPlayer_0.PlayerGui.TurretGui.Ammo.Text = "No Turret Ammo nearby";
            end;
            l_C0_1 = workspace:GetServerTimeNow() - l_workspace_ServerTimeNow_0 < l_Value_0 - 0.05;
            if v9 and not l_C0_1 then
                v20.Shoot:FireServer(v20.Gun.FirePoint.Attachment.WorldPosition, v20.Gun.FirePoint.Attachment.WorldCFrame.LookVector);
                l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            end;
        end);
        return;
    else
        local _ = v20.Gun.PivotPoint.Position;
        v20.Tripod.Base.Motor6D.C1 = CFrame.Angles(0, -3.141592653589793, 1.5707963267948966);
        l_LocalPlayer_0.PlayerGui.TurretGui.Enabled = false;
        v4.unbindAction("Shoot");
        l_CurrentCamera_0.CameraSubject = l_LocalPlayer_0.Character.Humanoid;
        return;
    end;
end);