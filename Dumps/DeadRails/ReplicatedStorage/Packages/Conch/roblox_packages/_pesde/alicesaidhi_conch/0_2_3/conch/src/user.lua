--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.user
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:43
-- Luau version 6, Types version 3
-- Time taken: 0.003251 seconds

local RunService_upvr = game:GetService("RunService")
local ._net_upvr = require("./net")
local ._state_upvr = require("./state")
local any_IsServer_result1_upvr = RunService_upvr:IsServer()
local ._constants_upvr = require("./constants")
return {
	obtain_user_key = function(arg1, arg2) -- Line 11, Named "obtain_user_key"
		if arg1 then
			return `player-{arg1.UserId}`
		end
		return `server-{arg2}`
	end;
	create_user = function(arg1) -- Line 15, Named "create_user"
		--[[ Upvalues[3]:
			[1]: any_IsServer_result1_upvr (readonly)
			[2]: ._net_upvr (readonly)
			[3]: ._state_upvr (readonly)
		]]
		local module_2 = {}
		local player_2 = arg1.player
		local var10
		if player_2 then
			var10 = `player-{player_2.UserId}`
		else
			var10 = `server-{arg1.name}`
		end
		module_2.id = var10
		var10 = arg1.name
		module_2.name = var10
		var10 = arg1.player
		module_2.player = var10
		var10 = false
		module_2.disconnected = var10
		var10 = false
		module_2.dirty = var10
		var10 = {}
		module_2.roles = var10
		var10 = any_IsServer_result1_upvr
		if var10 then
			var10 = module_2.player
			if var10 then
				var10 = ._net_upvr.server.fire_create_user
				var10(module_2.player, module_2.id, module_2.name)
			end
		end
		var10 = ._state_upvr.users
		var10[module_2.id] = module_2
		return module_2
	end;
	disconnect_user = function(arg1) -- Line 55, Named "disconnect_user"
		--[[ Upvalues[1]:
			[1]: ._state_upvr (readonly)
		]]
		if arg1.disconnected == true then
		else
			arg1.disconnected = true
			._state_upvr.users[arg1.id] = nil
		end
	end;
	has_permissions = function(arg1, ...) -- Line 38, Named "has_permissions"
		--[[ Upvalues[2]:
			[1]: ._constants_upvr (readonly)
			[2]: ._state_upvr (readonly)
		]]
		local args_list = {...}
		for _, v in arg1.roles do
			if ._constants_upvr.ADMIN_ROLE == v then
				return true
			end
			for _, v_2 in ._state_upvr.roles[v] do
				local table_find_result1_2 = table.find(args_list, v_2)
				if table_find_result1_2 then
					table.remove(args_list, table_find_result1_2)
					if #args_list == 0 then
						return true
					end
				end
			end
		end
		return false
	end;
	give_roles = function(arg1, ...) -- Line 63, Named "give_roles"
		--[[ Upvalues[2]:
			[1]: any_IsServer_result1_upvr (readonly)
			[2]: ._net_upvr (readonly)
		]]
		if arg1.disconnected then
		else
			local tbl_3 = {}
			for i_3 = 1, select('#', ...) do
				local selected_arg = select(i_3, ...)
				if not table.find(tbl_3, selected_arg) then
					table.insert(tbl_3, selected_arg)
				end
			end
			for i_4, v_3 in arg1.roles do
				if not table.find(tbl_3, v_3) then
					table.insert(tbl_3, v_3)
				end
			end
			arg1.roles = tbl_3
			if any_IsServer_result1_upvr and arg1.player then
				arg1.dirty = true
				local tbl = {}
				i_4 = arg1.id
				tbl.id = i_4
				tbl.roles = tbl_3
				._net_upvr.server.fire_update_user_roles(arg1.player, tbl)
			end
		end
	end;
	remove_roles = function(arg1, ...) -- Line 90, Named "remove_roles"
		--[[ Upvalues[2]:
			[1]: RunService_upvr (readonly)
			[2]: ._net_upvr (readonly)
		]]
		if arg1.disconnected then
		else
			local clone = table.clone(arg1.roles)
			for i_5 = #clone, 1, -1 do
				if table.find({...}, clone[i_5]) then
					clone[i_5] = clone[#clone]
					clone[#clone] = nil
				end
			end
			arg1.roles = clone
			if RunService_upvr:IsServer() and arg1.player then
				arg1.dirty = true
				i_5 = ._net_upvr
				i_5 = {}
				i_5.id = arg1.id
				i_5.roles = clone
				i_5.server.fire_update_user_roles(arg1.player, i_5)
			end
		end
	end;
}