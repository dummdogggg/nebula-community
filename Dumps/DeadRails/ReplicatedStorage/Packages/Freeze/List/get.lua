--[[
    Script: ReplicatedStorage.Packages.Freeze.List.get
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:39
-- Luau version 6, Types version 3
-- Time taken: 0.000435 seconds

return function(arg1, arg2, arg3) -- Line 21, Named "get"
	local var1
	if type(arg2) == "number" and var1 < 0 then
		var1 = (#arg1) + (var1 + 1)
	end
	return arg1[var1] or arg3
end