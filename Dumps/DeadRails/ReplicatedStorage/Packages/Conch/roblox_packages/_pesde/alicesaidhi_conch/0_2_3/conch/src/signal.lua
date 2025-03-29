--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.signal
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:53
-- Luau version 6, Types version 3
-- Time taken: 0.001128 seconds

return function() -- Line 4, Named "create_signal"
	local tbl_upvr = {}
	return {
		connect = function(arg1, arg2) -- Line 8, Named "connect"
			--[[ Upvalues[1]:
				[1]: tbl_upvr (readonly)
			]]
			local module_upvr = {}
			module_upvr.callback = arg2
			local var4_upvw = false
			function module_upvr.disconnect() -- Line 12
				--[[ Upvalues[3]:
					[1]: var4_upvw (read and write)
					[2]: module_upvr (readonly)
					[3]: tbl_upvr (copied, readonly)
				]]
				if var4_upvw then
				else
					var4_upvw = true
					module_upvr.disconnected = true
					local table_find_result1 = table.find(tbl_upvr, module_upvr)
					if not table_find_result1 then return end
					table.remove(tbl_upvr, table_find_result1)
				end
			end
			table.insert(tbl_upvr, module_upvr)
			return module_upvr
		end;
		fire = function(arg1, ...) -- Line 29, Named "fire"
			--[[ Upvalues[1]:
				[1]: tbl_upvr (readonly)
			]]
			for _, v in tbl_upvr do
				v.callback(...)
			end
		end;
	}
end