--[[
    Script: ReplicatedStorage.Packages.Freeze.List.update
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:27
-- Luau version 6, Types version 3
-- Time taken: 0.000361 seconds

local updateIn_upvr = require(script.Parent.updateIn)
return function(arg1, arg2, arg3, arg4) -- Line 24, Named "update"
	--[[ Upvalues[1]:
		[1]: updateIn_upvr (readonly)
	]]
	local module = {}
	module[1] = arg2
	return updateIn_upvr(arg1, module, arg3, arg4)
end