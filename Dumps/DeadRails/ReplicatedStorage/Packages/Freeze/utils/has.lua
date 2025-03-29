--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.has
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:12
-- Luau version 6, Types version 3
-- Time taken: 0.000669 seconds

local isImmutable_upvr = require(script.Parent.isImmutable)
local isDataStructure_upvr = require(script.Parent.isDataStructure)
return function(arg1, arg2) -- Line 5
	--[[ Upvalues[2]:
		[1]: isImmutable_upvr (readonly)
		[2]: isDataStructure_upvr (readonly)
	]]
	if isImmutable_upvr(arg1) then
		return arg1:has(arg2)
	end
	local isDataStructure_upvr_result1 = isDataStructure_upvr(arg1)
	if isDataStructure_upvr_result1 then
		if arg1[arg2] == nil then
			isDataStructure_upvr_result1 = false
		else
			isDataStructure_upvr_result1 = true
		end
	end
	return isDataStructure_upvr_result1
end