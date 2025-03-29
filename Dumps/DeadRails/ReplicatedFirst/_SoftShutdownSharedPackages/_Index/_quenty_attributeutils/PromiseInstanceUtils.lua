--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.PromiseInstanceUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:13
-- Luau version 6, Types version 3
-- Time taken: 0.001155 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local module = {}
local var1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("Promise")
function module.promiseRemoved(arg1) -- Line 16
	--[[ Upvalues[2]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
	]]
	assert(arg1:IsDescendantOf(game))
	local any_new_result1_upvr_2 = var1_result1_upvr_2.new()
	local any_new_result1_upvr = var1_result1_upvr.new()
	any_new_result1_upvr_2:GiveTask(arg1.AncestryChanged:Connect(function(arg1_2, arg2) -- Line 23
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		if not arg2 then
			any_new_result1_upvr:Resolve()
		end
	end))
	any_new_result1_upvr:Finally(function() -- Line 29
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr_2 (readonly)
		]]
		any_new_result1_upvr_2:DoCleaning()
	end)
	return any_new_result1_upvr
end
return module