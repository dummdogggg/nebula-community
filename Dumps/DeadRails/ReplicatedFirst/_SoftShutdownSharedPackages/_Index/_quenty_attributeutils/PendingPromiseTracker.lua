--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.PendingPromiseTracker
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:14
-- Luau version 6, Types version 3
-- Time taken: 0.000950 seconds

local module_2_upvr = {
	ClassName = "PendingPromiseTracker";
}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new() -- Line 10
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_2_upvr)
	setmetatable_result1._pendingPromises = {}
	return setmetatable_result1
end
function module_2_upvr.Add(arg1, arg2) -- Line 18
	if arg2:IsPending() then
		arg1._pendingPromises[arg2] = true
		arg2:Finally(function() -- Line 21
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			arg1._pendingPromises[arg2] = nil
		end)
	end
end
function module_2_upvr.GetAll(arg1) -- Line 27
	local module = {}
	for i, _ in pairs(arg1._pendingPromises) do
		table.insert(module, i)
	end
	return module
end
return module_2_upvr