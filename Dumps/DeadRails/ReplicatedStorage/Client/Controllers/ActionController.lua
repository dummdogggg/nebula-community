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
local function _(v11) --[[ Line: 57 ]] --[[ Name: validateAction ]]
    -- upvalues: v10 (copy)
    if not v10._registeredActions[v11] then
        warn((("Action %* is not a registered action!"):format(v11)));
        return false;
    else
        return true;
    end;
end;
v10.bindAction = function(v13, v14, v15, v16, v17, v18) --[[ Line: 66 ]] --[[ Name: bindAction ]]
    -- upvalues: v10 (copy), l_Instances_0 (copy), l_ActionGui_0 (copy), v5 (copy), l_ContextActionService_0 (copy)
    if v10._registeredActions[v13] then
        warn((("Action %* is already registered!"):format(v13)));
        return;
    else
        local v19 = {
            actionName = v13, 
            actionContext = v15, 
            keyboardAndMouseInput = v16, 
            gamepadInput = v17, 
            priority = v18 or 0, 
            connections = {}
        };
        local function _() --[[ Line: 89 ]] --[[ Name: createActionFrame ]]
            -- upvalues: l_Instances_0 (ref), v15 (copy), v19 (copy), l_ActionGui_0 (ref)
            local v20 = l_Instances_0.ActionFrame:Clone();
            v20.ContentFrame.ActionLabel.Text = v15.buttonText;
            v20.LayoutOrder = v19.priority;
            v20.Parent = l_ActionGui_0.RightListFrame;
            return v20;
        end;
        local v22 = l_Instances_0.ActionFrame:Clone();
        v22.ContentFrame.ActionLabel.Text = v15.buttonText;
        v22.LayoutOrder = v19.priority;
        v22.Parent = l_ActionGui_0.RightListFrame;
        v19.frame = v22;
        local v23 = l_Instances_0.TouchButton:Clone();
        v23.ActionText.Text = v15.buttonText or "";
        v23.ActionIcon.Image = v15.buttonImage or "";
        v23.Size = v15.buttonSize;
        v23.Position = v15.buttonPosition;
        v23.Parent = l_ActionGui_0.TouchButtons;
        v19.button = v23;
        v22 = function(...) --[[ Line: 111 ]]
            -- upvalues: v13 (copy), v19 (copy), l_Instances_0 (ref), v15 (copy), l_ActionGui_0 (ref), v23 (copy), v14 (copy)
            local v24, v25 = ...;
            if v24 == v13 then
                if v25 == Enum.UserInputState.Begin then
                    if v19.frame then
                        local l_ContentFrame_0 = v19.frame:FindFirstChild("ContentFrame");
                        if l_ContentFrame_0 then
                            if not l_ContentFrame_0:FindFirstChild("ActionLabel") then
                                v19.frame:Destroy();
                                local l_v19_0 = v19;
                                local v28 = l_Instances_0.ActionFrame:Clone();
                                v28.ContentFrame.ActionLabel.Text = v15.buttonText;
                                v28.LayoutOrder = v19.priority;
                                v28.Parent = l_ActionGui_0.RightListFrame;
                                l_v19_0.frame = v28;
                            end;
                        else
                            v19.frame:Destroy();
                            local l_v19_1 = v19;
                            local v30 = l_Instances_0.ActionFrame:Clone();
                            v30.ContentFrame.ActionLabel.Text = v15.buttonText;
                            v30.LayoutOrder = v19.priority;
                            v30.Parent = l_ActionGui_0.RightListFrame;
                            l_v19_1.frame = v30;
                        end;
                    else
                        local l_v19_2 = v19;
                        local v32 = l_Instances_0.ActionFrame:Clone();
                        v32.ContentFrame.ActionLabel.Text = v15.buttonText;
                        v32.LayoutOrder = v19.priority;
                        v32.Parent = l_ActionGui_0.RightListFrame;
                        l_v19_2.frame = v32;
                    end;
                    v19.frame.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(1, 1, 1);
                    v19.frame.ContentFrame.ActionLabel.TextColor3 = Color3.new(0, 0, 0);
                    v23.BackgroundColor3 = Color3.new(1, 1, 1);
                elseif v25 == Enum.UserInputState.End then
                    if v19.frame then
                        local l_ContentFrame_1 = v19.frame:FindFirstChild("ContentFrame");
                        if l_ContentFrame_1 then
                            if not l_ContentFrame_1:FindFirstChild("ActionLabel") then
                                v19.frame:Destroy();
                                local l_v19_3 = v19;
                                local v35 = l_Instances_0.ActionFrame:Clone();
                                v35.ContentFrame.ActionLabel.Text = v15.buttonText;
                                v35.LayoutOrder = v19.priority;
                                v35.Parent = l_ActionGui_0.RightListFrame;
                                l_v19_3.frame = v35;
                            end;
                        else
                            v19.frame:Destroy();
                            local l_v19_4 = v19;
                            local v37 = l_Instances_0.ActionFrame:Clone();
                            v37.ContentFrame.ActionLabel.Text = v15.buttonText;
                            v37.LayoutOrder = v19.priority;
                            v37.Parent = l_ActionGui_0.RightListFrame;
                            l_v19_4.frame = v37;
                        end;
                    else
                        local l_v19_5 = v19;
                        local v39 = l_Instances_0.ActionFrame:Clone();
                        v39.ContentFrame.ActionLabel.Text = v15.buttonText;
                        v39.LayoutOrder = v19.priority;
                        v39.Parent = l_ActionGui_0.RightListFrame;
                        l_v19_5.frame = v39;
                    end;
                    v19.frame.ContentFrame.ActionLabel.BackgroundColor3 = Color3.new(0, 0, 0);
                    v19.frame.ContentFrame.ActionLabel.TextColor3 = Color3.new(1, 1, 1);
                    v23.BackgroundColor3 = Color3.new(0, 0, 0);
                end;
            end;
            return v14(...);
        end;
        v10._updateInputDisplay(v19, v5.getLastInputCategory());
        table.insert(v19.connections, v23.InputBegan:Connect(function(v40) --[[ Line: 173 ]]
            -- upvalues: v22 (copy), v13 (copy)
            if v40.UserInputType == Enum.UserInputType.Touch and v40.UserInputState ~= Enum.UserInputState.Change then
                v22(v13, Enum.UserInputState.Begin, v40);
            end;
        end));
        table.insert(v19.connections, v23.InputEnded:Connect(function(v41) --[[ Line: 182 ]]
            -- upvalues: v22 (copy), v13 (copy)
            if v41.UserInputType == Enum.UserInputType.Touch then
                v22(v13, Enum.UserInputState.End, v41);
            end;
        end));
        l_ContextActionService_0:BindActionAtPriority(v19.actionName, v22, false, v19.priority, v19.keyboardAndMouseInput, v19.gamepadInput);
        v10._registeredActions[v13] = v19;
        return;
    end;
end;
v10.unbindAction = function(v42) --[[ Line: 201 ]] --[[ Name: unbindAction ]]
    -- upvalues: v10 (copy), l_ContextActionService_0 (copy)
    local v43 = v10._registeredActions[v42];
    if v43 then
        for _, v45 in v43.connections do
            v45:Disconnect();
        end;
        v43.frame:Destroy();
        v43.button:Destroy();
        v10._registeredActions[v42] = nil;
    end;
    l_ContextActionService_0:UnbindAction(v42);
end;
v10.setButtonText = function(v46, v47) --[[ Line: 220 ]] --[[ Name: setButtonText ]]
    -- upvalues: v10 (copy)
    local v48;
    if not v10._registeredActions[v46] then
        warn((("Action %* is not a registered action!"):format(v46)));
        v48 = false;
    else
        v48 = true;
    end;
    if not v48 then
        return;
    else
        v48 = v10._registeredActions[v46];
        v48.actionContext.buttonText = v47 or "";
        v48.frame.ContentFrame.ActionLabel.Text = v48.actionContext.buttonText;
        v48.button.ActionText.Text = v48.actionContext.buttonText;
        return;
    end;
end;
v10._updateInputDisplay = function(v49, v50) --[[ Line: 236 ]] --[[ Name: _updateInputDisplay ]]
    -- upvalues: v5 (copy), v10 (copy)
    local l_ButtonDisplayFrame_0 = v49.frame.ContentFrame.InputFrame:FindFirstChild("ButtonDisplayFrame");
    if l_ButtonDisplayFrame_0 then
        l_ButtonDisplayFrame_0:Destroy();
    end;
    local v52 = nil;
    if v50 == v5.InputCategory.KeyboardAndMouse then
        v52 = v10._getButtonDisplayForInput(v49.keyboardAndMouseInput);
    elseif v50 == v5.InputCategory.Gamepad then
        v52 = v10._getButtonDisplayForInput(v49.gamepadInput);
    elseif v50 == v5.InputCategory.Touch then
        v52 = v10._getButtonDisplayForInput(Enum.UserInputType.Touch);
    end;
    v52.Parent = v49.frame.ContentFrame.InputFrame;
    v49.button.Visible = v50 == v5.InputCategory.Touch;
end;
v10._getButtonDisplayForInput = function(v53) --[[ Line: 259 ]] --[[ Name: _getButtonDisplayForInput ]]
    -- upvalues: l_Instances_0 (copy), l_UserInputService_0 (copy), v6 (copy)
    local v54 = l_Instances_0.ButtonDisplayFrame:Clone();
    local v55 = nil;
    if v53.EnumType == Enum.KeyCode then
        v55 = l_UserInputService_0:GetImageForKeyCode(v53);
    end;
    if v53 == Enum.UserInputType.Touch then
        l_Instances_0.TouchImageLabel:Clone().Parent = v54;
        return v54;
    elseif v55 and v55 ~= "" then
        local v56 = l_Instances_0.GamepadImageLabel:Clone();
        v56.Image = v55;
        v56.Parent = v54;
        return v54;
    elseif v6.MouseButtonImage[v53] then
        local v57 = l_Instances_0.MouseImageLabel:Clone();
        v57.Image = v6.MouseButtonImage[v53];
        v57.Parent = v54;
        return v54;
    else
        l_Instances_0.KeyboardBorderImage:Clone().Parent = v54;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v53);
        local v59 = v6.KeyboardButtonImage[v53] or v6.KeyboardButtonIconMapping[l_l_UserInputService_0_StringForKeyCode_0];
        if not v59 then
            local v60 = v6.KeyCodeToTextMapping[v53];
            if v60 then
                l_l_UserInputService_0_StringForKeyCode_0 = v60;
            end;
        end;
        if v59 then
            local v61 = l_Instances_0.KeyboardImageLabel:Clone();
            v61.Image = v59;
            v61.Parent = v54;
            return v54;
        else
            if l_l_UserInputService_0_StringForKeyCode_0 and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
                local v62 = l_Instances_0.KeyboardTextLabel:Clone();
                v62.Text = l_l_UserInputService_0_StringForKeyCode_0;
                v62.TextSize = v6.KeyCodeToFontSize[v53] or v6.DefaultFontSize;
                v62.Parent = v54;
            end;
            return v54;
        end;
    end;
end;
v10._updateUIPositionAndScale = function() --[[ Line: 315 ]] --[[ Name: _updateUIPositionAndScale ]]
    -- upvalues: l_PlayerGui_0 (copy), l_ActionGui_0 (copy), v5 (copy)
    local v63 = l_PlayerGui_0:FindFirstChild("TouchGui") ~= nil;
    local v64 = math.min(l_ActionGui_0.AbsoluteSize.X, l_ActionGui_0.AbsoluteSize.Y) < 500;
    if v63 and v5.getLastInputCategory() == v5.InputCategory.Touch then
        l_ActionGui_0.RightListFrame.Visible = false;
    else
        l_ActionGui_0.RightListFrame.Visible = true;
    end;
    l_ActionGui_0.RightListFrame.UIScale.Scale = v64 and 0.85 or 1;
    l_ActionGui_0.RightListFrame.Position = UDim2.new(1, -40, 1, -40);
end;
v10._initialize = function() --[[ Line: 334 ]] --[[ Name: _initialize ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy), l_PlayerGui_0 (copy), v5 (copy), l_ActionGui_0 (copy)
    assert(not v10._initialized, "ActionController already initialized!");
    assert(l_RunService_0:IsClient(), "ActionController can only be used on the client!");
    l_PlayerGui_0.ChildAdded:Connect(function(v65) --[[ Line: 339 ]]
        -- upvalues: v10 (ref)
        if v65.Name == "TouchGui" then
            v10._updateUIPositionAndScale();
        end;
    end);
    l_PlayerGui_0.ChildRemoved:Connect(function(v66) --[[ Line: 345 ]]
        -- upvalues: v10 (ref)
        if v66.Name == "TouchGui" then
            v10._updateUIPositionAndScale();
        end;
    end);
    v5.lastInputCategoryChanged:Connect(function(v67) --[[ Line: 352 ]]
        -- upvalues: v10 (ref)
        for _, v69 in v10._registeredActions do
            v10._updateInputDisplay(v69, v67);
        end;
    end);
    l_ActionGui_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v10._updateUIPositionAndScale);
    v5.lastInputCategoryChanged:Connect(v10._updateUIPositionAndScale);
    l_ActionGui_0.Parent = l_PlayerGui_0;
    v10._initialized = true;
end;
v10._initialize();
return v10;