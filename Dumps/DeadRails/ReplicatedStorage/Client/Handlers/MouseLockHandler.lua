--[[
    Script: ReplicatedStorage.Client.Handlers.MouseLockHandler
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Satchel);
local v5 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local v6 = require(l_ReplicatedStorage_0.Client.LocalPlayerObjectsContainer);
local v7 = require(l_ReplicatedStorage_0.Client.Controllers.MouseController);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v9 = {};
v9.start = function() --[[ Line: 20 ]] --[[ Name: start ]]
    -- upvalues: v6 (copy), v9 (copy), l_LocalPlayer_0 (copy)
    local v10 = v6.getCharacterLoadedWrapper();
    if v10:isLoaded() then
        v9._onCharacterLoaded(l_LocalPlayer_0.Character);
    end;
    v10.loaded:Connect(function(v11) --[[ Line: 27 ]]
        -- upvalues: v9 (ref)
        v9._onCharacterLoaded(v11);
    end);
    v9._listenForWindowFocused();
    v9._listenForLockToggle();
    v9._listenForBackpackToggle();
end;
v9._listenForWindowFocused = function() --[[ Line: 36 ]] --[[ Name: _listenForWindowFocused ]]
    -- upvalues: l_UserInputService_0 (copy), l_LocalPlayer_0 (copy), v7 (copy)
    l_UserInputService_0.WindowFocused:Connect(function() --[[ Line: 37 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v7 (ref)
        if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
            v7.setMouseBehavior(Enum.MouseBehavior.LockCenter);
        end;
    end);
end;
v9._listenForLockToggle = function() --[[ Line: 44 ]] --[[ Name: _listenForLockToggle ]]
    -- upvalues: l_ContextActionService_0 (copy), v7 (copy)
    l_ContextActionService_0:BindAction("ToggleMouseLock", function(_, v13) --[[ Line: 45 ]]
        -- upvalues: v7 (ref)
        if v13 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v7.toggleMouseBehavior();
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.RightControl);
end;
v9._listenForBackpackToggle = function() --[[ Line: 56 ]] --[[ Name: _listenForBackpackToggle ]]
    -- upvalues: v4 (copy), v7 (copy)
    v4:GetStateChangedEvent().Event:Connect(function(v14) --[[ Line: 57 ]]
        -- upvalues: v4 (ref), v7 (ref)
        if not v4:GetBackpackEnabled() then
            return;
        elseif v14 then
            v7.setMouseBehavior(Enum.MouseBehavior.Default, true);
            v7.setMouseBehaviorLocked(false);
            return;
        else
            v7.setMouseBehavior(Enum.MouseBehavior.LockCenter, true);
            v7.setMouseBehaviorLocked(true);
            return;
        end;
    end);
end;
v9._onCharacterLoaded = function(v15) --[[ Line: 74 ]] --[[ Name: _onCharacterLoaded ]]
    -- upvalues: l_LocalPlayer_0 (copy), v7 (copy), v4 (copy), v5 (copy), v9 (copy)
    l_LocalPlayer_0.CameraMode = Enum.CameraMode.LockFirstPerson;
    v7.setMouseBehavior(Enum.MouseBehavior.LockCenter, true);
    v4:SetBackpackEnabled(true);
    local l_Humanoid_0 = v15:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        l_Humanoid_0:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 83 ]]
            -- upvalues: v15 (copy), v5 (ref), v9 (ref)
            if v15:HasTag(v5.Dead) then
                return;
            else
                v9._onCharacterMoved();
                return;
            end;
        end);
    end;
end;
v9._onCharacterMoved = function() --[[ Line: 93 ]] --[[ Name: _onCharacterMoved ]]
    -- upvalues: v7 (copy), v4 (copy)
    local v17 = v7.getCurrentMouseBehavior() ~= Enum.MouseBehavior.LockCenter;
    if not v4:IsOpened() and v17 then
        v7.setMouseBehavior(Enum.MouseBehavior.LockCenter);
    end;
end;
return v9;