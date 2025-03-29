--[[
    Script: ReplicatedStorage.Packages.FastCastRedux.TypeMarshaller
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:30
-- Luau version 6, Types version 3
-- Time taken: 0.000508 seconds

local typeof_upvr = typeof
return function(arg1) -- Line 5, Named "typeof"
	--[[ Upvalues[1]:
		[1]: typeof_upvr (readonly)
	]]
	local typeof_upvr_result1 = typeof_upvr(arg1)
	if typeof_upvr_result1 ~= "table" then
		return typeof_upvr_result1
	end
	local getmetatable_result1 = getmetatable(arg1)
	if typeof_upvr(getmetatable_result1) ~= "table" then
		return typeof_upvr_result1
	end
	local __type = getmetatable_result1.__type
	if __type == nil then
		return typeof_upvr_result1
	end
	return __type
end