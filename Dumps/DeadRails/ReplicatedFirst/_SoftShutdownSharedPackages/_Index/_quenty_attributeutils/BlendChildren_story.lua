--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.BlendChildren.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:09
-- Luau version 6, Types version 3
-- Time taken: 0.002870 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local any_load_result1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("Blend")
local any_load_result1_result1_upvr = any_load_result1("ValueObject")
local any_load_result1_result1_upvr_3 = any_load_result1("Rx")
local RunService_upvr = game:GetService("RunService")
return function(arg1) -- Line 14
	--[[ Upvalues[5]:
		[1]: any_load_result1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: any_load_result1_result1_upvr (readonly)
		[4]: any_load_result1_result1_upvr_3 (readonly)
		[5]: RunService_upvr (readonly)
	]]
	local any_new_result1_upvr_2 = any_load_result1_result1_upvr_2.new()
	local any_State_result1_upvr = var1_result1_upvr.State(0)
	local any_State_result1_upvr_2 = var1_result1_upvr.State('a')
	any_new_result1_upvr_2:GiveTask(any_State_result1_upvr_2)
	local any_new_result1_upvr = any_load_result1_result1_upvr.new()
	any_new_result1_upvr.Value = var1_result1_upvr.New("UICorner")({
		CornerRadius = UDim.new(0, 5);
	})
	any_new_result1_upvr_2:GiveTask(any_new_result1_upvr)
	task.delay(1, function() -- Line 28
		--[[ Upvalues[2]:
			[1]: any_new_result1_upvr (readonly)
			[2]: var1_result1_upvr (copied, readonly)
		]]
		if any_new_result1_upvr.Destroy then
			any_new_result1_upvr.Value = var1_result1_upvr.New("UICorner")({
				CornerRadius = UDim.new(0, 25);
			})
		end
	end)
	local tbl = {}
	tbl.Parent = arg1
	tbl.Size = var1_result1_upvr.Computed(any_State_result1_upvr, function(arg1_2) -- Line 38
		return UDim2.new(0, arg1_2 * 100, 0, 50)
	end)
	tbl.BackgroundTransparency = var1_result1_upvr.Computed(any_State_result1_upvr, function(arg1_3) -- Line 41
		return 1 - arg1_3
	end)
	tbl.Position = UDim2.new(0.5, 0, 0.5, 0)
	tbl.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl.Text = any_State_result1_upvr_2
	tbl.TextScaled = true
	tbl[var1_result1_upvr.Children] = {any_new_result1_upvr, any_load_result1_result1_upvr_3.NEVER, any_load_result1_result1_upvr_3.EMPTY, {var1_result1_upvr.Single(var1_result1_upvr.Computed(any_State_result1_upvr, function(arg1_4) -- Line 56
		--[[ Upvalues[1]:
			[1]: var1_result1_upvr (copied, readonly)
		]]
		if arg1_4 <= 0.5 then
			return nil
		end
		return var1_result1_upvr.New("Frame")({
			Size = UDim2.new(0, 100, 0, 100);
			BackgroundTransparency = 0.5;
		})
	end))}, {var1_result1_upvr.Single(var1_result1_upvr.Computed(any_State_result1_upvr, function(arg1_5) -- Line 70
		--[[ Upvalues[1]:
			[1]: var1_result1_upvr (copied, readonly)
		]]
		local module = {}
		for i = 0, arg1_5 * 100, 10 do
			table.insert(module, var1_result1_upvr.New("Frame")({
				Size = UDim2.new(0, 8, 0, 8);
				Position = UDim2.new(0, i, 0.9, 0);
				AnchorPoint = Vector2.new(0.5, 0.5);
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(i / 100, 0.5, 0.5);
				[var1_result1_upvr.Children] = {var1_result1_upvr.New("UICorner")({
					CornerRadius = UDim.new(0.5, 5);
				})};
			}))
		end
		return module
	end))}}
	any_new_result1_upvr_2:GiveTask(var1_result1_upvr.New("TextLabel")(tbl):Subscribe())
	any_new_result1_upvr_2:GiveTask(RunService_upvr.RenderStepped:Connect(function() -- Line 97
		--[[ Upvalues[2]:
			[1]: any_State_result1_upvr_2 (readonly)
			[2]: any_State_result1_upvr (readonly)
		]]
		any_State_result1_upvr_2.Value = tostring(os.clock())
		any_State_result1_upvr.Value = (math.sin(os.clock() * math.pi * 2 / 5) + 1) / 2
	end))
	return function() -- Line 102
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_2 (readonly)
		]]
		any_new_result1_upvr_2:DoCleaning()
	end
end