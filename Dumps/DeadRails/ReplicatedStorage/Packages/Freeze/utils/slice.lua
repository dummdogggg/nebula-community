--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.slice
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:35
-- Luau version 6, Types version 3
-- Time taken: 0.001107 seconds

return function(arg1, arg2, arg3) -- Line 2, Named "slice"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local len = #arg1
	local var6
	if arg2 and arg2 < 0 then
		var6 = (len) + (arg2 + 1)
	else
		var6 = arg2 or 1
		local var7
	end
	if arg3 and arg3 < 0 then
		var7 = len + arg3
	else
		var7 = arg3 or len
	end
	if var6 == 1 and var7 == #arg1 then
		return arg1
	end
	local module = {}
	for i = var6, var7 do
		module[1] = arg1[i]
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local var9
	end
	return module
end