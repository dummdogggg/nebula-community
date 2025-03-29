--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.RxValueBaseUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:59
-- Luau version 6, Types version 3
-- Time taken: 0.001014 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local var1_result1_upvr_2 = any_load_result1("RxInstanceUtils")
local var1_result1_upvr = any_load_result1("RxBrioUtils")
local module_upvr = {}
function module_upvr.observe(arg1, arg2, arg3) -- Line 24
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	warn("[RxValueBaseUtils.observe] - Deprecated since 4.0.0. Use RxValueBaseUtils.observeBrio")
	return var1_result1_upvr_2.observeLastNamedChildBrio(arg1, arg2, arg3):Pipe({var1_result1_upvr.switchMap(function(arg1_2) -- Line 29
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		return module_upvr.observeValue(arg1_2)
	end)})
end
function module_upvr.observeBrio(arg1, arg2, arg3) -- Line 43
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	return var1_result1_upvr_2.observeLastNamedChildBrio(arg1, arg2, arg3):Pipe({var1_result1_upvr.switchMapBrio(function(arg1_3) -- Line 46
		--[[ Upvalues[1]:
			[1]: module_upvr (copied, readonly)
		]]
		return module_upvr.observeValue(arg1_3)
	end)})
end
function module_upvr.observeValue(arg1) -- Line 58
	--[[ Upvalues[1]:
		[1]: var1_result1_upvr_2 (readonly)
	]]
	return var1_result1_upvr_2.observeProperty(arg1, "Value")
end
return module_upvr