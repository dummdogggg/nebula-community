--[[
    Script: ReplicatedStorage.Packages.Satchel
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local v9 = {
    OpenClose = nil, 
    IsOpen = false, 
    StateChanged = Instance.new("BindableEvent"), 
    ModuleName = "Backpack", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    BackpackEmpty = Instance.new("BindableEvent")
};
v9.BackpackEmpty.Name = "BackpackEmpty";
v9.BackpackItemAdded = Instance.new("BindableEvent");
v9.BackpackItemAdded.Name = "BackpackAdded";
v9.BackpackItemRemoved = Instance.new("BindableEvent");
v9.BackpackItemRemoved.Name = "BackpackRemoved";
local l_script_0 = script;
local v11 = l_GuiService_0.PreferredTransparency or 1;
local v12 = not l_script_0:GetAttribute("OutlineEquipBorder") or false;
local l_l_script_0_Attribute_0 = l_script_0:GetAttribute("InsetIconPadding");
local v14 = l_script_0:GetAttribute("BackgroundTransparency") or 0.3;
local v15 = v14 * v11;
local v16 = l_script_0:GetAttribute("CornerRadius") or UDim.new(0, 8);
local v17 = l_script_0:GetAttribute("BackgroundColor3") or Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843);
local v18 = l_script_0:GetAttribute("EquipBorderColor3") or Color3.new(0, 0.6352941176470588, 1);
local v19 = l_script_0:GetAttribute("BackgroundTransparency") or 0.3;
local v20 = v19 * v11;
local v21 = l_script_0:GetAttribute("EquipBorderSizePixel") or 5;
local v22 = l_script_0:GetAttribute("CornerRadius") or UDim.new(0, 8);
local v23 = Color3.new(1, 1, 1);
local v24 = v22 - UDim.new(0, 5) or UDim.new(0, 3);
local v25 = l_script_0:GetAttribute("BackgroundColor3") or Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843);
local v26 = l_script_0:GetAttribute("TextColor3") or Color3.new(1, 1, 1);
local v27 = l_script_0:GetAttribute("TextStrokeTransparency") or 0.5;
local v28 = l_script_0:GetAttribute("TextStrokeColor3") or Color3.new(0, 0, 0);
local v29 = Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843);
local v30 = v11 * 0.2;
local v31 = Color3.new(1, 1, 1);
local v32 = v22 - UDim.new(0, 5) or UDim.new(0, 3);
local v33 = l_script_0:GetAttribute("FontFace") or Font.new("rbxasset://fonts/families/BuilderSans.json");
local v34 = l_script_0:GetAttribute("TextSize") or 16;
local l_Value_0 = Enum.KeyCode.Backspace.Value;
local l_Value_1 = Enum.KeyCode.Zero.Value;
local v37 = 60;
local v38 = {
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.MouseButton2] = true, 
    [Enum.UserInputType.MouseButton3] = true, 
    [Enum.UserInputType.MouseMovement] = true, 
    [Enum.UserInputType.MouseWheel] = true
};
local v39 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v40 = true;
local v41 = require(script.Packages:WaitForChild("topbarplus")).new():setName("Inventory"):setImage("rbxasset://textures/ui/TopBar/inventoryOn.png", "Selected"):setImage("rbxasset://textures/ui/TopBar/inventoryOff.png", "Deselected"):setImageScale(1):setCaption("Inventory"):bindToggleKey(Enum.KeyCode.Backquote):autoDeselect(false):setOrder(-1);
v41.toggled:Connect(function() --[[ Line: 170 ]]
    -- upvalues: l_GuiService_0 (copy), v9 (copy)
    if not l_GuiService_0.MenuIsOpen then
        v9.OpenClose();
    end;
end);
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.DisplayOrder = 120;
l_ScreenGui_0.IgnoreGuiInset = true;
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.Name = "BackpackGui";
l_ScreenGui_0.Parent = l_PlayerGui_0;
local v43 = l_GuiService_0:IsTenFootInterface();
if v43 then
    v37 = 100;
    v34 = 24;
end;
local v44 = false;
local v45 = l_UserInputService_0.TouchEnabled and workspace.CurrentCamera.ViewportSize.X < 1024;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local l_Humanoid_0 = v57:WaitForChild("Humanoid");
local l_Backpack_0 = l_LocalPlayer_0:WaitForChild("Backpack");
local v60 = {};
local v61 = nil;
local v62 = {};
local v63 = {};
local v64 = {};
local v65 = 0;
local v66 = nil;
local v67 = false;
local v68 = false;
local v69 = false;
local v70 = false;
local v71 = {};
local v72 = false;
local l_VREnabled_0 = l_VRService_0.VREnabled;
local v74 = l_VREnabled_0 and 6 or v45 and 6 or 10;
local v75 = l_VREnabled_0 and 3 or v45 and 2 or 4;
local v76 = nil;
local function _(v77) --[[ Line: 233 ]] --[[ Name: EvaluateBackpackPanelVisibility ]]
    -- upvalues: v41 (copy), v40 (ref), l_VRService_0 (copy)
    return v77 and v41.enabled and v40 and l_VRService_0.VREnabled;
end;
local function _() --[[ Line: 237 ]] --[[ Name: ShowVRBackpackPopup ]]

end;
local function _() --[[ Line: 243 ]] --[[ Name: FindLowestEmpty ]]
    -- upvalues: v74 (copy), v60 (copy)
    for v80 = 1, v74 do
        local v81 = v60[v80];
        if not v81.Tool then
            return v81;
        end;
    end;
    return nil;
end;
v9.IsInventoryEmpty = function() --[[ Line: 253 ]] --[[ Name: isInventoryEmpty ]]
    -- upvalues: v74 (copy), v60 (copy)
    for v83 = v74 + 1, #v60 do
        local v84 = v60[v83];
        if v84 and v84.Tool then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 265 ]] --[[ Name: UseGazeSelection ]]
    return false;
end;
local function v91() --[[ Line: 269 ]] --[[ Name: AdjustHotbarFrames ]]
    -- upvalues: v49 (ref), v74 (copy), v65 (ref), v60 (copy)
    local l_Visible_0 = v49.Visible;
    local v87 = l_Visible_0 and v74 or v65;
    local v88 = 0;
    for v89 = 1, v74 do
        local v90 = v60[v89];
        if v90.Tool or l_Visible_0 then
            v88 = v88 + 1;
            v90:Readjust(v88, v87);
            v90.Frame.Visible = true;
        else
            v90.Frame.Visible = false;
        end;
    end;
end;
local function v94() --[[ Line: 286 ]] --[[ Name: UpdateScrollingFrameCanvasSize ]]
    -- upvalues: v51 (ref), v37 (ref), v52 (ref)
    local v92 = math.floor(v51.AbsoluteSize.X / (v37 + 5));
    local v93 = math.ceil((#v52:GetChildren() - 1) / v92) * (v37 + 5) + 5;
    v51.CanvasSize = UDim2.new(0, 0, 0, v93);
end;
local function v97() --[[ Line: 293 ]] --[[ Name: AdjustInventoryFrames ]]
    -- upvalues: v74 (copy), v60 (copy), v94 (copy)
    for v95 = v74 + 1, #v60 do
        local v96 = v60[v95];
        v96.Frame.LayoutOrder = v96.Index;
        v96.Frame.Visible = v96.Tool ~= nil;
    end;
    v94();
end;
local function v98() --[[ Line: 302 ]] --[[ Name: UpdateBackpackLayout ]]
    -- upvalues: v48 (ref), v74 (copy), v37 (ref), v49 (ref), v75 (copy), l_VREnabled_0 (copy), v51 (ref), v91 (copy), v97 (copy)
    v48.Size = UDim2.new(0, v74 * (v37 + 5) + 5, 0, v37 + 5 + 5);
    v48.Position = UDim2.new(0.5, -v48.Size.X.Offset / 2, 1, -v48.Size.Y.Offset);
    v49.Size = UDim2.new(0, v48.Size.X.Offset, 0, v48.Size.Y.Offset * v75 + 40 + (l_VREnabled_0 and 80 or 0));
    v49.Position = UDim2.new(0.5, -v49.Size.X.Offset / 2, 1, v48.Position.Y.Offset - v49.Size.Y.Offset);
    v51.Size = UDim2.new(1, v51.ScrollBarThickness + 1, 1, -40 - (l_VREnabled_0 and 80 or 0));
    v51.Position = UDim2.new(0, 0, 0, 40 + (l_VREnabled_0 and 40 or 0));
    v91();
    v97();
end;
local function _(v99, v100, v101) --[[ Line: 336 ]] --[[ Name: Clamp ]]
    return (math.min(v100, (math.max(v99, v101))));
end;
local function _(v103, v104, v105) --[[ Line: 340 ]] --[[ Name: CheckBounds ]]
    local l_AbsolutePosition_0 = v103.AbsolutePosition;
    local l_AbsoluteSize_0 = v103.AbsoluteSize;
    local v108 = false;
    if l_AbsolutePosition_0.X < v104 then
        v108 = false;
        if v104 <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
            v108 = false;
            if l_AbsolutePosition_0.Y < v105 then
                v108 = v105 <= l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
            end;
        end;
    end;
    return v108;
end;
local function _(v110, v111) --[[ Line: 346 ]] --[[ Name: GetOffset ]]
    return (v110.AbsolutePosition + v110.AbsoluteSize / 2 - v111).Magnitude;
end;
local function _() --[[ Line: 351 ]] --[[ Name: DisableActiveHopper ]]
    -- upvalues: v66 (ref), v62 (copy)
    v66:ToggleSelect();
    v62[v66]:UpdateEquipView();
    v66 = nil;
end;
local function _() --[[ Line: 357 ]] --[[ Name: UnequipAllTools ]]
    -- upvalues: l_Humanoid_0 (ref), v66 (ref), v62 (copy)
    if l_Humanoid_0 then
        l_Humanoid_0:UnequipTools();
        if v66 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
    end;
end;
local function _(v115) --[[ Line: 366 ]] --[[ Name: EquipNewTool ]]
    -- upvalues: l_Humanoid_0 (ref), v66 (ref), v62 (copy)
    if l_Humanoid_0 then
        l_Humanoid_0:UnequipTools();
        if v66 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
    end;
    l_Humanoid_0:EquipTool(v115);
end;
local function _(v117) --[[ Line: 372 ]] --[[ Name: IsEquipped ]]
    -- upvalues: v57 (ref)
    return v117 and v117.Parent == v57;
end;
local function v119(v120, v121) --[[ Line: 377 ]] --[[ Name: MakeSlot ]]
    -- upvalues: v60 (copy), v20 (ref), v48 (ref), v37 (ref), v74 (copy), v49 (ref), l_UserInputService_0 (copy), v65 (ref), v68 (ref), v44 (ref), l_ContextActionService_0 (copy), v56 (ref), v62 (copy), v61 (ref), v57 (ref), v76 (ref), v21 (copy), v18 (copy), v12 (copy), v94 (copy), l_Humanoid_0 (ref), v66 (ref), l_Backpack_0 (ref), v17 (copy), v23 (copy), v22 (copy), l_l_script_0_Attribute_0 (copy), v26 (copy), v27 (copy), v28 (copy), v33 (copy), v34 (ref), v25 (copy), v24 (copy), v119 (copy), v52 (ref), v70 (ref), v63 (copy), l_Value_1 (copy), v64 (copy), v41 (copy), v51 (ref)
    local v122 = v121 or #v60 + 1;
    local v123 = {
        Tool = nil, 
        Index = v122, 
        Frame = nil
    };
    local v124 = nil;
    local v125 = nil;
    local v126 = nil;
    local v127 = nil;
    local v128 = nil;
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local function _() --[[ Line: 402 ]] --[[ Name: UpdateSlotFading ]]
        -- upvalues: v124 (ref), v20 (ref)
        v124.SelectionImageObject = nil;
        v124.BackgroundTransparency = v124.Draggable and 0 or v20;
    end;
    v123.Readjust = function(_, v135, v136) --[[ Line: 408 ]] --[[ Name: Readjust ]]
        -- upvalues: v48 (ref), v37 (ref), v124 (ref)
        local v137 = v48.Size.X.Offset / 2;
        local v138 = v37 + 5;
        local v139 = v135 - (v136 / 2 + 0.5);
        v124.Position = UDim2.new(0, v137 - v37 / 2 + v138 * v139, 0, 5);
    end;
    v123.Fill = function(v140, v141) --[[ Line: 418 ]] --[[ Name: Fill ]]
        -- upvalues: v126 (ref), v127 (ref), v131 (ref), v128 (ref), v74 (ref), v49 (ref), l_UserInputService_0 (ref), v124 (ref), v65 (ref), v68 (ref), v44 (ref), l_ContextActionService_0 (ref), v56 (ref), v62 (ref), v61 (ref), v60 (ref)
        local v142 = false;
        if not v141 then
            return v140:Clear();
        else
            v140.Tool = v141;
            local function v144() --[[ Line: 427 ]] --[[ Name: assignToolData ]]
                -- upvalues: v141 (copy), v126 (ref), v127 (ref), v131 (ref)
                local l_TextureId_0 = v141.TextureId;
                v126.Image = l_TextureId_0;
                if l_TextureId_0 ~= "" then
                    v127.Visible = false;
                else
                    v127.Visible = true;
                end;
                v127.Text = v141.Name;
                if v131 and v141:IsA("Tool") then
                    v131.Text = v141.ToolTip;
                    v131.Size = UDim2.new(0, 0, 0, 16);
                    v131.Position = UDim2.new(0.5, 0, 0, -5);
                end;
            end;
            v144();
            if v128 then
                v128:Disconnect();
                v128 = nil;
            end;
            v128 = v141.Changed:Connect(function(v145) --[[ Line: 456 ]]
                -- upvalues: v144 (copy)
                if v145 == "TextureId" or v145 == "Name" or v145 == "ToolTip" then
                    v144();
                end;
            end);
            local v146 = v140.Index <= v74;
            local l_Visible_1 = v49.Visible;
            if (not v146 or l_Visible_1) and not l_UserInputService_0.VREnabled then
                v124.Draggable = true;
            end;
            v140:UpdateEquipView();
            if v146 then
                v65 = v65 + 1;
                if v68 and v65 >= 1 and not v44 then
                    v44 = true;
                    l_ContextActionService_0:BindAction("BackpackHotbarEquip", v56, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                end;
            end;
            v62[v141] = v140;
            local v148;
            for v149 = 1, v74 do
                local v150 = v60[v149];
                if not v150.Tool then
                    v148 = v150;
                    v142 = true;
                end;
                if v142 then
                    break;
                end;
            end;
            if not v142 then
                v148 = nil;
            end;
            v142 = false;
            v61 = v148;
            return;
        end;
    end;
    v123.Clear = function(v151) --[[ Line: 492 ]] --[[ Name: Clear ]]
        -- upvalues: v128 (ref), v126 (ref), v127 (ref), v131 (ref), v124 (ref), v74 (ref), v65 (ref), v44 (ref), l_ContextActionService_0 (ref), v62 (ref), v61 (ref), v60 (ref)
        local v152 = false;
        if not v151.Tool then
            return;
        else
            if v128 then
                v128:Disconnect();
                v128 = nil;
            end;
            v126.Image = "";
            v127.Text = "";
            if v131 then
                v131.Text = "";
                v131.Visible = false;
            end;
            v124.Draggable = false;
            v151:UpdateEquipView(true);
            if v151.Index <= v74 then
                v65 = v65 - 1;
                if v65 < 1 then
                    v44 = false;
                    l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
                end;
            end;
            v62[v151.Tool] = nil;
            v151.Tool = nil;
            local v153;
            for v154 = 1, v74 do
                local v155 = v60[v154];
                if not v155.Tool then
                    v153 = v155;
                    v152 = true;
                end;
                if v152 then
                    break;
                end;
            end;
            if not v152 then
                v153 = nil;
            end;
            v152 = false;
            v61 = v153;
            return;
        end;
    end;
    v123.UpdateEquipView = function(v156, v157) --[[ Line: 527 ]] --[[ Name: UpdateEquipView ]]
        -- upvalues: v57 (ref), v76 (ref), v123 (copy), v129 (ref), v21 (ref), v18 (ref), v12 (ref), v126 (ref), v124 (ref), v20 (ref)
        local v158 = false;
        if not (v157 or false) then
            local l_Tool_0 = v156.Tool;
            if l_Tool_0 and l_Tool_0.Parent == v57 then
                v76 = v123;
                if not v129 then
                    v129 = Instance.new("UIStroke");
                    v129.Name = "Border";
                    v129.Thickness = v21;
                    v129.Color = v18;
                    v129.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
                end;
                if v12 == true then
                    v129.Parent = v126;
                    v158 = true;
                else
                    v129.Parent = v124;
                    v158 = true;
                end;
            end;
        end;
        if not v158 then
            if not v158 then
                if v129 then
                    v129.Parent = nil;
                end;
            end;
        end;
        v158 = false;
        v124.SelectionImageObject = nil;
        v124.BackgroundTransparency = v124.Draggable and 0 or v20;
    end;
    v123.IsEquipped = function(v160) --[[ Line: 551 ]] --[[ Name: IsEquipped ]]
        -- upvalues: v57 (ref)
        local l_Tool_1 = v160.Tool;
        return l_Tool_1 and l_Tool_1.Parent == v57;
    end;
    v123.Delete = function(v162) --[[ Line: 555 ]] --[[ Name: Delete ]]
        -- upvalues: v124 (ref), v60 (ref), v94 (ref)
        v124:Destroy();
        table.remove(v60, v162.Index);
        local v163 = #v60;
        for v164 = v162.Index, v163 do
            v60[v164]:SlideBack();
        end;
        v94();
    end;
    v123.Swap = function(v165, v166) --[[ Line: 568 ]] --[[ Name: Swap ]]
        local l_Tool_2 = v165.Tool;
        local l_Tool_3 = v166.Tool;
        v165:Clear();
        if l_Tool_3 then
            v166:Clear();
            v165:Fill(l_Tool_3);
        end;
        if l_Tool_2 then
            v166:Fill(l_Tool_2);
            return;
        else
            v166:Clear();
            return;
        end;
    end;
    v123.SlideBack = function(v169) --[[ Line: 582 ]] --[[ Name: SlideBack ]]
        -- upvalues: v124 (ref)
        v169.Index = v169.Index - 1;
        v124.Name = v169.Index;
        v124.LayoutOrder = v169.Index;
    end;
    v123.TurnNumber = function(_, v171) --[[ Line: 588 ]] --[[ Name: TurnNumber ]]
        -- upvalues: v132 (ref)
        if v132 then
            v132.Visible = v171;
        end;
    end;
    v123.SetClickability = function(v172, v173) --[[ Line: 594 ]] --[[ Name: SetClickability ]]
        -- upvalues: l_UserInputService_0 (ref), v124 (ref), v20 (ref)
        if v172.Tool then
            if l_UserInputService_0.VREnabled then
                v124.Draggable = false;
            else
                v124.Draggable = not v173;
            end;
            v124.SelectionImageObject = nil;
            v124.BackgroundTransparency = v124.Draggable and 0 or v20;
        end;
    end;
    v123.CheckTerms = function(v174, v175) --[[ Line: 605 ]] --[[ Name: CheckTerms ]]
        -- upvalues: v127 (ref), v131 (ref)
        local v176 = 0;
        local _ = function(v177, v178) --[[ Line: 607 ]] --[[ Name: checkEm ]]
            -- upvalues: v176 (ref)
            local _, v180 = v177:lower():gsub(v178, "");
            v176 = v176 + v180;
        end;
        local l_Tool_4 = v174.Tool;
        if l_Tool_4 then
            for v183 in pairs(v175) do
                local v184, v185 = v127.Text:lower():gsub(v183, "");
                v176 = v176 + v185;
                if l_Tool_4:IsA("Tool") then
                    v184, v185 = (v131 and v131.Text or ""):lower():gsub(v183, "");
                    v176 = v176 + v185;
                end;
            end;
        end;
        return v176;
    end;
    v123.Select = function(_) --[[ Line: 625 ]] --[[ Name: Select ]]
        -- upvalues: v123 (copy), v57 (ref), l_Humanoid_0 (ref), v66 (ref), v62 (ref), l_Backpack_0 (ref)
        local l_Tool_5 = v123.Tool;
        if l_Tool_5 then
            if l_Tool_5 and l_Tool_5.Parent == v57 then
                if l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v66 then
                        v66:ToggleSelect();
                        v62[v66]:UpdateEquipView();
                        v66 = nil;
                        return;
                    end;
                end;
            elseif l_Tool_5.Parent == l_Backpack_0 then
                if l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v66 then
                        v66:ToggleSelect();
                        v62[v66]:UpdateEquipView();
                        v66 = nil;
                    end;
                end;
                l_Humanoid_0:EquipTool(l_Tool_5);
            end;
        end;
    end;
    v124 = Instance.new("TextButton");
    v124.Name = tostring(v122);
    v124.BackgroundColor3 = v17;
    v124.BorderColor3 = v23;
    v124.Text = "";
    v124.BorderSizePixel = 0;
    v124.Size = UDim2.new(0, v37, 0, v37);
    v124.Active = true;
    v124.Draggable = false;
    v124.BackgroundTransparency = v20;
    v124.MouseButton1Click:Connect(function() --[[ Line: 648 ]]
        -- upvalues: v123 (copy)
        changeSlot(v123);
    end);
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Name = "Corner";
    l_UICorner_0.CornerRadius = v22;
    l_UICorner_0.Parent = v124;
    v123.Frame = v124;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "SelectionObjectClipper";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v124;
    v130 = Instance.new("ImageLabel");
    v130.Name = "Selector";
    v130.BackgroundTransparency = 1;
    v130.Size = UDim2.new(1, 0, 1, 0);
    v130.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
    v130.ScaleType = Enum.ScaleType.Slice;
    v130.SliceCenter = Rect.new(12, 12, 52, 52);
    v130.Parent = l_Frame_0;
    v126 = Instance.new("ImageLabel");
    v126.BackgroundTransparency = 1;
    v126.Name = "Icon";
    v126.Size = UDim2.new(1, 0, 1, 0);
    v126.Position = UDim2.new(0.5, 0, 0.5, 0);
    v126.AnchorPoint = Vector2.new(0.5, 0.5);
    if l_l_script_0_Attribute_0 == true then
        v126.Size = UDim2.new(1, -v21 * 2, 1, -v21 * 2);
    else
        v126.Size = UDim2.new(1, 0, 1, 0);
    end;
    v126.Parent = v124;
    l_Frame_0 = Instance.new("UICorner");
    l_Frame_0.Name = "Corner";
    if l_l_script_0_Attribute_0 == true then
        l_Frame_0.CornerRadius = v22 - UDim.new(0, v21);
    else
        l_Frame_0.CornerRadius = v22;
    end;
    l_Frame_0.Parent = v126;
    v127 = Instance.new("TextLabel");
    v127.BackgroundTransparency = 1;
    v127.Name = "ToolName";
    v127.Text = "";
    v127.TextColor3 = v26;
    v127.TextStrokeTransparency = v27;
    v127.TextStrokeColor3 = v28;
    v127.FontFace = Font.new(v33.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    v127.TextSize = v34;
    v127.Size = UDim2.new(1, -v21 * 2, 1, -v21 * 2);
    v127.Position = UDim2.new(0.5, 0, 0.5, 0);
    v127.AnchorPoint = Vector2.new(0.5, 0.5);
    v127.TextWrapped = true;
    v127.TextTruncate = Enum.TextTruncate.None;
    v127.Parent = v124;
    v123.Frame.LayoutOrder = v123.Index;
    if v122 <= v74 then
        v131 = Instance.new("TextLabel");
        v131.Name = "ToolTip";
        v131.Text = "";
        v131.Size = UDim2.new(1, 0, 1, 0);
        v131.TextColor3 = v26;
        v131.TextStrokeTransparency = v27;
        v131.TextStrokeColor3 = v28;
        v131.FontFace = Font.new(v33.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
        v131.TextSize = v34;
        v131.ZIndex = 2;
        v131.TextWrapped = false;
        v131.TextYAlignment = Enum.TextYAlignment.Center;
        v131.BackgroundColor3 = v25;
        v131.BackgroundTransparency = v20;
        v131.AnchorPoint = Vector2.new(0.5, 1);
        v131.BorderSizePixel = 0;
        v131.Visible = false;
        v131.AutomaticSize = Enum.AutomaticSize.X;
        v131.Parent = v124;
        local l_UICorner_1 = Instance.new("UICorner");
        l_UICorner_1.Name = "Corner";
        l_UICorner_1.CornerRadius = v24;
        l_UICorner_1.Parent = v131;
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingLeft = UDim.new(0, 4);
        l_UIPadding_0.PaddingRight = UDim.new(0, 4);
        l_UIPadding_0.PaddingTop = UDim.new(0, 4);
        l_UIPadding_0.PaddingBottom = UDim.new(0, 4);
        l_UIPadding_0.Parent = v131;
        v124.MouseEnter:Connect(function() --[[ Line: 747 ]]
            -- upvalues: v131 (ref)
            if v131.Text ~= "" then
                v131.Visible = true;
            end;
        end);
        v124.MouseLeave:Connect(function() --[[ Line: 752 ]]
            -- upvalues: v131 (ref)
            v131.Visible = false;
        end);
        v123.MoveToInventory = function(v192) --[[ Line: 756 ]] --[[ Name: MoveToInventory ]]
            -- upvalues: v123 (copy), v74 (ref), v119 (ref), v52 (ref), v57 (ref), l_Humanoid_0 (ref), v66 (ref), v62 (ref), v70 (ref), v49 (ref)
            if v123.Index <= v74 then
                local l_Tool_6 = v123.Tool;
                v192:Clear();
                local v194 = v119(v52);
                v194:Fill(l_Tool_6);
                if l_Tool_6 and l_Tool_6.Parent == v57 and l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v66 then
                        v66:ToggleSelect();
                        v62[v66]:UpdateEquipView();
                        v66 = nil;
                    end;
                end;
                if v70 then
                    v194.Frame.Visible = false;
                    v194.Parent = v49;
                end;
            end;
        end;
        if v122 < 10 or v122 == v74 then
            local v195 = v122 < 10 and v122 or 0;
            v132 = Instance.new("TextLabel");
            v132.BackgroundTransparency = 1;
            v132.Name = "Number";
            v132.TextColor3 = v26;
            v132.TextStrokeTransparency = v27;
            v132.TextStrokeColor3 = v28;
            v132.TextSize = v34;
            v132.Text = tostring(v195);
            v132.FontFace = Font.new(v33.Family, Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
            v132.Size = UDim2.new(0.4, 0, 0.4, 0);
            v132.Visible = false;
            v132.Parent = v124;
            v63[l_Value_1 + v195] = v123.Select;
        end;
    end;
    local l_Position_0 = v124.Position;
    local v197 = 0;
    local v198 = nil;
    do
        local l_l_Position_0_0, l_v197_0, l_v198_0 = l_Position_0, v197, v198;
        v124.DragBegin:Connect(function(v202) --[[ Line: 797 ]]
            -- upvalues: v64 (ref), v124 (ref), l_l_Position_0_0 (ref), v41 (ref), v126 (ref), v127 (ref), v132 (ref), l_v198_0 (ref), v52 (ref), v49 (ref), v125 (ref)
            v64[v124] = true;
            l_l_Position_0_0 = v202;
            v124.BorderSizePixel = 2;
            v41:lock();
            v124.ZIndex = 2;
            v126.ZIndex = 2;
            v127.ZIndex = 2;
            v124.Parent.ZIndex = 2;
            if v132 then
                v132.ZIndex = 2;
            end;
            l_v198_0 = v124.Parent;
            if l_v198_0 == v52 then
                local v203 = UDim2.new(0, v124.AbsolutePosition.X - v49.AbsolutePosition.X, 0, v124.AbsolutePosition.Y - v49.AbsolutePosition.Y);
                v124.Parent = v49;
                v124.Position = v203;
                v125 = Instance.new("Frame");
                v125.Name = "FakeSlot";
                v125.LayoutOrder = v124.LayoutOrder;
                v125.Size = v124.Size;
                v125.BackgroundTransparency = 1;
                v125.Parent = v52;
            end;
        end);
        v124.DragStopped:Connect(function(v204, v205) --[[ Line: 840 ]]
            -- upvalues: v125 (ref), v124 (ref), l_l_Position_0_0 (ref), l_v198_0 (ref), v41 (ref), v126 (ref), v127 (ref), v132 (ref), v64 (ref), v123 (copy), v49 (ref), v74 (ref), l_v197_0 (ref), v61 (ref), v48 (ref), v60 (ref), v57 (ref), l_Humanoid_0 (ref), v66 (ref), v62 (ref), v70 (ref)
            if v125 then
                v125:Destroy();
            end;
            local v206 = os.clock();
            v124.Position = l_l_Position_0_0;
            v124.Parent = l_v198_0;
            v124.BorderSizePixel = 0;
            v41:unlock();
            v124.ZIndex = 1;
            v126.ZIndex = 1;
            v127.ZIndex = 1;
            l_v198_0.ZIndex = 1;
            if v132 then
                v132.ZIndex = 1;
            end;
            v64[v124] = nil;
            if not v123.Tool then
                return;
            else
                local l_v49_0 = v49;
                local l_AbsolutePosition_1 = l_v49_0.AbsolutePosition;
                local l_AbsoluteSize_1 = l_v49_0.AbsoluteSize;
                local v210 = false;
                if l_AbsolutePosition_1.X < v204 then
                    v210 = false;
                    if v204 <= l_AbsolutePosition_1.X + l_AbsoluteSize_1.X then
                        v210 = false;
                        if l_AbsolutePosition_1.Y < v205 then
                            v210 = v205 <= l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y;
                        end;
                    end;
                end;
                if v210 then
                    if v123.Index <= v74 then
                        v123:MoveToInventory();
                    end;
                    if v123.Index > v74 and v206 - l_v197_0 < 0.5 then
                        if v61 then
                            v210 = v123.Tool;
                            v123:Clear();
                            v61:Fill(v210);
                            v123:Delete();
                        end;
                        v206 = 0;
                    end;
                else
                    l_v49_0 = v48;
                    l_AbsolutePosition_1 = l_v49_0.AbsolutePosition;
                    l_AbsoluteSize_1 = l_v49_0.AbsoluteSize;
                    v210 = false;
                    if l_AbsolutePosition_1.X < v204 then
                        v210 = false;
                        if v204 <= l_AbsolutePosition_1.X + l_AbsoluteSize_1.X then
                            v210 = false;
                            if l_AbsolutePosition_1.Y < v205 then
                                v210 = v205 <= l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y;
                            end;
                        end;
                    end;
                    if v210 then
                        v210 = {
                            1e999, 
                            nil
                        };
                        for v211 = 1, v74 do
                            local v212 = v60[v211];
                            local l_Frame_1 = v212.Frame;
                            local v214 = Vector2.new(v204, v205);
                            local l_Magnitude_0 = (l_Frame_1.AbsolutePosition + l_Frame_1.AbsoluteSize / 2 - v214).Magnitude;
                            if l_Magnitude_0 < v210[1] then
                                v210 = {
                                    l_Magnitude_0, 
                                    v212
                                };
                            end;
                        end;
                        l_v49_0 = v210[2];
                        if l_v49_0 ~= v123 then
                            v123:Swap(l_v49_0);
                            if v123.Index > v74 then
                                l_AbsolutePosition_1 = v123.Tool;
                                if not l_AbsolutePosition_1 then
                                    v123:Delete();
                                else
                                    if l_AbsolutePosition_1 and l_AbsolutePosition_1.Parent == v57 and l_Humanoid_0 then
                                        l_Humanoid_0:UnequipTools();
                                        if v66 then
                                            v66:ToggleSelect();
                                            v62[v66]:UpdateEquipView();
                                            v66 = nil;
                                        end;
                                    end;
                                    if v70 then
                                        v123.Frame.Visible = false;
                                        v123.Frame.Parent = v49;
                                    end;
                                end;
                            end;
                        end;
                    elseif v123.Index <= v74 then
                        v123:MoveToInventory();
                    end;
                end;
                l_v197_0 = v206;
                return;
            end;
        end);
    end;
    v124.Parent = v120;
    v60[v122] = v123;
    if v74 < v122 then
        v94();
        if v49.Visible and not v70 then
            l_Position_0 = v51.CanvasSize.Y.Offset - v51.AbsoluteSize.Y;
            v51.CanvasPosition = Vector2.new(0, (math.max(0, l_Position_0)));
        end;
    end;
    return v123;
end;
local function v225(v216) --[[ Line: 950 ]] --[[ Name: OnChildAdded ]]
    -- upvalues: v57 (ref), l_Humanoid_0 (ref), v66 (ref), v62 (copy), v67 (ref), l_LocalPlayer_0 (ref), v61 (ref), v119 (copy), v52 (ref), v60 (copy), l_Backpack_0 (ref), v91 (copy), v74 (copy), v49 (ref), v9 (copy)
    if not v216:IsA("Tool") and not v216:IsA("HopperBin") then
        if v216:IsA("Humanoid") and v216.Parent == v57 then
            l_Humanoid_0 = v216;
        end;
        return;
    else
        if v216.Parent == v57 then

        end;
        if v66 and v216.Parent == v57 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
        if not v67 and v216.Parent == v57 and not v62[v216] then
            local l_StarterGear_0 = l_LocalPlayer_0:FindFirstChild("StarterGear");
            if l_StarterGear_0 and l_StarterGear_0:FindFirstChild(v216.Name) then
                v67 = true;
                local v218 = v61 or v119(v52);
                for v219 = v218.Index, 1, -1 do
                    local v220 = v60[v219];
                    local v221 = v219 - 1;
                    if v221 > 0 then
                        v60[v221]:Swap(v220);
                    else
                        v220:Fill(v216);
                    end;
                end;
                for _, v223 in pairs(v57:GetChildren()) do
                    if v223:IsA("Tool") and v223 ~= v216 then
                        v223.Parent = l_Backpack_0;
                    end;
                end;
                v91();
                return;
            end;
        end;
        local v224 = v62[v216];
        if v224 then
            v224:UpdateEquipView();
        else
            v224 = v61 or v119(v52);
            v224:Fill(v216);
            if v224.Index <= v74 and not v49.Visible then
                v91();
            end;
            if v216:IsA("HopperBin") and v216.Active then
                if l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v66 then
                        v66:ToggleSelect();
                        v62[v66]:UpdateEquipView();
                        v66 = nil;
                    end;
                end;
                v66 = v216;
            end;
        end;
        v9.BackpackItemAdded:Fire();
        return;
    end;
end;
local function v233(v226) --[[ Line: 1017 ]] --[[ Name: OnChildRemoved ]]
    -- upvalues: v57 (ref), l_Backpack_0 (ref), v62 (copy), v74 (copy), v49 (ref), v91 (copy), v66 (ref), v9 (copy), v60 (copy)
    local v227 = false;
    if not v226:IsA("Tool") and not v226:IsA("HopperBin") then
        return;
    else
        local l_Parent_0 = v226.Parent;
        if l_Parent_0 == v57 or l_Parent_0 == l_Backpack_0 then
            return;
        else
            local v229 = v62[v226];
            if v229 then
                v229:Clear();
                if v229.Index > v74 then
                    v229:Delete();
                elseif not v49.Visible then
                    v91();
                end;
            end;
            if v226 == v66 then
                v66 = nil;
            end;
            v9.BackpackItemRemoved:Fire();
            local v230;
            for v231 = v74 + 1, #v60 do
                local v232 = v60[v231];
                if v232 and v232.Tool then
                    v230 = false;
                    v227 = true;
                end;
                if v227 then
                    break;
                end;
            end;
            if not v227 then
                v230 = true;
            end;
            v227 = false;
            if v230 then
                v9.BackpackEmpty:Fire();
            end;
            return;
        end;
    end;
end;
local function v243(v234) --[[ Line: 1051 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: v60 (copy), v74 (copy), v66 (ref), v71 (ref), v57 (ref), v233 (copy), v225 (copy), l_Backpack_0 (ref), l_LocalPlayer_0 (ref), v91 (copy)
    for v235 = #v60, 1, -1 do
        local v236 = v60[v235];
        if v236.Tool then
            v236:Clear();
        end;
        if v74 < v235 then
            v236:Delete();
        end;
    end;
    v66 = nil;
    for _, v238 in pairs(v71) do
        v238:Disconnect();
    end;
    v71 = {};
    v57 = v234;
    table.insert(v71, v234.ChildRemoved:Connect(v233));
    table.insert(v71, v234.ChildAdded:Connect(v225));
    for _, v240 in pairs(v234:GetChildren()) do
        v225(v240);
    end;
    l_Backpack_0 = l_LocalPlayer_0:WaitForChild("Backpack");
    table.insert(v71, l_Backpack_0.ChildRemoved:Connect(v233));
    table.insert(v71, l_Backpack_0.ChildAdded:Connect(v225));
    for _, v242 in pairs(l_Backpack_0:GetChildren()) do
        v225(v242);
    end;
    v91();
end;
local function v249(v244, v245) --[[ Line: 1090 ]] --[[ Name: OnInputBegan ]]
    -- upvalues: l_TextChatService_0 (copy), v69 (ref), v68 (ref), l_Value_0 (copy), v63 (copy), v49 (ref), v41 (copy)
    local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
    if v244.UserInputType == Enum.UserInputType.Keyboard and not v69 and not l_ChatInputBarConfiguration_0.IsFocused and (v68 or v244.KeyCode.Value == l_Value_0) then
        local v247 = v63[v244.KeyCode.Value];
        if v247 then
            v247(v245);
        end;
    end;
    local l_UserInputType_0 = v244.UserInputType;
    if not v245 and (l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch) and v49.Visible then
        v41:deselect();
    end;
end;
local function v258() --[[ Line: 1116 ]] --[[ Name: OnUISChanged ]]
    -- upvalues: l_UserInputService_0 (copy), v74 (copy), v60 (copy), v38 (copy), v39 (copy)
    if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch then
        for v250 = 1, v74 do
            v60[v250]:TurnNumber(false);
        end;
        return;
    elseif l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Keyboard then
        for v251 = 1, v74 do
            v60[v251]:TurnNumber(true);
        end;
        return;
    else
        for _, v253 in pairs(v38) do
            if l_UserInputService_0:GetLastInputType() == v253 then
                for v254 = 1, v74 do
                    v60[v254]:TurnNumber(true);
                end;
                return;
            end;
        end;
        for _, v256 in pairs(v39) do
            if l_UserInputService_0:GetLastInputType() == v256 then
                for v257 = 1, v74 do
                    v60[v257]:TurnNumber(false);
                end;
                return;
            end;
        end;
        return;
    end;
end;
local v259 = nil;
local v260 = nil;
local function v261() --[[ Line: 1157 ]]

end;
unbindAllGamepadEquipActions = function() --[[ Line: 1160 ]] --[[ Name: unbindAllGamepadEquipActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("BackpackHasGamepadFocus");
    l_ContextActionService_0:UnbindAction("BackpackCloseInventory");
end;
v56 = function(_, v263, v264) --[[ Line: 1236 ]]
    -- upvalues: v259 (ref), v260 (ref), l_Humanoid_0 (ref), v66 (ref), v62 (copy), v74 (copy), v60 (copy), v76 (ref)
    if v263 ~= Enum.UserInputState.Begin then
        return;
    elseif v259 and (v259.KeyCode == Enum.KeyCode.ButtonR1 and v264.KeyCode == Enum.KeyCode.ButtonL1 or v259.KeyCode == Enum.KeyCode.ButtonL1 and v264.KeyCode == Enum.KeyCode.ButtonR1) and os.clock() - v260 <= 0.06 then
        if l_Humanoid_0 then
            l_Humanoid_0:UnequipTools();
            if v66 then
                v66:ToggleSelect();
                v62[v66]:UpdateEquipView();
                v66 = nil;
            end;
        end;
        v259 = v264;
        v260 = os.clock();
        return;
    else
        v259 = v264;
        v260 = os.clock();
        task.delay(0.06, function() --[[ Line: 1264 ]]
            -- upvalues: v259 (ref), v264 (copy), v74 (ref), v60 (ref), l_Humanoid_0 (ref), v66 (ref), v62 (ref), v76 (ref)
            if v259 ~= v264 then
                return;
            else
                local v265 = 0;
                v265 = v264.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1;
                for v266 = 1, v74 do
                    if v60[v266]:IsEquipped() then
                        local v267 = v265 + v266;
                        local v268 = false;
                        if v74 < v267 then
                            v267 = 1;
                            v268 = true;
                        elseif v267 < 1 then
                            v267 = v74;
                            v268 = true;
                        end;
                        local l_v267_0 = v267;
                        while true do
                            if not v60[v267].Tool then
                                v267 = v267 + v265;
                                if v267 == l_v267_0 then
                                    return;
                                elseif v74 < v267 then
                                    v267 = 1;
                                    v268 = true;
                                elseif v267 < 1 then
                                    v267 = v74;
                                    v268 = true;
                                end;
                            elseif v268 then
                                if l_Humanoid_0 then
                                    l_Humanoid_0:UnequipTools();
                                    if v66 then
                                        v66:ToggleSelect();
                                        v62[v66]:UpdateEquipView();
                                        v66 = nil;
                                    end;
                                end;
                                v76 = nil;
                                return;
                            else
                                v60[v267]:Select();
                                return;
                            end;
                        end;
                    end;
                end;
                if v76 and v76.Tool then
                    v76:Select();
                    return;
                else
                    local v270 = v265 == -1 and v74 or 1;
                    local v271 = v265 == -1 and 1 or v74;
                    for v272 = v270, v271, v265 do
                        if v60[v272].Tool then
                            v60[v272]:Select();
                            return;
                        end;
                    end;
                    return;
                end;
            end;
        end);
        return;
    end;
end;
getGamepadSwapSlot = function() --[[ Line: 1331 ]] --[[ Name: getGamepadSwapSlot ]]
    -- upvalues: v60 (copy)
    for v273 = 1, #v60 do
        if v60[v273].Frame.BorderSizePixel > 0 then
            return v60[v273];
        end;
    end;
end;
changeSlot = function(v274) --[[ Line: 1341 ]] --[[ Name: changeSlot ]]
    -- upvalues: l_VRService_0 (copy), v49 (ref), l_GuiService_0 (copy), v50 (ref), v74 (copy)
    local v275 = not l_VRService_0.VREnabled or v49.Visible;
    if v274.Frame == l_GuiService_0.SelectedObject and v275 then
        local v276 = getGamepadSwapSlot();
        if v276 then
            v276.Frame.BorderSizePixel = 0;
            if v276 ~= v274 then
                v274:Swap(v276);
                v50.SelectionImageObject.Visible = false;
                if v274.Index > v74 and not v274.Tool then
                    if l_GuiService_0.SelectedObject == v274.Frame then
                        l_GuiService_0.SelectedObject = v276.Frame;
                    end;
                    v274:Delete();
                end;
                if v276.Index > v74 and not v276.Tool then
                    if l_GuiService_0.SelectedObject == v276.Frame then
                        l_GuiService_0.SelectedObject = v274.Frame;
                    end;
                    v276:Delete();
                    return;
                end;
            end;
        else
            local l_Size_0 = v274.Frame.Size;
            local l_Position_1 = v274.Frame.Position;
            v274.Frame:TweenSizeAndPosition(l_Size_0 + UDim2.new(0, 10, 0, 10), l_Position_1 - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ Line: 1377 ]]
                -- upvalues: v274 (copy), l_Size_0 (copy), l_Position_1 (copy)
                v274.Frame:TweenSizeAndPosition(l_Size_0, l_Position_1, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true);
            end);
            v274.Frame.BorderSizePixel = 3;
            v50.SelectionImageObject.Visible = true;
            return;
        end;
    else
        v274:Select();
        v50.SelectionImageObject.Visible = false;
    end;
end;
vrMoveSlotToInventory = function() --[[ Line: 1397 ]] --[[ Name: vrMoveSlotToInventory ]]
    -- upvalues: l_VRService_0 (copy), v50 (ref)
    if not l_VRService_0.VREnabled then
        return;
    else
        local v279 = getGamepadSwapSlot();
        if v279 and v279.Tool then
            v279.Frame.BorderSizePixel = 0;
            v279:MoveToInventory();
            v50.SelectionImageObject.Visible = false;
        end;
        return;
    end;
end;
enableGamepadInventoryControl = function() --[[ Line: 1410 ]] --[[ Name: enableGamepadInventoryControl ]]
    -- upvalues: v49 (ref), v41 (copy), l_ContextActionService_0 (copy), v261 (copy), l_GuiService_0 (copy), v48 (ref)
    local function v281() --[[ Line: 1411 ]]
        -- upvalues: v49 (ref), v41 (ref)
        if getGamepadSwapSlot() then
            local v280 = getGamepadSwapSlot();
            if v280 then
                v280.Frame.BorderSizePixel = 0;
                return;
            end;
        elseif v49.Visible then
            v41:deselect();
        end;
    end;
    l_ContextActionService_0:BindAction("BackpackHasGamepadFocus", v261, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindAction("BackpackCloseInventory", v281, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    if not false then
        l_GuiService_0.SelectedObject = v48:FindFirstChild("1");
    end;
end;
disableGamepadInventoryControl = function() --[[ Line: 1444 ]] --[[ Name: disableGamepadInventoryControl ]]
    -- upvalues: v74 (copy), v60 (copy), l_GuiService_0 (copy), v47 (ref)
    unbindAllGamepadEquipActions();
    for v282 = 1, v74 do
        local v283 = v60[v282];
        if v283 and v283.Frame then
            v283.Frame.BorderSizePixel = 0;
        end;
    end;
    if l_GuiService_0.SelectedObject and l_GuiService_0.SelectedObject:IsDescendantOf(v47) then
        l_GuiService_0.SelectedObject = nil;
    end;
end;
local function _() --[[ Line: 1459 ]] --[[ Name: bindBackpackHotbarAction ]]
    -- upvalues: v68 (ref), v44 (ref), l_ContextActionService_0 (copy), v56 (ref)
    if v68 and not v44 then
        v44 = true;
        l_ContextActionService_0:BindAction("BackpackHotbarEquip", v56, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
end;
local function _() --[[ Line: 1472 ]] --[[ Name: unbindBackpackHotbarAction ]]
    -- upvalues: v44 (ref), l_ContextActionService_0 (copy)
    disableGamepadInventoryControl();
    v44 = false;
    l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
end;
gamepadDisconnected = function() --[[ Line: 1478 ]] --[[ Name: gamepadDisconnected ]]
    -- upvalues: v72 (ref)
    v72 = false;
    disableGamepadInventoryControl();
end;
gamepadConnected = function() --[[ Line: 1483 ]] --[[ Name: gamepadConnected ]]
    -- upvalues: v72 (ref), l_GuiService_0 (copy), v47 (ref), v65 (ref), v68 (ref), v44 (ref), l_ContextActionService_0 (copy), v56 (ref), v49 (ref)
    v72 = true;
    l_GuiService_0:AddSelectionParent("BackpackSelection", v47);
    if v65 >= 1 and v68 and not v44 then
        v44 = true;
        l_ContextActionService_0:BindAction("BackpackHotbarEquip", v56, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
    if v49.Visible then
        enableGamepadInventoryControl();
    end;
end;
local function _(v286) --[[ Line: 1496 ]] --[[ Name: OnIconChanged ]]
    -- upvalues: l_StarterGui_0 (copy), v68 (ref), v47 (ref), v65 (ref), v44 (ref), l_ContextActionService_0 (copy), v56 (ref)
    v286 = v286 and l_StarterGui_0:GetCore("TopbarEnabled");
    v68 = v286;
    v47.Visible = v286;
    if v286 then
        if v65 >= 1 and v68 and not v44 then
            v44 = true;
            l_ContextActionService_0:BindAction("BackpackHotbarEquip", v56, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            return;
        end;
    else
        disableGamepadInventoryControl();
        v44 = false;
        l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
    end;
end;
local function v293(v288, v289) --[[ Line: 1520 ]] --[[ Name: MakeVRRoundButton ]]
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Name = v288;
    l_ImageButton_0.Size = UDim2.new(0, 40, 0, 40);
    l_ImageButton_0.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png";
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "Icon";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.Position = UDim2.new(0.25, 0, 0.25, 0);
    l_ImageLabel_0.Image = v289;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Name = "Selection";
    l_ImageLabel_1.Size = UDim2.new(0.9, 0, 0.9, 0);
    l_ImageLabel_1.Position = UDim2.new(0.05, 0, 0.05, 0);
    l_ImageLabel_1.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png";
    l_ImageButton_0.SelectionImageObject = l_ImageLabel_1;
    return l_ImageButton_0, l_ImageLabel_0, l_ImageLabel_1;
end;
v47 = Instance.new("Frame");
v47.BackgroundTransparency = 1;
v47.Name = "Backpack";
v47.Size = UDim2.new(1, 0, 1, 0);
v47.Visible = false;
v47.Parent = l_ScreenGui_0;
v48 = Instance.new("Frame");
v48.BackgroundTransparency = 1;
v48.Name = "Hotbar";
v48.Size = UDim2.new(1, 0, 1, 0);
v48.Parent = v47;
for v294 = 1, v74 do
    local v295 = v119(v48, v294);
    v295.Frame.Visible = false;
    if not v61 then
        v61 = v295;
    end;
end;
local l_ImageLabel_2 = Instance.new("ImageLabel");
l_ImageLabel_2.BackgroundTransparency = 1;
l_ImageLabel_2.Name = "LeftBumper";
l_ImageLabel_2.Size = UDim2.new(0, 40, 0, 40);
l_ImageLabel_2.Position = UDim2.new(0, -l_ImageLabel_2.Size.X.Offset, 0.5, -l_ImageLabel_2.Size.Y.Offset / 2);
local l_ImageLabel_3 = Instance.new("ImageLabel");
l_ImageLabel_3.BackgroundTransparency = 1;
l_ImageLabel_3.Name = "RightBumper";
l_ImageLabel_3.Size = UDim2.new(0, 40, 0, 40);
l_ImageLabel_3.Position = UDim2.new(1, 0, 0.5, -l_ImageLabel_3.Size.Y.Offset / 2);
v49 = Instance.new("Frame");
v49.Name = "Inventory";
v49.Size = UDim2.new(1, 0, 1, 0);
v49.BackgroundTransparency = v15;
v49.BackgroundColor3 = v17;
v49.Active = true;
v49.Visible = false;
v49.Parent = v47;
local l_UICorner_2 = Instance.new("UICorner");
l_UICorner_2.Name = "Corner";
l_UICorner_2.CornerRadius = v16;
l_UICorner_2.Parent = v49;
v50 = Instance.new("TextButton");
v50.Name = "VRInventorySelector";
v50.Position = UDim2.new(0, 0, 0, 0);
v50.Size = UDim2.new(1, 0, 1, 0);
v50.BackgroundTransparency = 1;
v50.Text = "";
v50.Parent = v49;
local l_ImageLabel_4 = Instance.new("ImageLabel");
l_ImageLabel_4.BackgroundTransparency = 1;
l_ImageLabel_4.Name = "Selector";
l_ImageLabel_4.Size = UDim2.new(1, 0, 1, 0);
l_ImageLabel_4.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
l_ImageLabel_4.ScaleType = Enum.ScaleType.Slice;
l_ImageLabel_4.SliceCenter = Rect.new(12, 12, 52, 52);
l_ImageLabel_4.Visible = false;
v50.SelectionImageObject = l_ImageLabel_4;
v50.MouseButton1Click:Connect(function() --[[ Line: 1617 ]]
    vrMoveSlotToInventory();
end);
v51 = Instance.new("ScrollingFrame");
v51.BackgroundTransparency = 1;
v51.Name = "ScrollingFrame";
v51.Size = UDim2.new(1, 0, 1, 0);
v51.Selectable = false;
v51.ScrollingDirection = Enum.ScrollingDirection.Y;
v51.BorderSizePixel = 0;
v51.ScrollBarThickness = 8;
v51.ScrollBarImageColor3 = Color3.new(1, 1, 1);
v51.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
v51.CanvasSize = UDim2.new(0, 0, 0, 0);
v51.Parent = v49;
v52 = Instance.new("Frame");
v52.BackgroundTransparency = 1;
v52.Name = "UIGridFrame";
v52.Selectable = false;
v52.Size = UDim2.new(1, -10, 1, 0);
v52.Position = UDim2.new(0, 5, 0, 0);
v52.Parent = v51;
v53 = Instance.new("UIGridLayout");
v53.SortOrder = Enum.SortOrder.LayoutOrder;
v53.CellSize = UDim2.new(0, v37, 0, v37);
v53.CellPadding = UDim2.new(0, 5, 0, 5);
v53.Parent = v52;
v54 = v293("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v54.Size = UDim2.new(0, 34, 0, 34);
v54.Position = UDim2.new(0.5, -v54.Size.X.Offset / 2, 0, 43);
v54.Icon.Position = v54.Icon.Position - UDim2.new(0, 0, 0, 2);
v54.MouseButton1Click:Connect(function() --[[ Line: 1654 ]]
    -- upvalues: v51 (ref), v37 (ref)
    v51.CanvasPosition = Vector2.new(v51.CanvasPosition.X, (math.min(v51.CanvasSize.Y.Offset - v51.AbsoluteWindowSize.Y, (math.max(0, v51.CanvasPosition.Y - (v37 + 5))))));
end);
v55 = v293("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v55.Rotation = 180;
v55.Icon.Position = v55.Icon.Position - UDim2.new(0, 0, 0, 2);
v55.Size = UDim2.new(0, 34, 0, 34);
v55.Position = UDim2.new(0.5, -v55.Size.X.Offset / 2, 1, -v55.Size.Y.Offset - 3);
v55.MouseButton1Click:Connect(function() --[[ Line: 1671 ]]
    -- upvalues: v51 (ref), v37 (ref)
    v51.CanvasPosition = Vector2.new(v51.CanvasPosition.X, (math.min(v51.CanvasSize.Y.Offset - v51.AbsoluteWindowSize.Y, (math.max(0, v51.CanvasPosition.Y + (v37 + 5))))));
end);
v51.Changed:Connect(function(v300) --[[ Line: 1682 ]]
    -- upvalues: v51 (ref), v54 (ref), v55 (ref)
    if v300 == "AbsoluteWindowSize" or v300 == "CanvasPosition" or v300 == "CanvasSize" then
        local v301 = v51.CanvasPosition.Y ~= 0;
        local v302 = v51.CanvasPosition.Y < v51.CanvasSize.Y.Offset - v51.AbsoluteWindowSize.Y;
        v54.Visible = v301;
        v55.Visible = v302;
    end;
end);
v98();
local l_Frame_2 = Instance.new("Frame");
l_Frame_2.Name = "GamepadHintsFrame";
l_Frame_2.Size = UDim2.new(0, v48.Size.X.Offset, 0, v43 and 95 or 60);
l_Frame_2.BackgroundTransparency = v15;
l_Frame_2.BackgroundColor3 = v17;
l_Frame_2.Visible = false;
l_Frame_2.Parent = v47;
local l_UIListLayout_0 = Instance.new("UIListLayout");
l_UIListLayout_0.Name = "Layout";
l_UIListLayout_0.Padding = UDim.new(0, 25);
l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
l_UIListLayout_0.Parent = l_Frame_2;
local l_UICorner_3 = Instance.new("UICorner");
l_UICorner_3.Name = "Corner";
l_UICorner_3.CornerRadius = v16;
l_UICorner_3.Parent = l_Frame_2;
local function v313(v306, v307) --[[ Line: 1718 ]] --[[ Name: addGamepadHint ]]
    -- upvalues: l_Frame_2 (copy), v43 (copy), v33 (copy)
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "HintFrame";
    l_Frame_3.AutomaticSize = Enum.AutomaticSize.XY;
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.Parent = l_Frame_2;
    local l_UIListLayout_1 = Instance.new("UIListLayout");
    l_UIListLayout_1.Name = "Layout";
    l_UIListLayout_1.Padding = v43 and UDim.new(0, 20) or UDim.new(0, 12);
    l_UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center;
    l_UIListLayout_1.Parent = l_Frame_3;
    local l_ImageLabel_5 = Instance.new("ImageLabel");
    l_ImageLabel_5.Name = "HintImage";
    l_ImageLabel_5.Size = v43 and UDim2.new(0, 60, 0, 60) or UDim2.new(0, 30, 0, 30);
    l_ImageLabel_5.BackgroundTransparency = 1;
    l_ImageLabel_5.Image = v306;
    l_ImageLabel_5.Parent = l_Frame_3;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "HintText";
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
    l_TextLabel_0.FontFace = Font.new(v33.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    l_TextLabel_0.TextSize = v43 and 32 or 19;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Text = v307;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.Parent = l_Frame_3;
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = l_TextLabel_0.TextSize;
    l_UITextSizeConstraint_0.Parent = l_TextLabel_0;
end;
v313(l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX), "Remove From Hotbar");
v313(l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonA), "Select/Swap");
v313(l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonB), "Close Backpack");
local function v322() --[[ Line: 1762 ]] --[[ Name: resizeGamepadHintsFrame ]]
    -- upvalues: l_Frame_2 (copy), v48 (ref), v43 (copy), v49 (ref)
    l_Frame_2.Size = UDim2.new(v48.Size.X.Scale, v48.Size.X.Offset, 0, v43 and 95 or 60);
    l_Frame_2.Position = UDim2.new(v48.Position.X.Scale, v48.Position.X.Offset, v49.Position.Y.Scale, v49.Position.Y.Offset - l_Frame_2.Size.Y.Offset - 5);
    local v314 = 0;
    local l_l_Frame_2_Children_0 = l_Frame_2:GetChildren();
    local v316 = {};
    for _, v318 in pairs(l_l_Frame_2_Children_0) do
        if v318:IsA("GuiObject") then
            table.insert(v316, v318);
        end;
    end;
    for v319 = 1, #v316 do
        if v316[v319]:IsA("GuiObject") then
            v316[v319].Size = UDim2.new(1, 0, 1, -5);
            v316[v319].Position = UDim2.new(0, 0, 0, 0);
            v314 = v314 + (v316[v319].HintText.Position.X.Offset + v316[v319].HintText.TextBounds.X);
        end;
    end;
    local v320 = (l_Frame_2.AbsoluteSize.X - v314) / (#v316 - 1);
    for v321 = 1, #v316 do
        v316[v321].Position = v321 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, v316[v321 - 1].Position.X.Offset + v316[v321 - 1].Size.X.Offset + v320, 0, 0);
        v316[v321].Size = UDim2.new(0, v316[v321].HintText.Position.X.Offset + v316[v321].HintText.TextBounds.X, 1, -5);
    end;
end;
local l_Frame_4 = Instance.new("Frame");
l_Frame_4.Name = "Search";
l_Frame_4.BackgroundColor3 = v29;
l_Frame_4.BackgroundTransparency = v30;
l_Frame_4.Size = UDim2.new(0, 190, 0, 30);
l_Frame_4.Position = UDim2.new(1, -l_Frame_4.Size.X.Offset - 5, 0, 5);
l_Frame_4.Parent = v49;
local l_UICorner_4 = Instance.new("UICorner");
l_UICorner_4.Name = "Corner";
l_UICorner_4.CornerRadius = v32;
l_UICorner_4.Parent = l_Frame_4;
local l_UIStroke_0 = Instance.new("UIStroke");
l_UIStroke_0.Name = "Border";
l_UIStroke_0.Color = v31;
l_UIStroke_0.Thickness = 1;
l_UIStroke_0.Transparency = 0.8;
l_UIStroke_0.Parent = l_Frame_4;
local l_TextBox_0 = Instance.new("TextBox");
l_TextBox_0.BackgroundTransparency = 1;
l_TextBox_0.Name = "TextBox";
l_TextBox_0.Text = "";
l_TextBox_0.TextColor3 = v26;
l_TextBox_0.TextStrokeTransparency = v27;
l_TextBox_0.TextStrokeColor3 = v28;
l_TextBox_0.FontFace = Font.new(v33.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
l_TextBox_0.PlaceholderText = "Search";
l_TextBox_0.TextColor3 = v26;
l_TextBox_0.TextTransparency = v27;
l_TextBox_0.TextStrokeColor3 = v28;
l_TextBox_0.ClearTextOnFocus = false;
l_TextBox_0.TextTruncate = Enum.TextTruncate.AtEnd;
l_TextBox_0.TextSize = v34;
l_TextBox_0.TextXAlignment = Enum.TextXAlignment.Left;
l_TextBox_0.TextYAlignment = Enum.TextYAlignment.Center;
l_TextBox_0.Size = UDim2.new(0, 154, 0, 14);
l_TextBox_0.AnchorPoint = Vector2.new(0, 0.5);
l_TextBox_0.Position = UDim2.new(0, 8, 0.5, 0);
l_TextBox_0.ZIndex = 2;
l_TextBox_0.Parent = l_Frame_4;
local l_TextButton_0 = Instance.new("TextButton");
l_TextButton_0.Name = "X";
l_TextButton_0.Text = "";
l_TextButton_0.Size = UDim2.new(0, 30, 0, 30);
l_TextButton_0.Position = UDim2.new(1, -l_TextButton_0.Size.X.Offset, 0.5, -l_TextButton_0.Size.Y.Offset / 2);
l_TextButton_0.ZIndex = 4;
l_TextButton_0.Visible = false;
l_TextButton_0.BackgroundTransparency = 1;
l_TextButton_0.Parent = l_Frame_4;
local l_ImageButton_1 = Instance.new("ImageButton");
l_ImageButton_1.Name = "X";
l_ImageButton_1.Image = "rbxasset://textures/ui/InspectMenu/x.png";
l_ImageButton_1.BackgroundTransparency = 1;
l_ImageButton_1.Size = UDim2.new(0, l_Frame_4.Size.Y.Offset - 20, 0, l_Frame_4.Size.Y.Offset - 20);
l_ImageButton_1.AnchorPoint = Vector2.new(0.5, 0.5);
l_ImageButton_1.Position = UDim2.new(0.5, 0, 0.5, 0);
l_ImageButton_1.ZIndex = 1;
l_ImageButton_1.BorderSizePixel = 0;
l_ImageButton_1.Parent = l_TextButton_0;
local function v340() --[[ Line: 1899 ]] --[[ Name: search ]]
    -- upvalues: l_TextBox_0 (copy), v74 (copy), v60 (copy), v49 (ref), v70 (ref), v52 (ref), v51 (ref), v94 (copy), l_TextButton_0 (copy)
    local v329 = {};
    for v330 in l_TextBox_0.Text:gmatch("%S+") do
        v329[v330:lower()] = true;
    end;
    local v331 = {};
    for v332 = v74 + 1, #v60 do
        local v333 = v60[v332];
        table.insert(v331, {
            v333, 
            (v333:CheckTerms(v329))
        });
        v333.Frame.Visible = false;
        v333.Frame.Parent = v49;
    end;
    table.sort(v331, function(v334, v335) --[[ Line: 1914 ]]
        return v334[2] > v335[2];
    end);
    v70 = true;
    local v336 = 0;
    for _, v338 in ipairs(v331) do
        local v339 = v338[1];
        if v338[2] > 0 then
            v339.Frame.Visible = true;
            v339.Frame.Parent = v52;
            v339.Frame.LayoutOrder = v74 + v336;
            v336 = v336 + 1;
        end;
    end;
    v51.CanvasPosition = Vector2.new(0, 0);
    v94();
    l_TextButton_0.ZIndex = 3;
end;
local function v343() --[[ Line: 1936 ]] --[[ Name: clearResults ]]
    -- upvalues: l_TextButton_0 (copy), v70 (ref), v74 (copy), v60 (copy), v52 (ref), v94 (copy)
    if l_TextButton_0.ZIndex > 0 then
        v70 = false;
        for v341 = v74 + 1, #v60 do
            local v342 = v60[v341];
            v342.Frame.LayoutOrder = v342.Index;
            v342.Frame.Parent = v52;
            v342.Frame.Visible = true;
        end;
        l_TextButton_0.ZIndex = 0;
    end;
    v94();
end;
local function v344() --[[ Line: 1950 ]] --[[ Name: reset ]]
    -- upvalues: v343 (copy), l_TextBox_0 (copy)
    v343();
    l_TextBox_0.Text = "";
end;
local function v349(v345) --[[ Line: 1955 ]] --[[ Name: onChanged ]]
    -- upvalues: l_TextBox_0 (copy), v27 (copy), v343 (copy), v340 (copy), l_TextButton_0 (copy)
    if v345 == "Text" then
        local l_Text_0 = l_TextBox_0.Text;
        if l_Text_0 == "" then
            l_TextBox_0.TextTransparency = v27;
            v343();
        elseif l_Text_0 ~= "" then
            l_TextBox_0.TextTransparency = 0;
            v340();
        end;
        local l_l_TextButton_0_0 = l_TextButton_0;
        local v348 = false;
        if l_Text_0 ~= "" then
            v348 = l_Text_0 ~= "";
        end;
        l_l_TextButton_0_0.Visible = v348;
    end;
end;
local function v351(v350) --[[ Line: 1969 ]] --[[ Name: focusLost ]]
    -- upvalues: v340 (copy)
    if v350 then
        v340();
    end;
end;
l_TextButton_0.MouseButton1Click:Connect(v344);
l_TextBox_0.Changed:Connect(v349);
l_TextBox_0.FocusLost:Connect(v351);
v9.StateChanged.Event:Connect(function(v352) --[[ Line: 1980 ]]
    -- upvalues: v343 (copy), l_TextBox_0 (copy)
    if not v352 then
        v343();
        l_TextBox_0.Text = "";
    end;
end);
v63[Enum.KeyCode.Escape.Value] = function(v353) --[[ Line: 1988 ]]
    -- upvalues: v343 (copy), l_TextBox_0 (copy)
    if v353 then
        v343();
        l_TextBox_0.Text = "";
    end;
end;
l_UserInputService_0.LastInputTypeChanged:Connect(function(v354) --[[ Line: 1993 ]] --[[ Name: detectGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), l_Frame_4 (copy)
    if v354 == Enum.UserInputType.Gamepad1 and not l_UserInputService_0.VREnabled then
        l_Frame_4.Visible = false;
        return;
    else
        l_Frame_4.Visible = true;
        return;
    end;
end);
l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 2004 ]]
    -- upvalues: l_ScreenGui_0 (copy), v41 (copy)
    l_ScreenGui_0.Enabled = false;
    v41:setEnabled(false);
end);
l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 2010 ]]
    -- upvalues: l_ScreenGui_0 (copy), v41 (copy)
    l_ScreenGui_0.Enabled = true;
    v41:setEnabled(true);
end);
l_UICorner_4 = function(_, v356, _) --[[ Line: 2017 ]]
    -- upvalues: l_GuiService_0 (copy), v74 (copy), v60 (copy)
    if v356 ~= Enum.UserInputState.Begin then
        return;
    elseif not l_GuiService_0.SelectedObject then
        return;
    else
        for v358 = 1, v74 do
            if v60[v358].Frame == l_GuiService_0.SelectedObject and v60[v358].Tool then
                v60[v358]:MoveToInventory();
                return;
            end;
        end;
        return;
    end;
end;
local l_l_UICorner_4_0 = l_UICorner_4 --[[ copy: 117 -> 127 ]];
l_UIStroke_0 = function() --[[ Line: 2033 ]] --[[ Name: openClose ]]
    -- upvalues: v64 (copy), v49 (ref), v91 (copy), v48 (ref), v74 (copy), v60 (copy), v72 (ref), v39 (copy), l_UserInputService_0 (copy), v322 (copy), l_Frame_2 (copy), l_ContextActionService_0 (copy), l_l_UICorner_4_0 (copy), v9 (copy)
    if not next(v64) then
        v49.Visible = not v49.Visible;
        local l_Visible_2 = v49.Visible;
        v91();
        v48.Active = not v48.Active;
        for v361 = 1, v74 do
            v60[v361]:SetClickability(not l_Visible_2);
        end;
    end;
    if v49.Visible then
        if v72 then
            if v39[l_UserInputService_0:GetLastInputType()] then
                v322();
                l_Frame_2.Visible = not l_UserInputService_0.VREnabled;
            end;
            enableGamepadInventoryControl();
        end;
    else
        if v72 then
            l_Frame_2.Visible = false;
        end;
        disableGamepadInventoryControl();
    end;
    if v49.Visible then
        l_ContextActionService_0:BindAction("BackpackRemoveSlot", l_l_UICorner_4_0, false, Enum.KeyCode.ButtonX);
    else
        l_ContextActionService_0:UnbindAction("BackpackRemoveSlot");
    end;
    v9.IsOpen = v49.Visible;
    v9.StateChanged:Fire(v49.Visible);
end;
l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
v9.OpenClose = l_UIStroke_0;
while not l_LocalPlayer_0 do
    task.wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
l_LocalPlayer_0.CharacterAdded:Connect(v243);
if l_LocalPlayer_0.Character then
    v243(l_LocalPlayer_0.Character);
end;
l_UserInputService_0.InputBegan:Connect(v249);
l_UserInputService_0.TextBoxFocused:Connect(function() --[[ Line: 2096 ]]
    -- upvalues: v69 (ref)
    v69 = true;
end);
l_UserInputService_0.TextBoxFocusReleased:Connect(function() --[[ Line: 2099 ]]
    -- upvalues: v69 (ref)
    v69 = false;
end);
v63[l_Value_0] = function() --[[ Line: 2104 ]]
    -- upvalues: v66 (ref), l_Humanoid_0 (ref), v62 (copy)
    if v66 and l_Humanoid_0 then
        l_Humanoid_0:UnequipTools();
        if v66 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
    end;
end;
l_UserInputService_0.LastInputTypeChanged:Connect(v258);
v258();
if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
    gamepadConnected();
end;
l_UserInputService_0.GamepadConnected:Connect(function(v362) --[[ Line: 2118 ]]
    if v362 == Enum.UserInputType.Gamepad1 then
        gamepadConnected();
    end;
end);
l_UserInputService_0.GamepadDisconnected:Connect(function(v363) --[[ Line: 2123 ]]
    if v363 == Enum.UserInputType.Gamepad1 then
        gamepadDisconnected();
    end;
end);
v9.SetBackpackEnabled = function(_, v365) --[[ Line: 2131 ]] --[[ Name: SetBackpackEnabled ]]
    -- upvalues: v40 (ref)
    v40 = v365;
end;
v9.IsOpened = function(_) --[[ Line: 2136 ]] --[[ Name: IsOpened ]]
    -- upvalues: v9 (copy)
    return v9.IsOpen;
end;
v9.GetBackpackEnabled = function(_) --[[ Line: 2141 ]] --[[ Name: GetBackpackEnabled ]]
    -- upvalues: v40 (ref)
    return v40;
end;
v9.GetStateChangedEvent = function(_) --[[ Line: 2146 ]] --[[ Name: GetStateChangedEvent ]]
    -- upvalues: v9 (copy)
    return v9.StateChanged;
end;
l_RunService_0.Heartbeat:Connect(function() --[[ Line: 2151 ]]
    -- upvalues: v40 (ref), l_StarterGui_0 (copy), v68 (ref), v47 (ref), v65 (ref), v44 (ref), l_ContextActionService_0 (copy), v56 (ref)
    local v369 = v40 and l_StarterGui_0:GetCore("TopbarEnabled");
    v68 = v369;
    v47.Visible = v369;
    if v369 then
        if v65 >= 1 and v68 and not v44 then
            v44 = true;
            l_ContextActionService_0:BindAction("BackpackHotbarEquip", v56, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            return;
        end;
    else
        disableGamepadInventoryControl();
        v44 = false;
        l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
    end;
end);
l_UICorner_4 = function() --[[ Line: 2156 ]] --[[ Name: OnPreferredTransparencyChanged ]]
    -- upvalues: l_GuiService_0 (copy), v15 (ref), v14 (copy), v49 (ref), v20 (ref), v19 (copy), v60 (copy), v30 (ref), l_Frame_4 (copy)
    local l_PreferredTransparency_0 = l_GuiService_0.PreferredTransparency;
    v15 = v14 * l_PreferredTransparency_0;
    v49.BackgroundTransparency = v15;
    v20 = v19 * l_PreferredTransparency_0;
    for _, v372 in ipairs(v60) do
        v372.Frame.BackgroundTransparency = v20;
    end;
    v30 = l_PreferredTransparency_0 * 0.2;
    l_Frame_4.BackgroundTransparency = v30;
end;
l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(l_UICorner_4);
return v9;