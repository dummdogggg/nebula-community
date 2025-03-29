--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchJump
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v4 = l_FlagUtil_0.getUserFlag("UserUpdateTouchJump3");
local v5 = l_FlagUtil_0.getUserFlag("UserControlModuleEnableIdempotent");
local v6 = nil;
local v7 = nil;
if v4 then
    v6 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
    v7 = require(l_CommonUtils_0:WaitForChild("CharacterUtil"));
end;
local v8 = {
    HUMANOID_STATE_ENABLED_CHANGED = "HUMANOID_STATE_ENABLED_CHANGED", 
    HUMANOID_JUMP_POWER = "HUMANOID_JUMP_POWER", 
    HUMANOID = "HUMANOID", 
    JUMP_INPUT_ENDED = "JUMP_INPUT_ENDED", 
    MENU_OPENED = "MENU_OPENED"
};
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v10 = setmetatable({}, l_BaseCharacterController_0);
v10.__index = v10;
v10.new = function() --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v10 (copy), v4 (copy), v6 (ref)
    local v11 = setmetatable(l_BaseCharacterController_0.new(), v10);
    v11.parentUIFrame = nil;
    v11.jumpButton = nil;
    if not v4 then
        v11.characterAddedConn = nil;
        v11.humanoidStateEnabledChangedConn = nil;
        v11.humanoidJumpPowerConn = nil;
        v11.humanoidParentConn = nil;
        v11.jumpPower = 0;
        v11.jumpStateEnabled = true;
        v11.humanoid = nil;
    end;
    v11.externallyEnabled = false;
    v11.isJumping = false;
    if v4 then
        v11._active = false;
        v11._connectionUtil = v6.new();
    end;
    return v11;
end;
if v4 then
    v10._reset = function(v12) --[[ Line: 84 ]] --[[ Name: _reset ]]
        v12.isJumping = false;
        v12.touchObject = nil;
        if v12.jumpButton then
            v12.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        end;
    end;
end;
v10.EnableButton = function(v13, v14) --[[ Line: 95 ]] --[[ Name: EnableButton ]]
    -- upvalues: v4 (copy), v8 (copy), l_GuiService_0 (copy), l_Players_0 (copy)
    if v4 then
        if v14 == v13._active then
            v13:_reset();
            return;
        else
            if v14 then
                if not v13.jumpButton then
                    v13:Create();
                end;
                v13.jumpButton.Visible = true;
                v13._connectionUtil:trackConnection(v8.JUMP_INPUT_ENDED, v13.jumpButton.InputEnded:Connect(function(v15) --[[ Line: 112 ]]
                    -- upvalues: v13 (copy)
                    if v15 == v13.touchObject then
                        v13:_reset();
                    end;
                end));
                v13._connectionUtil:trackConnection(v8.MENU_OPENED, l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 122 ]]
                    -- upvalues: v13 (copy)
                    if v13.touchObject then
                        v13:_reset();
                    end;
                end));
            else
                if v13.jumpButton then
                    v13.jumpButton.Visible = false;
                end;
                v13._connectionUtil:disconnect(v8.JUMP_INPUT_ENDED);
                v13._connectionUtil:disconnect(v8.MENU_OPENED);
            end;
            v13:_reset();
            v13._active = v14;
            return;
        end;
    else
        if v14 then
            if not v13.jumpButton then
                v13:Create();
            end;
            local v16 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
            if v16 and v13.externallyEnabled and v13.externallyEnabled and v16.JumpPower > 0 then
                v13.jumpButton.Visible = true;
                return;
            end;
        else
            v13.jumpButton.Visible = false;
            v13.touchObject = nil;
            v13.isJumping = false;
            v13.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        end;
        return;
    end;
end;
v10.UpdateEnabled = function(v17) --[[ Line: 159 ]] --[[ Name: UpdateEnabled ]]
    -- upvalues: v4 (copy), v7 (ref)
    if v4 then
        local v18 = v7.getChild("Humanoid", "Humanoid");
        if v18 and v17.externallyEnabled and v18.JumpPower > 0 and v18:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
            v17:EnableButton(true);
            return;
        else
            v17:EnableButton(false);
            return;
        end;
    elseif v17.jumpPower > 0 and v17.jumpStateEnabled then
        v17:EnableButton(true);
        return;
    else
        v17:EnableButton(false);
        return;
    end;
end;
if v4 then
    v10._setupConfigurations = function(v19) --[[ Line: 177 ]] --[[ Name: _setupConfigurations ]]
        -- upvalues: v7 (ref), v8 (copy)
        local function v20() --[[ Line: 178 ]] --[[ Name: update ]]
            -- upvalues: v19 (copy)
            v19:UpdateEnabled();
        end;
        local v24 = v7.onChild("Humanoid", "Humanoid", function(v21) --[[ Line: 183 ]]
            -- upvalues: v19 (copy), v8 (ref), v20 (copy)
            v19:UpdateEnabled();
            v19._connectionUtil:trackConnection(v8.HUMANOID_JUMP_POWER, v21:GetPropertyChangedSignal("JumpPower"):Connect(v20));
            v19._connectionUtil:trackConnection(v8.HUMANOID_STATE_ENABLED_CHANGED, v21.StateEnabledChanged:Connect(function(v22, v23) --[[ Line: 191 ]]
                -- upvalues: v19 (ref)
                if v22 == Enum.HumanoidStateType.Jumping and v23 ~= v19._active then
                    v19:UpdateEnabled();
                end;
            end));
        end);
        v19._connectionUtil:trackConnection(v8.HUMANOID, v24);
    end;
end;
if not v4 then
    v10.HumanoidChanged = function(v25, v26) --[[ Line: 205 ]] --[[ Name: HumanoidChanged ]]
        -- upvalues: l_Players_0 (copy)
        local v27 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
        if v27 then
            if v26 == "JumpPower" then
                v25.jumpPower = v27.JumpPower;
                v25:UpdateEnabled();
                return;
            elseif v26 == "Parent" and not v27.Parent then
                v25.humanoidChangeConn:Disconnect();
            end;
        end;
    end;
    v10.HumanoidStateEnabledChanged = function(v28, v29, v30) --[[ Line: 220 ]] --[[ Name: HumanoidStateEnabledChanged ]]
        if v29 == Enum.HumanoidStateType.Jumping then
            v28.jumpStateEnabled = v30;
            v28:UpdateEnabled();
        end;
    end;
    v10.CharacterAdded = function(v31, v32) --[[ Line: 227 ]] --[[ Name: CharacterAdded ]]
        if v31.humanoidChangeConn then
            v31.humanoidChangeConn:Disconnect();
            v31.humanoidChangeConn = nil;
        end;
        v31.humanoid = v32:FindFirstChildOfClass("Humanoid");
        while not v31.humanoid do
            v32.ChildAdded:wait();
            v31.humanoid = v32:FindFirstChildOfClass("Humanoid");
        end;
        v31.humanoidJumpPowerConn = v31.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() --[[ Line: 239 ]]
            -- upvalues: v31 (copy)
            v31.jumpPower = v31.humanoid.JumpPower;
            v31:UpdateEnabled();
        end);
        v31.humanoidParentConn = v31.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 244 ]]
            -- upvalues: v31 (copy)
            if not v31.humanoid.Parent then
                v31.humanoidJumpPowerConn:Disconnect();
                v31.humanoidJumpPowerConn = nil;
                v31.humanoidParentConn:Disconnect();
                v31.humanoidParentConn = nil;
            end;
        end);
        v31.humanoidStateEnabledChangedConn = v31.humanoid.StateEnabledChanged:Connect(function(v33, v34) --[[ Line: 253 ]]
            -- upvalues: v31 (copy)
            v31:HumanoidStateEnabledChanged(v33, v34);
        end);
        v31.jumpPower = v31.humanoid.JumpPower;
        v31.jumpStateEnabled = v31.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping);
        v31:UpdateEnabled();
    end;
    v10.SetupCharacterAddedFunction = function(v35) --[[ Line: 262 ]] --[[ Name: SetupCharacterAddedFunction ]]
        -- upvalues: l_Players_0 (copy)
        v35.characterAddedConn = l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v36) --[[ Line: 263 ]]
            -- upvalues: v35 (copy)
            v35:CharacterAdded(v36);
        end);
        if l_Players_0.LocalPlayer.Character then
            v35:CharacterAdded(l_Players_0.LocalPlayer.Character);
        end;
    end;
end;
v10.Enable = function(v37, v38, v39) --[[ Line: 272 ]] --[[ Name: Enable ]]
    -- upvalues: v5 (copy), v4 (copy)
    if v39 then
        v37.parentUIFrame = v39;
    end;
    if v5 and v37.externallyEnabled == v38 then
        return;
    else
        v37.externallyEnabled = v38;
        if v4 then
            v37:UpdateEnabled();
            if v38 then
                v37:_setupConfigurations();
                return;
            else
                v37._connectionUtil:disconnectAll();
                return;
            end;
        else
            v37:EnableButton(v38);
            return;
        end;
    end;
end;
v10.Create = function(v40) --[[ Line: 293 ]] --[[ Name: Create ]]
    -- upvalues: v4 (copy), l_GuiService_0 (copy)
    if not v40.parentUIFrame then
        return;
    else
        if v40.jumpButton then
            v40.jumpButton:Destroy();
            v40.jumpButton = nil;
        end;
        if v40.absoluteSizeChangedConn then
            v40.absoluteSizeChangedConn:Disconnect();
            v40.absoluteSizeChangedConn = nil;
        end;
        v40.jumpButton = Instance.new("ImageButton");
        v40.jumpButton.Name = "JumpButton";
        v40.jumpButton.Visible = false;
        v40.jumpButton.BackgroundTransparency = 1;
        v40.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
        v40.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        v40.jumpButton.ImageRectSize = Vector2.new(144, 144);
        local function v43() --[[ Line: 316 ]] --[[ Name: ResizeJumpButton ]]
            -- upvalues: v40 (copy)
            local v41 = math.min(v40.parentUIFrame.AbsoluteSize.x, v40.parentUIFrame.AbsoluteSize.y) <= 500;
            local v42 = v41 and 70 or 120;
            v40.jumpButton.Size = UDim2.new(0, v42, 0, v42);
            v40.jumpButton.Position = v41 and UDim2.new(1, -(v42 * 1.5 - 10), 1, -v42 - 20) or UDim2.new(1, -(v42 * 1.5 - 10), 1, -v42 * 1.75);
        end;
        v43();
        v40.absoluteSizeChangedConn = v40.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(v43);
        v40.touchObject = nil;
        v40.jumpButton.InputBegan:connect(function(v44) --[[ Line: 330 ]]
            -- upvalues: v40 (copy)
            if v40.touchObject or v44.UserInputType ~= Enum.UserInputType.Touch or v44.UserInputState ~= Enum.UserInputState.Begin then
                return;
            else
                v40.touchObject = v44;
                v40.jumpButton.ImageRectOffset = Vector2.new(146, 146);
                v40.isJumping = true;
                return;
            end;
        end);
        if not v4 then
            local function _() --[[ Line: 344 ]]
                -- upvalues: v40 (copy)
                v40.touchObject = nil;
                v40.isJumping = false;
                v40.jumpButton.ImageRectOffset = Vector2.new(1, 146);
            end;
            v40.jumpButton.InputEnded:connect(function(v46) --[[ Line: 350 ]]
                -- upvalues: v40 (copy)
                if v46 == v40.touchObject then
                    v40.touchObject = nil;
                    v40.isJumping = false;
                    v40.jumpButton.ImageRectOffset = Vector2.new(1, 146);
                end;
            end);
            l_GuiService_0.MenuOpened:connect(function() --[[ Line: 356 ]]
                -- upvalues: v40 (copy)
                if v40.touchObject then
                    v40.touchObject = nil;
                    v40.isJumping = false;
                    v40.jumpButton.ImageRectOffset = Vector2.new(1, 146);
                end;
            end);
            if not v40.characterAddedConn then
                v40:SetupCharacterAddedFunction();
            end;
        end;
        v40.jumpButton.Parent = v40.parentUIFrame;
        return;
    end;
end;
return v10;