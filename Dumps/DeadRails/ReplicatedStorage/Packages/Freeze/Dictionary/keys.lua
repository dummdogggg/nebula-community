--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.keys
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:23
-- Luau version 6, Types version 3
-- Time taken: 0.000530 seconds

local maybeFreeze_upvr = require(script.Parent.Parent.utils.maybeFreeze)
return function(arg1) -- Line 14, Named "keys"
	--[[ Upvalues[1]:
		[1]: maybeFreeze_upvr (readonly)
	]]
	local module = {}
	for i, _ in arg1 do
		table.insert(module, i)
	end
	return maybeFreeze_upvr(module)
end