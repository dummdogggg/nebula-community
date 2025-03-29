--[[
    Script: ReplicatedStorage.Packages.Freeze.List.set
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:16
-- Luau version 6, Types version 3
-- Time taken: 0.000432 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1, arg2, arg3) -- Line 17, Named "set"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	if arg1[arg2] == arg3 then
		return arg1
	end
	local clone = table.clone(arg1)
	clone[arg2] = arg3
	return maybeFreeze_upvr(clone)
end