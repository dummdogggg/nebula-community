--[[
    Script: ReplicatedStorage.Client.Controllers.ActionController
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = game:GetService("ReplicatedStorage");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v5 = require("./ActionController/InputCategorizer");
local v6 = require("./ActionController/InputMetadata");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Instances_0 = script:FindFirstChild("Instances");
local l_ActionGui_0 = l_Instances_0.ActionGui;
local v10 = {
    _registeredActions = {}, 
    _initialized = false
};
local function _(v11) --[[ Line: 58 ]] --[[ Name: validateAction ]]
    -- upvalues: v10 (copy)
    if not v10._registeredActions[v11] then
        warn(debug.traceback(("Action %* is not a registered action!"):format(v11), 1));
        return false;
    else
        return true;
    end;
end;
v10._updateButtonVisibility = function() --[[ Line: 68 ]] --[[ Name: _updateButtonVisibility ]]
    -- upvalues: v10 (copy), v5 (copy)
    local v13 = {};
    for _, v15 in pairs(v10._registeredActions) do
        local v16 = tostring(v15.actionContext.buttonPosition);
        if not v13[v16] then
            v13[v16] = {};
        end;
        table.insert(v13[v16], v15);
    end;
    for _, v18 in pairs(v13) do
        if #v18 > 1 then
            table.sort(v18, function(v19, v20) --[[ Line: 86 ]]
                return v19.priority < v20.priority;
            end);
            for v21, v22 in ipairs(v18) do
                if v21 == 1 then
                    v22.button.Visible = v22.actionContext.showAction and v5.getLastInputCategory() == v5.InputCategory.Touch;
                else
                    v22.button.Visible = false;
                end;
            end;
        else
            local v23 = v18[1];
            v23.button.Visible = v23.actionContext.showAction and v5.getLastInputCategory() == v5.InputCategory.Touch;
        end;
    end;
end;
v10.setButtonVisibility = function(v24, v25) --[[ Line: 111 ]] --[[ Name: setButtonVisibility ]]
    -- upvalues: v10 (copy)
    local v26;
    if not v10._registeredActions[v24] then
        warn(debug.traceback(("Action %* is not a registered action!"):format(v24), 1));
        v26 = false;
    else
        v26 = true;
    end;
    if not v26 then
        return;
    else
        v10._registeredActions[v24].actionContext.showAction = v25;
        v10._updateButtonVisibility();
        return;
    end;
end;
v10.isBound = function(v27) --[[ Line: 123 ]] --[[ Name: isBound ]]
    -- upvalues: v10 (copy)
    assert(typeof(v27) == "string", "First argument must be a string!");
    return v10._registeredActions[v27] ~= nil;
end;
v10.bindAction = function(v28, v29, v30, v31, v32, v33) --[[ Line: 128 ]] --[[ Name: bindAction ]]
    -- upvalues: v10 (copy), l_Instances_0 (copy), l_ActionGui_0 (copy), v5 (copy), l_ContextActionService_0 (copy)
    if v10._registeredActions[v28] then
        warn((("Action %* is already registered!"):format(v28)));
        return;
    else
        local v34 = {
            actionName = v28, 
            actionContext = v30, 
            keyboardAndMouseInput = v31, 
            gamepadInput = v32, 
            priority = v33 or 0, 
            connections = {}, 
            pressed = false
        };
        local function _() --[[ Line: 152 ]] --[[ Name: createActionFrame ]]
            -- upvalues: l_Instances_0 (ref), v30 (copy), v34 (copy), l_ActionGui_0 (ref)
            local v35 = l_Instances_0.ActionFrame:Clone();
            v35.ContentFrame.ActionLabel.Text = v30.buttonText;
            v35.LayoutOrder = v34.priority;
            v35.Parent = l_ActionGui_0.RightListFrame;
            return v35;
        end;
        local v37 = l_Instances_0.ActionFrame:Clone();
        v37.ContentFrame.ActionLabel.Text = v30.buttonText;
        v37.LayoutOrder = v34.priority;
        v37.Parent = l_ActionGui_0.RightListFrame;
        v34.frame = v37;
        local v38 = l_Instances_0.TouchButton:Clone();
        v38.ActionText.Text = v30.buttonText or "";
        v38.ActionIcon.Image = v30.buttonImage or "";
        v38.Size = v30.buttonSize;
        v38.Position = v30.buttonPosition;
        v38.Parent = l_ActionGui_0.TouchButtons;
        v38.Visible = v30.showAction and v5.getLastInputCategory() == v5.InputCategory.Touch;
        v34.button = v38;
        v37 = function(...) --[[ Line: 178 ]]
            -- upvalues: v28 (copy), v34 (copy), l_Instances_0 (ref), v30 (copy), l_ActionGui_0 (ref), v38 (copy), v29 (copy)
            local v39, v40 = ...;
            if v39 == v28 then
                if v40 == Enum.UserInputState.Begin then
                    v34.pressed = true;
                    if v34.frame then
                        local l_ContentFrame_0 = v34.frame:FindFirstChild("ContentFrame");
                        if l_ContentFrame_0 then
                            if not l_ContentFrame_0:FindFirstChild("ActionLabel") then
                                v34.frame:Destroy();
                                local l_v34_0 = v34;
                                local v43 = l_Instances_0.ActionFrame:Clone();
                                v43.ContentFrame.ActionLabel.Text = v30.buttonText;
                                v43.LayoutOrder = v34.priority;
                                v43.Parent = l_ActionGui_0.RightListFrame;
                                l_v34_0.frame = v43;
                            end;
                        else
                            v34.frame:Destroy();
                            local l_v34_1 = v34;
                            local v45 = l_Instances_0.ActionFrame:Clone();
                            v45.ContentFrame.ActionLabel.Text = v30.buttonText;
                            v45.LayoutOrder = v34.priority;
                            v45.Parent = l_ActionGui_0.RightListFrame;
                            l_v34_1.frame = v45;
                        end;
                    else
                        local l_v34_2 = v34;
                        local v47 = l_Instances_0.ActionFrame:Clone();
                        v47.ContentFrame.ActionLabel.Text = v30.buttonText;
                        v47.LayoutOrder = v34.priority;
                        v47.Parent = l_ActionGui_0.RightListFrame;
                        l_v34_2.frame = v47;
                    end;
                    v34.frame.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(1, 1, 1);
                    v34.frame.ContentFrame.ActionLabel.TextColor3 = Color3.new(0, 0, 0);
                    v38.BackgroundColor3 = Color3.new(1, 1, 1);
                elseif v40 == Enum.UserInputState.End then
                    v34.pressed = false;
                    if v34.frame then
                        local l_ContentFrame_1 = v34.frame:FindFirstChild("ContentFrame");
                        if l_ContentFrame_1 then
                            if not l_ContentFrame_1:FindFirstChild("ActionLabel") then
                                v34.frame:Destroy();
                                local l_v34_3 = v34;
                                local v50 = l_Instances_0.ActionFrame:Clone();
                                v50.ContentFrame.ActionLabel.Text = v30.buttonText;
                                v50.LayoutOrder = v34.priority;
                                v50.Parent = l_ActionGui_0.RightListFrame;
                                l_v34_3.frame = v50;
                            end;
                        else
                            v34.frame:Destroy();
                            local l_v34_4 = v34;
                            local v52 = l_Instances_0.ActionFrame:Clone();
                            v52.ContentFrame.ActionLabel.Text = v30.buttonText;
                            v52.LayoutOrder = v34.priority;
                            v52.Parent = l_ActionGui_0.RightListFrame;
                            l_v34_4.frame = v52;
                        end;
                    else
                        local l_v34_5 = v34;
                        local v54 = l_Instances_0.ActionFrame:Clone();
                        v54.ContentFrame.ActionLabel.Text = v30.buttonText;
                        v54.LayoutOrder = v34.priority;
                        v54.Parent = l_ActionGui_0.RightListFrame;
                        l_v34_5.frame = v54;
                    end;
                    v34.frame.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(0, 0, 0);
                    v34.frame.ContentFrame.ActionLabel.TextColor3 = Color3.new(1, 1, 1);
                    v38.BackgroundColor3 = Color3.new(0, 0, 0);
                end;
            end;
            return v29(...);
        end;
        v10._updateInputDisplay(v34, v5.getLastInputCategory());
        table.insert(v34.connections, v38.InputBegan:Connect(function(v55) --[[ Line: 243 ]]
            -- upvalues: v37 (copy), v28 (copy)
            if v55.UserInputType == Enum.UserInputType.Touch and v55.UserInputState ~= Enum.UserInputState.Change then
                v37(v28, Enum.UserInputState.Begin, v55);
            end;
        end));
        table.insert(v34.connections, v38.InputEnded:Connect(function(v56) --[[ Line: 252 ]]
            -- upvalues: v37 (copy), v28 (copy)
            if v56.UserInputType == Enum.UserInputType.Touch then
                v37(v28, Enum.UserInputState.End, v56);
            end;
        end));
        l_ContextActionService_0:BindActionAtPriority(v34.actionName, v37, false, v34.priority, v34.keyboardAndMouseInput, v34.gamepadInput);
        v10._registeredActions[v28] = v34;
        v10._updateButtonVisibility();
        return;
    end;
end;
v10.unbindAction = function(v57) --[[ Line: 274 ]] --[[ Name: unbindAction ]]
    -- upvalues: v10 (copy), l_ContextActionService_0 (copy)
    local v58 = v10._registeredActions[v57];
    if v58 then
        for _, v60 in v58.connections do
            v60:Disconnect();
        end;
        v58.frame:Destroy();
        v58.button:Destroy();
        v10._registeredActions[v57] = nil;
        v10._updateButtonVisibility();
    end;
    l_ContextActionService_0:UnbindAction(v57);
end;
v10.isPressed = function(v61) --[[ Line: 296 ]] --[[ Name: isPressed ]]
    -- upvalues: v10 (copy)
    local v62;
    if not v10._registeredActions[v61] then
        warn(debug.traceback(("Action %* is not a registered action!"):format(v61), 1));
        v62 = false;
    else
        v62 = true;
    end;
    if not v62 then
        return false;
    else
        return v10._registeredActions[v61].pressed;
    end;
end;
v10.setButtonText = function(v63, v64) --[[ Line: 305 ]] --[[ Name: setButtonText ]]
    -- upvalues: v10 (copy)
    local v65;
    if not v10._registeredActions[v63] then
        warn(debug.traceback(("Action %* is not a registered action!"):format(v63), 1));
        v65 = false;
    else
        v65 = true;
    end;
    if not v65 then
        return;
    else
        v65 = v10._registeredActions[v63];
        v65.actionContext.buttonText = v64 or "";
        v65.frame.ContentFrame.ActionLabel.Text = v65.actionContext.buttonText;
        v65.button.ActionText.Text = v65.actionContext.buttonText;
        return;
    end;
end;
v10._updateInputDisplay = function(v66, v67) --[[ Line: 321 ]] --[[ Name: _updateInputDisplay ]]
    -- upvalues: v5 (copy), v10 (copy)
    local l_ButtonDisplayFrame_0 = v66.frame.ContentFrame.InputFrame:FindFirstChild("ButtonDisplayFrame");
    if l_ButtonDisplayFrame_0 then
        l_ButtonDisplayFrame_0:Destroy();
    end;
    local v69 = nil;
    if v67 == v5.InputCategory.KeyboardAndMouse then
        v69 = v10._getButtonDisplayForInput(v66.keyboardAndMouseInput);
    elseif v67 == v5.InputCategory.Gamepad then
        v69 = v10._getButtonDisplayForInput(v66.gamepadInput);
    elseif v67 == v5.InputCategory.Touch then
        v69 = v10._getButtonDisplayForInput(Enum.UserInputType.Touch);
    end;
    v69.Parent = v66.frame.ContentFrame.InputFrame;
    if v67 == v5.InputCategory.Touch then
        v10._updateButtonVisibility();
        return;
    else
        v66.button.Visible = false;
        return;
    end;
end;
v10._getButtonDisplayForInput = function(v70) --[[ Line: 349 ]] --[[ Name: _getButtonDisplayForInput ]]
    -- upvalues: l_Instances_0 (copy), l_UserInputService_0 (copy), v6 (copy)
    local v71 = l_Instances_0.ButtonDisplayFrame:Clone();
    local v72 = nil;
    if v70.EnumType == Enum.KeyCode then
        v72 = l_UserInputService_0:GetImageForKeyCode(v70);
    end;
    if v70 == Enum.UserInputType.Touch then
        l_Instances_0.TouchImageLabel:Clone().Parent = v71;
        return v71;
    elseif v72 and v72 ~= "" then
        local v73 = l_Instances_0.GamepadImageLabel:Clone();
        v73.Image = v72;
        v73.Parent = v71;
        return v71;
    elseif v6.MouseButtonImage[v70] then
        local v74 = l_Instances_0.MouseImageLabel:Clone();
        v74.Image = v6.MouseButtonImage[v70];
        v74.Parent = v71;
        return v71;
    else
        l_Instances_0.KeyboardBorderImage:Clone().Parent = v71;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v70);
        local v76 = v6.KeyboardButtonImage[v70] or v6.KeyboardButtonIconMapping[l_l_UserInputService_0_StringForKeyCode_0];
        if not v76 then
            local v77 = v6.KeyCodeToTextMapping[v70];
            if v77 then
                l_l_UserInputService_0_StringForKeyCode_0 = v77;
            end;
        end;
        if v76 then
            local v78 = l_Instances_0.KeyboardImageLabel:Clone();
            v78.Image = v76;
            v78.Parent = v71;
            return v71;
        else
            if l_l_UserInputService_0_StringForKeyCode_0 and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
                local v79 = l_Instances_0.KeyboardTextLabel:Clone();
                v79.Text = l_l_UserInputService_0_StringForKeyCode_0;
                v79.TextSize = v6.KeyCodeToFontSize[v70] or v6.DefaultFontSize;
                v79.Parent = v71;
            end;
            return v71;
        end;
    end;
end;
v10._updateUIPositionAndScale = function() --[[ Line: 405 ]] --[[ Name: _updateUIPositionAndScale ]]
    -- upvalues: l_PlayerGui_0 (copy), l_ActionGui_0 (copy), v5 (copy)
    local v80 = l_PlayerGui_0:FindFirstChild("TouchGui") ~= nil;
    local v81 = math.min(l_ActionGui_0.AbsoluteSize.X, l_ActionGui_0.AbsoluteSize.Y) < 500;
    if v80 and v5.getLastInputCategory() == v5.InputCategory.Touch then
        l_ActionGui_0.RightListFrame.Visible = false;
    else
        l_ActionGui_0.RightListFrame.Visible = true;
    end;
    l_ActionGui_0.RightListFrame.UIScale.Scale = v81 and 0.85 or 1;
    l_ActionGui_0.RightListFrame.Position = UDim2.new(1, -40, 1, -40);
end;
v10._start = function() --[[ Line: 424 ]] --[[ Name: _start ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy), l_PlayerGui_0 (copy), v5 (copy), l_ActionGui_0 (copy)
    assert(not v10._initialized, "ActionController already initialized!");
    assert(l_RunService_0:IsClient(), "ActionController can only be used on the client!");
    l_PlayerGui_0.ChildAdded:Connect(function(v82) --[[ Line: 429 ]]
        -- upvalues: v10 (ref)
        if v82.Name == "TouchGui" then
            v10._updateUIPositionAndScale();
        end;
    end);
    l_PlayerGui_0.ChildRemoved:Connect(function(v83) --[[ Line: 435 ]]
        -- upvalues: v10 (ref)
        if v83.Name == "TouchGui" then
            v10._updateUIPositionAndScale();
        end;
    end);
    v5.lastInputCategoryChanged:Connect(function(v84) --[[ Line: 442 ]]
        -- upvalues: v10 (ref)
        for _, v86 in v10._registeredActions do
            v10._updateInputDisplay(v86, v84);
        end;
        v10._updateButtonVisibility();
    end);
    l_ActionGui_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v10._updateUIPositionAndScale);
    v5.lastInputCategoryChanged:Connect(v10._updateUIPositionAndScale);
    l_ActionGui_0.Parent = l_PlayerGui_0;
    v10._initialized = true;
end;
v10._start();
return v10;