--[[
    Script: ReplicatedStorage.Packages.ActionService
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(script.InputCategorizer);
local v5 = require(script.InputMetadata);
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Instances_0 = script.Instances;
local l_ActionGui_0 = l_Instances_0.ActionGui;
local v9 = {
    KeyboardAndMouse = "KeyboardAndMouse", 
    Gamepad = "Gamepad", 
    Touch = "Touch", 
    Unknown = "Unknown"
};
local v10 = {
    InputCategory = v9, 
    _initialized = false, 
    _bindings = {}
};
v10.bindAction = function(v11, v12, v13, v14, v15) --[[ Line: 34 ]] --[[ Name: bindAction ]]
    -- upvalues: v10 (copy), l_Instances_0 (copy), l_ActionGui_0 (copy), v4 (copy), l_ContextActionService_0 (copy)
    if v10._bindings[v11] then
        warn(string.format("'%s' is already bound!", v11));
        return;
    else
        local v16 = {
            connections = {}, 
            keyboardAndMouseInput = v13, 
            gamepadInput = v14
        };
        local v17 = l_Instances_0.ActionFrame:Clone();
        v17.ContentFrame.ActionLabel.Text = v11;
        v17.LayoutOrder = v15 or 0;
        v17.Parent = l_ActionGui_0.ListFrame;
        v16.frame = v17;
        v10._updateInputDisplay(v16, v4.getLastInputCategory());
        local function v20(...) --[[ Line: 63 ]]
            -- upvalues: v11 (copy), v17 (copy), v12 (copy)
            local v18, v19 = ...;
            if v18 == v11 then
                if v19 == Enum.UserInputState.Begin then
                    v17.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(1, 1, 1);
                    v17.ContentFrame.ActionLabel.TextColor3 = Color3.new(0, 0, 0);
                elseif v19 == Enum.UserInputState.End then
                    v17.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(0, 0, 0);
                    v17.ContentFrame.ActionLabel.TextColor3 = Color3.new(1, 1, 1);
                end;
            end;
            v12(...);
        end;
        table.insert(v16.connections, v17.TouchButton.InputBegan:Connect(function(v21) --[[ Line: 82 ]]
            -- upvalues: v20 (copy), v11 (copy)
            if v21.UserInputType == Enum.UserInputType.Touch then
                v20(v11, Enum.UserInputState.Begin, v21);
            end;
        end));
        table.insert(v16.connections, v17.TouchButton.InputEnded:Connect(function(v22) --[[ Line: 91 ]]
            -- upvalues: v20 (copy), v11 (copy)
            if v22.UserInputType == Enum.UserInputType.Touch then
                v20(v11, Enum.UserInputState.End, v22);
            end;
        end));
        l_ContextActionService_0:BindAction(v11, v20, false, v13, v14);
        v10._bindings[v11] = v16;
        return;
    end;
end;
v10.unbindAction = function(v23) --[[ Line: 104 ]] --[[ Name: unbindAction ]]
    -- upvalues: v10 (copy), l_ContextActionService_0 (copy)
    local v24 = v10._bindings[v23];
    if v24 then
        for _, v26 in v24.connections do
            v26:Disconnect();
        end;
        v24.frame:Destroy();
        v10._bindings[v23] = nil;
    end;
    l_ContextActionService_0:UnbindAction(v23);
end;
v10._updateInputDisplay = function(v27, v28) --[[ Line: 120 ]] --[[ Name: _updateInputDisplay ]]
    -- upvalues: v9 (copy), v10 (copy)
    local l_ButtonDisplayFrame_0 = v27.frame.ContentFrame.InputFrame:FindFirstChild("ButtonDisplayFrame");
    if l_ButtonDisplayFrame_0 then
        l_ButtonDisplayFrame_0:Destroy();
    end;
    local v30 = nil;
    if v28 == v9.KeyboardAndMouse then
        v30 = v10._getButtonDisplayForInput(v27.keyboardAndMouseInput);
    elseif v28 == v9.Gamepad then
        v30 = v10._getButtonDisplayForInput(v27.gamepadInput);
    elseif v28 == v9.Touch then
        v30 = v10._getButtonDisplayForInput(Enum.UserInputType.Touch);
    end;
    v30.Parent = v27.frame.ContentFrame.InputFrame;
    v27.frame.TouchButton.Visible = v28 == v9.Touch;
end;
v10._getButtonDisplayForInput = function(v31) --[[ Line: 143 ]] --[[ Name: _getButtonDisplayForInput ]]
    -- upvalues: l_Instances_0 (copy), l_UserInputService_0 (copy), v5 (copy)
    local v32 = l_Instances_0.ButtonDisplayFrame:Clone();
    local v33 = nil;
    if v31.EnumType == Enum.KeyCode then
        v33 = l_UserInputService_0:GetImageForKeyCode(v31);
    end;
    if v31 == Enum.UserInputType.Touch then
        l_Instances_0.TouchImageLabel:Clone().Parent = v32;
        return v32;
    elseif v33 and v33 ~= "" then
        local v34 = l_Instances_0.GamepadImageLabel:Clone();
        v34.Image = v33;
        v34.Parent = v32;
        return v32;
    elseif v5.MouseButtonImage[v31] then
        local v35 = l_Instances_0.MouseImageLabel:Clone();
        v35.Image = v5.MouseButtonImage[v31];
        v35.Parent = v32;
        return v32;
    else
        l_Instances_0.KeyboardBorderImage:Clone().Parent = v32;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v31);
        local v37 = v5.KeyboardButtonImage[v31] or v5.KeyboardButtonIconMapping[l_l_UserInputService_0_StringForKeyCode_0];
        if not v37 then
            local v38 = v5.KeyCodeToTextMapping[v31];
            if v38 then
                l_l_UserInputService_0_StringForKeyCode_0 = v38;
            end;
        end;
        if v37 then
            local v39 = l_Instances_0.KeyboardImageLabel:Clone();
            v39.Image = v37;
            v39.Parent = v32;
            return v32;
        else
            if l_l_UserInputService_0_StringForKeyCode_0 and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
                local v40 = l_Instances_0.KeyboardTextLabel:Clone();
                v40.Text = l_l_UserInputService_0_StringForKeyCode_0;
                v40.TextSize = v5.KeyCodeToFontSize[v31] or v5.DefaultFontSize;
                v40.Parent = v32;
            end;
            return v32;
        end;
    end;
end;
v10._getCategoryOfInputType = function(v41) --[[ Line: 199 ]] --[[ Name: _getCategoryOfInputType ]]
    -- upvalues: v9 (copy)
    if string.find(v41.Name, "Gamepad") then
        return v9.Gamepad;
    elseif v41 == Enum.UserInputType.Keyboard or string.find(v41.Name, "Mouse") then
        return v9.KeyboardAndMouse;
    elseif v41 == Enum.UserInputType.Touch then
        return v9.Touch;
    else
        return v9.Unknown;
    end;
end;
v10._getDefaultInputCategory = function() --[[ Line: 212 ]] --[[ Name: _getDefaultInputCategory ]]
    -- upvalues: l_UserInputService_0 (copy), v9 (copy)
    if l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.MouseEnabled then
        return v9.KeyboardAndMouse;
    elseif l_UserInputService_0.TouchEnabled then
        return v9.Touch;
    elseif l_UserInputService_0.GamepadEnabled then
        return v9.Gamepad;
    else
        return v9.Unknown;
    end;
end;
v10._updatePositionAndScale = function() --[[ Line: 225 ]] --[[ Name: _updatePositionAndScale ]]
    -- upvalues: l_PlayerGui_0 (copy), l_ActionGui_0 (copy), v4 (copy), v9 (copy)
    local v42 = l_PlayerGui_0:FindFirstChild("TouchGui") ~= nil;
    local v43 = math.min(l_ActionGui_0.AbsoluteSize.X, l_ActionGui_0.AbsoluteSize.Y) < 500;
    local v44 = 40;
    if v42 and v4.getLastInputCategory() == v9.Touch then
        v44 = v44 + (v43 and 70 or 210);
    end;
    l_ActionGui_0.ListFrame.UIScale.Scale = v43 and 0.85 or 1;
    l_ActionGui_0.ListFrame.Position = UDim2.new(1, -40, 1, -v44);
end;
v10._initialize = function() --[[ Line: 243 ]] --[[ Name: _initialize ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy), l_PlayerGui_0 (copy), v4 (copy), l_ActionGui_0 (copy)
    assert(not v10._initialized, "ActionManager already initialized!");
    assert(l_RunService_0:IsClient(), "ActionManager can only be used on the client!");
    l_PlayerGui_0.ChildAdded:Connect(function(v45) --[[ Line: 248 ]]
        -- upvalues: v10 (ref)
        if v45.Name == "TouchGui" then
            v10._updatePositionAndScale();
        end;
    end);
    l_PlayerGui_0.ChildRemoved:Connect(function(v46) --[[ Line: 254 ]]
        -- upvalues: v10 (ref)
        if v46.Name == "TouchGui" then
            v10._updatePositionAndScale();
        end;
    end);
    v4.lastInputCategoryChanged:Connect(function(v47) --[[ Line: 261 ]]
        -- upvalues: v10 (ref)
        for _, v49 in v10._bindings do
            v10._updateInputDisplay(v49, v47);
        end;
    end);
    l_ActionGui_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v10._updatePositionAndScale);
    v4.lastInputCategoryChanged:Connect(v10._updatePositionAndScale);
    l_ActionGui_0.Parent = l_PlayerGui_0;
    v10._updatePositionAndScale();
    v10._initialized = true;
end;
v10._initialize();
return v10;