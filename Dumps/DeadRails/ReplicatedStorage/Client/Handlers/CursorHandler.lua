--[[
    Script: ReplicatedStorage.Client.Handlers.CursorHandler
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_Players_1 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Client.LocalPlayerObjectsContainer);
local _ = require(l_ReplicatedStorage_0.Client.Controllers.MouseController);
local v9 = require(l_ReplicatedStorage_0.Client.Controllers.ActionController.InputCategorizer);
local l_LocalPlayer_0 = l_Players_1.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui;
local v12 = nil;
local v13 = {};
v13.startAsync = function() --[[ Line: 24 ]] --[[ Name: startAsync ]]
    -- upvalues: v12 (ref), l_LocalPlayer_0 (copy), l_UserInputService_0 (copy), l_StarterPlayer_0 (copy), l_RunService_0 (copy), v13 (copy)
    v12 = l_LocalPlayer_0.PlayerGui:WaitForChild("Crosshair", 1e999):WaitForChild("Crosshair", 1e999);
    l_UserInputService_0.MouseIconEnabled = false;
    l_StarterPlayer_0.EnableMouseLockOption = false;
    l_RunService_0.RenderStepped:Connect(v13._onRenderStepped);
end;
v13._onRenderStepped = function() --[[ Line: 33 ]] --[[ Name: _onRenderStepped ]]
    -- upvalues: v9 (copy), v12 (ref), l_UserInputService_0 (copy)
    if v9.getLastInputCategory() == v9.InputCategory.Touch then
        v12.Position = UDim2.fromScale(0.5, 0.5);
        return;
    else
        local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
        v12.Position = UDim2.fromOffset(l_l_UserInputService_0_MouseLocation_0.X, l_l_UserInputService_0_MouseLocation_0.Y);
        return;
    end;
end;
return v13;