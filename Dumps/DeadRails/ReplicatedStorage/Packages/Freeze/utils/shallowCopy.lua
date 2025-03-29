--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.shallowCopy
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:00
-- Luau version 6, Types version 3
-- Time taken: 0.000506 seconds

local isImmutable_upvr = require(script.Parent.isImmutable)
return function(arg1) -- Line 4
	--[[ Upvalues[1]:
		[1]: isImmutable_upvr (readonly)
	]]
	if isImmutable_upvr(arg1) then
		return arg1:clone()
	end
	return table.clone(arg1)
end