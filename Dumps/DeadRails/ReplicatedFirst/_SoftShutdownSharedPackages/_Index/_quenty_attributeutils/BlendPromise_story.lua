--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.BlendPromise.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:37
-- Luau version 6, Types version 3
-- Time taken: 0.003673 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local any_load_result1_result1_upvr = any_load_result1("Maid")
local any_load_result1_result1_upvr_3 = any_load_result1("Blend")
local any_load_result1_result1_upvr_2 = any_load_result1("PlayerThumbnailUtils")
local RunService_upvr = game:GetService("RunService")
return function(arg1) -- Line 13
	--[[ Upvalues[4]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_3 (readonly)
		[3]: any_load_result1_result1_upvr_2 (readonly)
		[4]: RunService_upvr (readonly)
	]]
	local any_new_result1_upvr = any_load_result1_result1_upvr.new()
	local IntValue_upvr = Instance.new("IntValue")
	IntValue_upvr.Value = 4397833
	any_new_result1_upvr:GiveTask(IntValue_upvr)
	local BoolValue_upvr = Instance.new("BoolValue")
	BoolValue_upvr.Value = false
	any_new_result1_upvr:GiveTask(BoolValue_upvr)
	local any_Spring_result1 = any_load_result1_result1_upvr_3.Spring(any_load_result1_result1_upvr_3.Computed(BoolValue_upvr, function(arg1_4) -- Line 30
		if arg1_4 then
			return 1
		end
		return 0
	end), 35)
	local any_Computed_result1 = any_load_result1_result1_upvr_3.Computed(any_Spring_result1, function(arg1_5) -- Line 33
		return 1 - arg1_5
	end)
	local tbl = {}
	tbl.Parent = arg1
	tbl.Name = "ProfileImage"
	tbl.LayoutOrder = 15
	tbl.BackgroundTransparency = 1
	tbl.Size = UDim2.new(0, 100, 0, 130)
	tbl.Position = UDim2.fromScale(0.5, 0.5)
	tbl.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl[any_load_result1_result1_upvr_3.Children] = {any_load_result1_result1_upvr_3.New("UIScale")({
		Scale = any_load_result1_result1_upvr_3.Computed(any_Spring_result1, function(arg1_6) -- Line 47
			return 0.8 + 0.2 * arg1_6
		end);
	}), any_load_result1_result1_upvr_3.New("TextLabel")({
		Size = UDim2.new(1, 0, 0, 30);
		Position = UDim2.new(0.5, 0, 1, 0);
		AnchorPoint = Vector2.new(0.5, 1);
		BackgroundTransparency = 1;
		TextTransparency = any_Computed_result1;
		TextColor3 = Color3.new(1, 1, 1);
		TextSize = 20;
		Font = Enum.Font.Gotham;
		Text = any_load_result1_result1_upvr_3.Dynamic(IntValue_upvr, function(arg1_3) -- Line 27
			--[[ Upvalues[1]:
				[1]: any_load_result1_result1_upvr_2 (copied, readonly)
			]]
			return any_load_result1_result1_upvr_2.promiseUserName(arg1_3)
		end);
	}), any_load_result1_result1_upvr_3.New("Frame")({
		Position = UDim2.new(0.5, 0, 0, 0);
		AnchorPoint = Vector2.new(0.5, 0);
		Size = UDim2.new(1, 0, 1, 0);
		BackgroundColor3 = Color3.new(0.2, 0.25, 0.2);
		BackgroundTransparency = any_Computed_result1;
		[any_load_result1_result1_upvr_3.Children] = {any_load_result1_result1_upvr_3.New("UIAspectRatioConstraint")({
			AspectRatio = 1;
		}), any_load_result1_result1_upvr_3.New("UICorner")({
			CornerRadius = UDim.new(1, 0);
		}), any_load_result1_result1_upvr_3.New("UIPadding")({
			PaddingLeft = UDim.new(0, 2);
			PaddingRight = UDim.new(0, 2);
			PaddingTop = UDim.new(0, 2);
			PaddingBottom = UDim.new(0, 2);
		}), any_load_result1_result1_upvr_3.New("ImageLabel")({
			Size = UDim2.new(1, 0, 1, 0);
			Image = any_load_result1_result1_upvr_3.Dynamic(IntValue_upvr, function(arg1_2) -- Line 24
				--[[ Upvalues[1]:
					[1]: any_load_result1_result1_upvr_2 (copied, readonly)
				]]
				return any_load_result1_result1_upvr_2.promiseUserThumbnail(arg1_2)
			end);
			BackgroundTransparency = any_Computed_result1;
			ImageTransparency = any_Computed_result1;
			BackgroundColor3 = Color3.new(0.1, 0.1, 0.1);
			[any_load_result1_result1_upvr_3.Children] = {any_load_result1_result1_upvr_3.New("UICorner")({
				CornerRadius = UDim.new(1, 0);
			})};
		})};
	})}
	any_new_result1_upvr:GiveTask(any_load_result1_result1_upvr_3.New("Frame")(tbl):Subscribe())
	any_new_result1_upvr:GiveTask(RunService_upvr.RenderStepped:Connect(function() -- Line 103
		--[[ Upvalues[1]:
			[1]: BoolValue_upvr (readonly)
		]]
		local var30
		if os.clock() / 2 % 1 >= 0.5 then
			var30 = false
		else
			var30 = true
		end
		BoolValue_upvr.Value = var30
	end))
	local var31_upvw = true
	any_new_result1_upvr:GiveTask(function() -- Line 108
		--[[ Upvalues[1]:
			[1]: var31_upvw (read and write)
		]]
		var31_upvw = false
	end)
	any_new_result1_upvr:GiveTask(BoolValue_upvr.Changed:Connect(function() -- Line 111
		--[[ Upvalues[3]:
			[1]: BoolValue_upvr (readonly)
			[2]: var31_upvw (read and write)
			[3]: IntValue_upvr (readonly)
		]]
		if not BoolValue_upvr.Value then
			task.delay(1, function() -- Line 113
				--[[ Upvalues[2]:
					[1]: var31_upvw (copied, read and write)
					[2]: IntValue_upvr (copied, readonly)
				]]
				if var31_upvw then
					IntValue_upvr.Value = Random.new():NextInteger(1, 1000000000)
				end
			end)
		end
	end))
	return function() -- Line 121
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:DoCleaning()
	end
end