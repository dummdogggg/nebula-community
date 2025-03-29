--[[
    Script: ReplicatedStorage.Shared.Utils.retryAsync
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:19
-- Luau version 6, Types version 3
-- Time taken: 0.001230 seconds

return function(arg1, arg2, arg3, arg4, arg5) -- Line 13, Named "retryAsync"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1
	if not var1 then
		var1 = pcall
	end
	local const_number = 0
	while const_number < arg2 do
		local var3 = const_number + 1
		local var5 = {var1(arg1)}
		local popped = table.remove(var5, 1)
		local var7 = var5
		if popped then break end
		if var3 < arg2 then
			task.wait((arg3 or 0) + (arg4 or 0) ^ var3)
		end
	end
	if popped then
		return popped, table.unpack(var7)
	end
	if popped or not var7[1] then
	end
	return popped, nil
end