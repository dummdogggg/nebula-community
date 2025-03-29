--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.SoftShutdownUI
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:28
-- Luau version 6, Types version 3
-- Time taken: 0.006778 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local var1_result1_upvr_5 = any_load_result1("BasicPane")
local setmetatable_result1_upvr = setmetatable({}, var1_result1_upvr_5)
setmetatable_result1_upvr.ClassName = "SoftShutdownUI"
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
local var1_result1_upvr_2 = any_load_result1("SpringObject")
local Workspace_upvr = game:GetService("Workspace")
function setmetatable_result1_upvr.new() -- Line 20
	--[[ Upvalues[4]:
		[1]: var1_result1_upvr_5 (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: var1_result1_upvr_2 (readonly)
		[4]: Workspace_upvr (readonly)
	]]
	local setmetatable_result1_upvr_2 = setmetatable(var1_result1_upvr_5.new(), setmetatable_result1_upvr)
	setmetatable_result1_upvr_2._title = Instance.new("StringValue")
	setmetatable_result1_upvr_2._title.Value = ""
	setmetatable_result1_upvr_2._maid:GiveTask(setmetatable_result1_upvr_2._title)
	setmetatable_result1_upvr_2._subtitle = Instance.new("StringValue")
	setmetatable_result1_upvr_2._subtitle.Value = ""
	setmetatable_result1_upvr_2._maid:GiveTask(setmetatable_result1_upvr_2._subtitle)
	setmetatable_result1_upvr_2._percentVisible = var1_result1_upvr_2.new(0, 40)
	setmetatable_result1_upvr_2._maid:GiveTask(setmetatable_result1_upvr_2._percentVisible)
	setmetatable_result1_upvr_2._maid:GiveTask(setmetatable_result1_upvr_2.VisibleChanged:Connect(function(arg1, arg2) -- Line 34
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr_2 (readonly)
		]]
		local var8 = setmetatable_result1_upvr_2
		if arg1 then
			var8 = 1
		else
			var8 = 0
		end
		var8._percentVisible.t = var8
		if arg2 then
			setmetatable_result1_upvr_2._percentVisible.p = setmetatable_result1_upvr_2._percentVisible.t
			setmetatable_result1_upvr_2._percentVisible.v = 0
		end
	end))
	setmetatable_result1_upvr_2._blur = Instance.new("BlurEffect")
	setmetatable_result1_upvr_2._blur.Name = "SoftShutdownBlur"
	setmetatable_result1_upvr_2._blur.Enabled = false
	setmetatable_result1_upvr_2._blur.Size = 0
	setmetatable_result1_upvr_2._blur.Parent = Workspace_upvr.CurrentCamera
	setmetatable_result1_upvr_2._maid:GiveTask(setmetatable_result1_upvr_2._blur)
	setmetatable_result1_upvr_2._maid:GiveTask(setmetatable_result1_upvr_2:_render():Subscribe(function(arg1) -- Line 49
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr_2 (readonly)
		]]
		setmetatable_result1_upvr_2.Gui = arg1
	end))
	return setmetatable_result1_upvr_2
end
function setmetatable_result1_upvr.SetTitle(arg1, arg2) -- Line 56
	arg1._title.Value = arg2
end
function setmetatable_result1_upvr.SetSubtitle(arg1, arg2) -- Line 60
	arg1._subtitle.Value = arg2
end
local var1_result1_upvr_3 = any_load_result1("Blend")
local var1_result1_upvr = any_load_result1("Math")
local var1_result1_upvr_4 = any_load_result1("Rx")
local RunService_upvr = game:GetService("RunService")
function setmetatable_result1_upvr._render(arg1) -- Line 64
	--[[ Upvalues[4]:
		[1]: var1_result1_upvr_3 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: var1_result1_upvr_4 (readonly)
		[4]: RunService_upvr (readonly)
	]]
	local any_ObserveRenderStepped_result1 = arg1._percentVisible:ObserveRenderStepped()
	local any_Computed_result1 = var1_result1_upvr_3.Computed(any_ObserveRenderStepped_result1, function(arg1_2) -- Line 66
		return 1 - arg1_2
	end)
	local Color3_new_result1_2 = Color3.new(0, 0, 0)
	local Color3_new_result1 = Color3.new(0.9, 0.9, 0.9)
	arg1._maid:GiveTask(any_ObserveRenderStepped_result1:Subscribe(function(arg1_3) -- Line 72
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1._blur.Size = arg1_3 * 30
		local var20 = arg1
		if 0 >= arg1_3 then
			var20 = false
		else
			var20 = true
		end
		var20._blur.Enabled = var20
	end))
	return var1_result1_upvr_3.New("Frame")({
		Name = "SoftShutdownUI";
		Size = UDim2.new(1, 0, 1, 0);
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.fromScale(0.5, 0.5);
		Active = var1_result1_upvr_3.Computed(any_ObserveRenderStepped_result1, function(arg1_4) -- Line 82
			local var23
			if 0 >= arg1_4 then
				var23 = false
			else
				var23 = true
			end
			return var23
		end);
		Visible = var1_result1_upvr_3.Computed(any_ObserveRenderStepped_result1, function(arg1_5) -- Line 85
			local var25
			if 0 >= arg1_5 then
				var25 = false
			else
				var25 = true
			end
			return var25
		end);
		BackgroundColor3 = Color3_new_result1_2;
		BackgroundTransparency = var1_result1_upvr_3.Computed(any_ObserveRenderStepped_result1, function(arg1_6) -- Line 89
			--[[ Upvalues[1]:
				[1]: var1_result1_upvr (copied, readonly)
			]]
			return var1_result1_upvr.map(arg1_6, 0, 1, 1, 0.4)
		end);
		[var1_result1_upvr_3.Children] = {var1_result1_upvr_3.New("UIPadding")({
			PaddingLeft = UDim.new(0, 20);
			PaddingRight = UDim.new(0, 20);
			PaddingTop = UDim.new(0, 20);
			PaddingBottom = UDim.new(0, 20);
		}), var1_result1_upvr_3.New("Frame")({
			Name = "ContentContainer";
			Size = UDim2.new(1, 0, 1, 0);
			AnchorPoint = Vector2.new(0.5, 0.5);
			Position = UDim2.fromScale(0.5, 0.5);
			BackgroundTransparency = 1;
			[var1_result1_upvr_3.Children] = {var1_result1_upvr_3.New("UIScale")({
				Scale = var1_result1_upvr_3.Computed(any_ObserveRenderStepped_result1, function(arg1_7) -- Line 110
					return 0.7 + 0.3 * arg1_7
				end);
			}), var1_result1_upvr_3.New("Frame")({
				Name = "ImageLabelContainer";
				Size = UDim2.new(0, 80, 0, 80);
				BackgroundTransparency = 1;
				LayoutOrder = 1;
				[var1_result1_upvr_3.Children] = {var1_result1_upvr_3.New("ImageLabel")({
					Size = UDim2.new(1, 0, 1, 0);
					ImageTransparency = any_Computed_result1;
					BackgroundTransparency = 1;
					Image = "rbxassetid://6031302916";
				})};
			}), var1_result1_upvr_3.New("Frame")({
				Name = "LabelContainer";
				Size = UDim2.new(1, 0, 0, 80);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 1;
				LayoutOrder = 2;
				[var1_result1_upvr_3.Children] = {var1_result1_upvr_3.New("TextLabel")({
					Name = "TitleLabel";
					BackgroundTransparency = 1;
					Position = UDim2.fromScale(0.5, 0);
					Size = UDim2.new(1, 0, 0.6, 0);
					AnchorPoint = Vector2.new(0.5, 0);
					Text = arg1._title;
					Font = Enum.Font.SourceSansBold;
					TextTransparency = any_Computed_result1;
					TextColor3 = Color3_new_result1;
					LayoutOrder = 1;
					TextScaled = true;
				}), var1_result1_upvr_3.New("TextLabel")({
					Name = "SubtitleLabel";
					BackgroundTransparency = 1;
					Position = UDim2.fromScale(0.5, 1);
					Size = UDim2.new(1, 0, 0.3, 0);
					AnchorPoint = Vector2.new(0.5, 1);
					Text = arg1._subtitle;
					Font = Enum.Font.SourceSansLight;
					TextTransparency = any_Computed_result1;
					TextColor3 = Color3_new_result1;
					LayoutOrder = 2;
					TextScaled = true;
				}), var1_result1_upvr_3.New("UIAspectRatioConstraint")({
					AspectRatio = 5;
				})};
			}), var1_result1_upvr_3.New("Frame")({
				Name = "Spacer";
				BackgroundTransparency = 1;
				Size = UDim2.new(0, 0, 0, 50);
				LayoutOrder = 3;
			}), var1_result1_upvr_3.New("Frame")({
				Name = "LoadingLabel";
				Position = UDim2.fromScale(0.5, 0.5);
				AnchorPoint = Vector2.new(0.5, 0.5);
				LayoutOrder = 4;
				Size = UDim2.fromScale(0.25, 0.25);
				BackgroundTransparency = 1;
				[var1_result1_upvr_3.Children] = {var1_result1_upvr_3.New("Frame")({
					Name = "RobloxLogo";
					Size = UDim2.new(1, 0, 1, 0);
					BackgroundColor3 = Color3_new_result1;
					AnchorPoint = Vector2.new(0.5, 0.5);
					Position = UDim2.fromScale(0.5, 0.5);
					BackgroundTransparency = any_Computed_result1;
					Rotation = var1_result1_upvr_4.fromSignal(RunService_upvr.RenderStepped):Pipe({var1_result1_upvr_4.map(function() -- Line 199
						local var47 = tick() * math.pi * 1.5
						if 0 < math.sin(var47) then
							return (math.sin(var47 - (math.pi/2)) + 1) / 2 * 360 + 15
						end
						return 15
					end)});
					[var1_result1_upvr_3.Children] = {var1_result1_upvr_3.New("Frame")({
						BackgroundColor3 = Color3_new_result1_2;
						Size = UDim2.fromScale(0.2, 0.2);
						AnchorPoint = Vector2.new(0.5, 0.5);
						Position = UDim2.fromScale(0.5, 0.5);
						BackgroundTransparency = any_Computed_result1;
					})};
				}), var1_result1_upvr_3.New("UIAspectRatioConstraint")({
					AspectRatio = 1;
				}), var1_result1_upvr_3.New("UISizeConstraint")({
					MaxSize = Vector2.new(math.huge, 50);
				})};
			}), var1_result1_upvr_3.New("UIListLayout")({
				FillDirection = Enum.FillDirection.Vertical;
				SortOrder = Enum.SortOrder.LayoutOrder;
				HorizontalAlignment = Enum.HorizontalAlignment.Center;
				VerticalAlignment = Enum.VerticalAlignment.Center;
				Padding = UDim.new(0, 10);
			})};
		})};
	})
end
return setmetatable_result1_upvr