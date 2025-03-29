--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.ObservableSubscriptionTable
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:29
-- Luau version 6, Types version 3
-- Time taken: 0.002354 seconds

local module_upvr = {
	ClassName = "ObservableSubscriptionTable";
}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 15
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1._subMap = {}
	return setmetatable_result1
end
function module_upvr.Fire(arg1, arg2, ...) -- Line 28
	local var7
	if arg2 == nil then
		var7 = false
	else
		var7 = true
	end
	assert(var7, "Bad key")
	var7 = arg1._subMap
	local var8 = var7[arg2]
	if not var8 then
	else
		var7 = pairs(table.clone(var8))
		for _, v_2 in pairs(table.clone(var8)) do
			task.spawn(v_2.Fire, v_2, ...)
		end
	end
end
function module_upvr.Complete(arg1, arg2, ...) -- Line 42
	local var14 = arg1._subMap[arg2]
	if not var14 then
	else
		arg1._subMap[arg2] = nil
		for _, v_3 in pairs(table.clone(var14)) do
			task.spawn(v_3.Complete, v_3, ...)
		end
	end
end
local var18_upvr = require(script.Parent.loader).load(script)("Observable")
function module_upvr.Observe(arg1, arg2) -- Line 61
	--[[ Upvalues[1]:
		[1]: var18_upvr (readonly)
	]]
	if arg2 == nil then
	else
	end
	assert(true, "Bad key")
	return var18_upvr.new(function(arg1_2) -- Line 64
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		if not arg1._subMap[arg2] then
			local tbl = {}
			tbl[1] = arg1_2
			arg1._subMap[arg2] = tbl
		else
			table.insert(arg1._subMap[arg2], arg1_2)
		end
		return function() -- Line 71
			--[[ Upvalues[3]:
				[1]: arg1 (copied, readonly)
				[2]: arg2 (copied, readonly)
				[3]: arg1_2 (readonly)
			]]
			if not arg1._subMap[arg2] then
			else
				local var22 = arg1._subMap[arg2]
				local table_find_result1 = table.find(var22, arg1_2)
				if not table_find_result1 then return end
				table.remove(var22, table_find_result1)
				if #var22 == 0 then
					arg1._subMap[arg2] = nil
				end
				if arg1_2:IsPending() then
					task.spawn(function() -- Line 89
						--[[ Upvalues[1]:
							[1]: arg1_2 (copied, readonly)
						]]
						arg1_2:Complete()
					end)
				end
			end
		end
	end)
end
function module_upvr.Destroy(arg1) -- Line 100
	while next(arg1._subMap) do
		local next_result1, next_result2 = next(arg1._subMap)
		arg1._subMap[next_result1] = nil
		for _, v_upvr in pairs(next_result2) do
			if v_upvr:IsPending() then
				task.spawn(function() -- Line 107
					--[[ Upvalues[1]:
						[1]: v_upvr (readonly)
					]]
					v_upvr:Complete()
				end)
			end
		end
	end
end
return module_upvr