--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.remove
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:43
-- Luau version 6, Types version 3
-- Time taken: 0.000866 seconds

local isDataStructure_upvr = require(script.Parent.isDataStructure)
local isImmutable_upvr = require(script.Parent.isImmutable)
local shallowCopy_upvr = require(script.Parent.shallowCopy)
return function(arg1, arg2) -- Line 6
	--[[ Upvalues[3]:
		[1]: isDataStructure_upvr (readonly)
		[2]: isImmutable_upvr (readonly)
		[3]: shallowCopy_upvr (readonly)
	]]
	if not isDataStructure_upvr(arg1) then
		error("Cannot update non-data-structure value: "..tostring(arg1))
	end
	if isImmutable_upvr(arg1) then
		if not arg1.remove then
			error("Cannot update immutable value without .remove() method: "..tostring(arg1))
		end
		return arg1:remove(arg2)
	end
	if not arg1[arg2] then
		return arg1
	end
	local var4_result1 = shallowCopy_upvr(arg1)
	if 0 < #var4_result1 then
		table.remove(arg1, arg2)
		return var4_result1
	end
	arg1[arg2] = nil
	return var4_result1
end