--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.BasicPaneUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:15
-- Luau version 6, Types version 3
-- Time taken: 0.001620 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local var1_result1_upvr = any_load_result1("Rx")
local var1_result1_upvr_3 = any_load_result1("BasicPane")
local module_upvr = {}
local var1_result1_upvr_2 = any_load_result1("Observable")
local var1_result1_upvr_4 = any_load_result1("Maid")
function module_upvr.observeVisible(arg1) -- Line 19
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_3 (readonly)
		[2]: var1_result1_upvr_2 (readonly)
		[3]: var1_result1_upvr_4 (readonly)
	]]
	assert(var1_result1_upvr_3.isBasicPane(arg1), "Bad BasicPane")
	return var1_result1_upvr_2.new(function(arg1_2) -- Line 22
		--[[ Upvalues[2]:
			[1]: var1_result1_upvr_4 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local any_new_result1 = var1_result1_upvr_4.new()
		any_new_result1:GiveTask(arg1.VisibleChanged:Connect(function(arg1_3) -- Line 25
			--[[ Upvalues[1]:
				[1]: arg1_2 (readonly)
			]]
			arg1_2:Fire(arg1_3)
		end))
		arg1_2:Fire(arg1:IsVisible())
		return any_new_result1
	end)
end
function module_upvr.observePercentVisible(arg1) -- Line 39
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_3 (readonly)
		[2]: module_upvr (readonly)
		[3]: var1_result1_upvr (readonly)
	]]
	assert(var1_result1_upvr_3.isBasicPane(arg1), "Bad BasicPane")
	return module_upvr.observeVisible(arg1):Pipe({var1_result1_upvr.map(function(arg1_4) -- Line 43
		if arg1_4 then
			return 1
		end
		return 0
	end), var1_result1_upvr.startWith({0})})
end
module_upvr.toTransparency = var1_result1_upvr.map(function(arg1) -- Line 58
	return 1 - arg1
end)
function module_upvr.observeShow(arg1) -- Line 67
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: var1_result1_upvr (readonly)
	]]
	return module_upvr.observeVisible(arg1):Pipe({var1_result1_upvr.where(function(arg1_5) -- Line 69
		return arg1_5
	end)})
end
return module_upvr