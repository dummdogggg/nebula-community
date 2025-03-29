--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.1foreverhd_topbarplus@3.0.2.topbarplus.Elements.Selection
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:21
-- Luau version 6, Types version 3
-- Time taken: 0.001072 seconds

return function(arg1) -- Line 1
	local Frame = Instance.new("Frame")
	Frame.Name = "SelectionContainer"
	Frame.Visible = false
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Selection"
	Frame_upvr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr.BackgroundTransparency = 1
	Frame_upvr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.Parent = Frame
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Name = "UIStroke"
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = 3
	UIStroke.Parent = Frame_upvr
	local UIGradient_upvr = Instance.new("UIGradient")
	UIGradient_upvr.Name = "SelectionGradient"
	UIGradient_upvr.Parent = UIStroke
	local UICorner = Instance.new("UICorner")
	UICorner:SetAttribute("Collective", "IconCorners")
	UICorner.Name = "UICorner"
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Frame_upvr
	local var7_upvw = 1
	Frame_upvr:GetAttributeChangedSignal("RotationSpeed"):Connect(function() -- Line 37
		--[[ Upvalues[2]:
			[1]: var7_upvw (read and write)
			[2]: Frame_upvr (readonly)
		]]
		var7_upvw = Frame_upvr:GetAttribute("RotationSpeed")
	end)
	local GuiService_upvr = game:GetService("GuiService")
	game:GetService("RunService").Heartbeat:Connect(function() -- Line 40
		--[[ Upvalues[3]:
			[1]: GuiService_upvr (readonly)
			[2]: UIGradient_upvr (readonly)
			[3]: var7_upvw (read and write)
		]]
		if not GuiService_upvr.SelectedObject then
		else
			UIGradient_upvr.Rotation = os.clock() * var7_upvw * 100 % 360
		end
	end)
	return Frame
end