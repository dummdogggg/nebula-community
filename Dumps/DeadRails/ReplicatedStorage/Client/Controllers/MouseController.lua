--[[
    Script: ReplicatedStorage.Client.Controllers.MouseController
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("StarterPlayer");
local v2 = {
    _canSetMouseBehavior = true, 
    _currentMouseBehavior = Enum.MouseBehavior.LockCenter
};
v2.getCurrentMouseBehavior = function() --[[ Line: 10 ]] --[[ Name: getCurrentMouseBehavior ]]
    -- upvalues: v2 (copy)
    return v2._currentMouseBehavior;
end;
v2.toggleMouseBehavior = function() --[[ Line: 14 ]] --[[ Name: toggleMouseBehavior ]]
    -- upvalues: v2 (copy)
    if not v2._canSetMouseBehavior then
        return;
    else
        local l__currentMouseBehavior_0 = v2._currentMouseBehavior;
        if l__currentMouseBehavior_0 == Enum.MouseBehavior.Default then
            v2.setMouseBehavior(Enum.MouseBehavior.LockCenter);
        elseif l__currentMouseBehavior_0 == Enum.MouseBehavior.LockCenter then
            v2.setMouseBehavior(Enum.MouseBehavior.Default);
        end;
        v2._updateMouseBehavior();
        return;
    end;
end;
v2.setMouseBehavior = function(v4, v5) --[[ Line: 30 ]] --[[ Name: setMouseBehavior ]]
    -- upvalues: v2 (copy)
    if v2._canSetMouseBehavior or v5 then
        v2._currentMouseBehavior = v4;
    end;
    v2._updateMouseBehavior();
end;
v2.setMouseBehaviorLocked = function(v6) --[[ Line: 38 ]] --[[ Name: setMouseBehaviorLocked ]]
    -- upvalues: v2 (copy)
    v2._canSetMouseBehavior = v6;
end;
v2.setMouseIconVisible = function(v7) --[[ Line: 42 ]] --[[ Name: setMouseIconVisible ]]
    -- upvalues: l_UserInputService_0 (copy)
    l_UserInputService_0.MouseIconEnabled = v7;
end;
v2._updateMouseBehavior = function() --[[ Line: 46 ]] --[[ Name: _updateMouseBehavior ]]
    -- upvalues: l_UserInputService_0 (copy), v2 (copy)
    l_UserInputService_0.MouseBehavior = v2._currentMouseBehavior;
end;
return v2;