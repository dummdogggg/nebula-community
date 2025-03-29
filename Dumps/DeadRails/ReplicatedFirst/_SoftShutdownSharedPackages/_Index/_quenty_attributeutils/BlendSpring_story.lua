--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.BlendSpring.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:35
-- Luau version 6, Types version 3
-- Time taken: 0.001705 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local var1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("Blend")
local RunService_upvr = game:GetService("RunService")
return function(arg1) -- Line 12
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: RunService_upvr (readonly)
	]]
	local any_new_result1_upvr = var1_result1_upvr_2.new()
	local BoolValue_upvr = Instance.new("BoolValue")
	BoolValue_upvr.Value = false
	local any_Spring_result1 = var1_result1_upvr.Spring(var1_result1_upvr.Computed(BoolValue_upvr, function(arg1_2) -- Line 18
		if arg1_2 then
			return 1
		end
		return 0
	end), 35)
	local tbl = {
		Size = UDim2.new(0.5, 0, 0.5, 0);
		BackgroundColor3 = Color3.new(0.9, 0.9, 0.9);
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.new(0.5, 0, 0.5, 0);
		BackgroundTransparency = var1_result1_upvr.Computed(any_Spring_result1, function(arg1_3) -- Line 22
			return 1 - arg1_3
		end);
	}
	tbl.Parent = arg1
	tbl[var1_result1_upvr.Children] = {var1_result1_upvr.New("UIScale")({
		Scale = var1_result1_upvr.Computed(any_Spring_result1, function(arg1_4) -- Line 36
			return 0.8 + 0.2 * arg1_4
		end);
	}), var1_result1_upvr.New("UICorner")({
		CornerRadius = UDim.new(0.05, 0);
	})}
	any_new_result1_upvr:GiveTask(var1_result1_upvr.New("Frame")(tbl):Subscribe())
	any_new_result1_upvr:GiveTask(RunService_upvr.RenderStepped:Connect(function() -- Line 47
		--[[ Upvalues[1]:
			[1]: BoolValue_upvr (readonly)
		]]
		local var17
		if os.clock() / 5 % 1 >= 0.5 then
			var17 = false
		else
			var17 = true
		end
		BoolValue_upvr.Value = var17
	end))
	return function() -- Line 51
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:DoCleaning()
	end
end