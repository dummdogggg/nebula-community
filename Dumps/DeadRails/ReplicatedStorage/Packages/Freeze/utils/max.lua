--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.max
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:34
-- Luau version 6, Types version 3
-- Time taken: 0.000706 seconds

local function var1_upvr(arg1, arg2) -- Line 2
	if arg2 >= arg1 then
	else
	end
	return true
end
return function(arg1, arg2) -- Line 6
	--[[ Upvalues[1]:
		[1]: var1_upvr (readonly)
	]]
	if arg2 == nil then
	else
	end
	local var7
	for i, v in arg1 do
		if var7 == nil or arg2(var7, v) == false then
		end
	end
	return v, i
end