--[[
    Script: ReplicatedStorage.Client.Controllers.ActionController.InputCategorizer
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = require(script.Signal);
local v2 = {
    KeyboardAndMouse = "KeyboardAndMouse", 
    Gamepad = "Gamepad", 
    Touch = "Touch", 
    Unknown = "Unknown"
};
local v3 = {
    InputCategory = v2, 
    lastInputCategoryChanged = v1.new(), 
    _lastInputCategory = v2.Unknown, 
    _initialized = false
};
v3.getLastInputCategory = function() --[[ Line: 28 ]] --[[ Name: getLastInputCategory ]]
    -- upvalues: v3 (copy)
    return v3._lastInputCategory;
end;
v3._setLastInputCategory = function(v4) --[[ Line: 33 ]] --[[ Name: _setLastInputCategory ]]
    -- upvalues: v3 (copy)
    if v3._lastInputCategory ~= v4 then
        v3._lastInputCategory = v4;
        v3.lastInputCategoryChanged:Fire(v4);
    end;
end;
v3._getCategoryOfInputType = function(v5) --[[ Line: 41 ]] --[[ Name: _getCategoryOfInputType ]]
    -- upvalues: v2 (copy)
    if string.find(v5.Name, "Gamepad") then
        return v2.Gamepad;
    elseif v5 == Enum.UserInputType.Keyboard or string.find(v5.Name, "Mouse") then
        return v2.KeyboardAndMouse;
    elseif v5 == Enum.UserInputType.Touch then
        return v2.Touch;
    else
        return v2.Unknown;
    end;
end;
v3._onInputTypeChanged = function(v6) --[[ Line: 53 ]] --[[ Name: _onInputTypeChanged ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v7 = v3._getCategoryOfInputType(v6);
    if v7 ~= v2.Unknown then
        v3._setLastInputCategory(v7);
    end;
end;
v3._getDefaultInputCategory = function() --[[ Line: 61 ]] --[[ Name: _getDefaultInputCategory ]]
    -- upvalues: l_UserInputService_0 (copy), v3 (copy), v2 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v9 = v3._getCategoryOfInputType(l_l_UserInputService_0_LastInputType_0);
    if v9 ~= v2.Unknown then
        return v9;
    elseif l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.MouseEnabled then
        return v2.KeyboardAndMouse;
    elseif l_UserInputService_0.TouchEnabled then
        return v2.Touch;
    elseif l_UserInputService_0.GamepadEnabled then
        return v2.Gamepad;
    else
        warn("No input devices detected!");
        return v2.Unknown;
    end;
end;
v3._initialize = function() --[[ Line: 81 ]] --[[ Name: _initialize ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy)
    assert(not v3._initialized, "InputCategorizer already initialized!");
    l_UserInputService_0.LastInputTypeChanged:Connect(v3._onInputTypeChanged);
    local v10 = v3._getDefaultInputCategory();
    v3._setLastInputCategory(v10);
    v3._initialized = true;
end;
v3._initialize();
return v3;