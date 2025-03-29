--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.Context
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:34
-- Luau version 6, Types version 3
-- Time taken: 0.000946 seconds

return {
	new = function(arg1) -- Line 7, Named "new"
		local module = {}
		local tbl_upvr = {}
		module.__index = tbl_upvr
		if arg1 then
			for i, v in pairs(getmetatable(arg1).__index) do
				tbl_upvr[i] = v
			end
		end
		function module.__newindex(arg1_2, arg2, arg3) -- Line 18
			--[[ Upvalues[1]:
				[1]: tbl_upvr (readonly)
			]]
			local var11
			if tbl_upvr[arg2] ~= nil then
				var11 = false
			else
				var11 = true
			end
			assert(var11, string.format("Cannot reassign %s in context", tostring(arg2)))
			tbl_upvr[arg2] = arg3
		end
		return setmetatable({}, module)
	end;
}