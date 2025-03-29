--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateCFrame
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:06
-- Luau version 6, Types version 3
-- Time taken: 0.000493 seconds

local validateVector3_upvr = require(script.Parent.validateVector3)
return function(arg1) -- Line 3, Named "validateCFrame"
	--[[ Upvalues[1]:
		[1]: validateVector3_upvr (readonly)
	]]
	if typeof(arg1) ~= "CFrame" then
		return false
	end
	if not validateVector3_upvr(arg1.Position) then
		return false
	end
	if not validateVector3_upvr(arg1.LookVector) then
		return false
	end
	return true
end