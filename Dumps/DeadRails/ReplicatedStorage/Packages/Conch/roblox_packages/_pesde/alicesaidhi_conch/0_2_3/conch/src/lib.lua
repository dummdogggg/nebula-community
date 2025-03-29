--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.lib
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:24
-- Luau version 6, Types version 3
-- Time taken: 0.006096 seconds

local RunService_upvr = game:GetService("RunService")
local ._console_upvr = require("./console")
local ._context = require("./context")
local ._net_upvr = require("./net")
local ._state_upvr = require("./state")
local ._user_upvr = require("./user")
local any_IsServer_result1_upvr = RunService_upvr:IsServer()
local any_IsClient_result1_upvr = RunService_upvr:IsClient()
local has_permissions_upvr = ._user_upvr.has_permissions
local create_command_context_upvr = ._context.create_command_context
local function _(arg1, arg2) -- Line 27, Named "FOREACH"
	for i, v in arg1 do
		arg2(v, i)
	end
end
local function initiate_user_replication_upvr(arg1) -- Line 39, Named "initiate_user_replication"
	--[[ Upvalues[3]:
		[1]: ._console_upvr (readonly)
		[2]: has_permissions_upvr (readonly)
		[3]: ._net_upvr (readonly)
	]]
	for _, v_2 in ._console_upvr.console.commands do
		if has_permissions_upvr(arg1, unpack(v_2.permissions)) then
			._net_upvr.server.fire_register_command(arg1.player, {
				name = v_2.name;
				permissions = v_2.permissions;
			})
		end
	end
end
local create_user_upvr = ._user_upvr.create_user
local function get_user_upvr(arg1) -- Line 52, Named "get_user"
	--[[ Upvalues[4]:
		[1]: ._user_upvr (readonly)
		[2]: ._state_upvr (readonly)
		[3]: create_user_upvr (readonly)
		[4]: initiate_user_replication_upvr (readonly)
	]]
	if typeof(arg1) == "string" then
		local any_obtain_user_key_result1 = ._user_upvr.obtain_user_key(false, arg1)
		local var20 = ._state_upvr.users[any_obtain_user_key_result1]
		if not var20 then
			return create_user_upvr({
				name = any_obtain_user_key_result1;
				player = false;
			})
		end
		return var20
	end
	local var22 = ._state_upvr.users[._user_upvr.obtain_user_key(arg1, arg1.DisplayName)]
	if not var22 then
		local tbl = {
			name = arg1.DisplayName;
		}
		tbl.player = arg1
		local create_user_upvr_result1 = create_user_upvr(tbl)
		initiate_user_replication_upvr(create_user_upvr_result1)
		return create_user_upvr_result1
	end
	return var22
end
local disconnect_user_upvr = ._user_upvr.disconnect_user
local function disconnect_user_for_player_upvr(arg1) -- Line 74, Named "disconnect_user_for_player"
	--[[ Upvalues[3]:
		[1]: ._user_upvr (readonly)
		[2]: ._state_upvr (readonly)
		[3]: disconnect_user_upvr (readonly)
	]]
	local var26 = ._state_upvr.users[._user_upvr.obtain_user_key(arg1, arg1.DisplayName)]
	if not var26 then
	else
		disconnect_user_upvr(var26)
	end
end
local function invoke_server_command_upvr(arg1, arg2) -- Line 83, Named "invoke_server_command"
	--[[ Upvalues[5]:
		[1]: get_user_upvr (readonly)
		[2]: ._console_upvr (readonly)
		[3]: ._net_upvr (readonly)
		[4]: has_permissions_upvr (readonly)
		[5]: create_command_context_upvr (readonly)
	]]
	local get_user_upvr_result1 = get_user_upvr(arg1)
	local var28 = ._console_upvr.console.commands[arg2.name]
	local function fail_upvr() -- Line 90, Named "fail"
		--[[ Upvalues[3]:
			[1]: ._net_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
		]]
		._net_upvr.server.fire_failed_invoke_reply(arg1, arg2.invoke_id)
	end
	if not var28 or not get_user_upvr_result1 then
		return fail_upvr()
	end
	if not has_permissions_upvr(get_user_upvr_result1, unpack(var28.permissions)) then
		return fail_upvr()
	end
	local create_command_context_upvr_result1_upvr = create_command_context_upvr(get_user_upvr_result1, arg2.invoke_id)
	return (function(arg1_2, ...) -- Line 101, Named "handle"
		--[[ Upvalues[6]:
			[1]: ._console_upvr (copied, readonly)
			[2]: arg2 (readonly)
			[3]: create_command_context_upvr_result1_upvr (readonly)
			[4]: fail_upvr (readonly)
			[5]: ._net_upvr (copied, readonly)
			[6]: arg1 (readonly)
		]]
		local tbl_3 = {}
		tbl_3.ok = arg1_2
		tbl_3.command = arg2.name
		tbl_3.arguments = arg2.args
		tbl_3.result = {...}
		._console_upvr.after_command_run:fire(tbl_3)
		create_command_context_upvr_result1_upvr()
		if not arg1_2 then
			warn(...)
			return fail_upvr()
		end
		return ._net_upvr.server.fire_successful_invoke_reply(arg1, arg2.invoke_id, {...})
	end)(pcall(var28.callback, unpack(arg2.args)))
end
local function _(arg1) -- Line 124, Named "resend_new_commands"
	--[[ Upvalues[1]:
		[1]: ._console_upvr (readonly)
	]]
	if not arg1.dirty then
	else
		for _, v_3 in ._console_upvr.console.commands do
			._console_upvr.replicate_to_player(arg1.player, v_3)
		end
		arg1.dirty = false
	end
end
local ._client_upvr = require("./client")
local Players_upvr = game:GetService("Players")
return {
	args = require("./arguments");
	parse = require("../roblox_packages/ast");
	execute = function(arg1) -- Line 175, Named "execute"
		--[[ Upvalues[5]:
			[1]: ._state_upvr (readonly)
			[2]: any_IsClient_result1_upvr (readonly)
			[3]: ._net_upvr (readonly)
			[4]: create_command_context_upvr (readonly)
			[5]: ._console_upvr (readonly)
		]]
		local local_user = ._state_upvr.local_user
		assert(any_IsClient_result1_upvr, "cannot run commands outside of the client")
		assert(local_user, "unable to run commands without a local user")
		if any_IsClient_result1_upvr then
			._net_upvr.client.fire_log_command(arg1)
		end
		local pcall_result1, pcall_result2 = pcall(._console_upvr.execute, arg1)
		if not pcall_result1 then
			._console_upvr.console.output({
				kind = "error";
				text = pcall_result2;
			})
		end
		create_command_context_upvr(local_user, false)()
	end;
	register_quick = ._console_upvr.register_quick;
	register = ._console_upvr.register_command;
	on_execution = function(arg1) -- Line 191, Named "on_execution"
		--[[ Upvalues[1]:
			[1]: ._net_upvr (readonly)
		]]
		local any_on_log_command_result1_upvr = ._net_upvr.server.on_log_command(function(arg1_3, arg2) -- Line 192
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if typeof(arg2) ~= "string" then
				arg1_3:Kick()
			end
			arg1(arg1_3, arg2)
		end)
		return function() -- Line 197
			--[[ Upvalues[1]:
				[1]: any_on_log_command_result1_upvr (readonly)
			]]
			any_on_log_command_result1_upvr:Disconnect()
		end
	end;
	on_command_run = function(arg1) -- Line 199, Named "on_command_run"
		--[[ Upvalues[1]:
			[1]: ._console_upvr (readonly)
		]]
		local any_connect_result1_upvr = ._console_upvr.after_command_run:connect(arg1)
		return function() -- Line 202
			--[[ Upvalues[1]:
				[1]: any_connect_result1_upvr (readonly)
			]]
			any_connect_result1_upvr:disconnect()
		end
	end;
	initiate_default_lifecycle = function() -- Line 134, Named "initiate_default_lifecycle"
		--[[ Upvalues[11]:
			[1]: any_IsClient_result1_upvr (readonly)
			[2]: ._net_upvr (readonly)
			[3]: ._client_upvr (readonly)
			[4]: any_IsServer_result1_upvr (readonly)
			[5]: Players_upvr (readonly)
			[6]: get_user_upvr (readonly)
			[7]: disconnect_user_for_player_upvr (readonly)
			[8]: ._console_upvr (readonly)
			[9]: invoke_server_command_upvr (readonly)
			[10]: RunService_upvr (readonly)
			[11]: ._state_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		if any_IsClient_result1_upvr then
			._net_upvr.client.init()
			._net_upvr.client.on_command_registered(._client_upvr.register_command)
			._net_upvr.client.on_invoke_reply(._client_upvr.receive_server_results)
			._net_upvr.client.on_log_received(._client_upvr.log)
			._net_upvr.client.on_user_info_received(._client_upvr.create_local_user)
			._net_upvr.client.on_role_info_received(._client_upvr.update_role_permissions)
			._net_upvr.client.on_user_roles_update(._client_upvr.update_user_roles)
		elseif any_IsServer_result1_upvr then
			._net_upvr.server.init()
			Players_upvr.PlayerAdded:Connect(get_user_upvr)
			Players_upvr.PlayerRemoving:Connect(disconnect_user_for_player_upvr)
			for i_4, v_4 in Players_upvr:GetPlayers(), nil do
				get_user_upvr(v_4, i_4)
				local _
			end
			for i_5, v_5 in Players_upvr:GetPlayers(), nil do
				(function(arg1) -- Line 156
					--[[ Upvalues[2]:
						[1]: get_user_upvr (copied, readonly)
						[2]: ._console_upvr (copied, readonly)
					]]
					local get_user_result1 = get_user_upvr(arg1)
					if not get_user_result1.dirty then
					else
						for _, v_8 in ._console_upvr.console.commands do
							._console_upvr.replicate_to_player(get_user_result1.player, v_8)
						end
						get_user_result1.dirty = false
					end
				end)(v_5, i_5)
				local _
			end
			._net_upvr.server.on_command_invoke(invoke_server_command_upvr)
			RunService_upvr.Heartbeat:Connect(function() -- Line 162
				--[[ Upvalues[2]:
					[1]: ._state_upvr (copied, readonly)
					[2]: ._console_upvr (copied, readonly)
				]]
				for _, v_6 in ._state_upvr.users do
					if not v_6.dirty then
					else
						for _, v_7 in ._console_upvr.console.commands do
							._console_upvr.replicate_to_player(v_6.player, v_7)
						end
						v_6.dirty = false
					end
				end
			end)
		end
	end;
	has_permissions = ._user_upvr.has_permissions;
	set_role_permissions = function(arg1, ...) -- Line 33, Named "set_role"
		--[[ Upvalues[3]:
			[1]: ._state_upvr (readonly)
			[2]: any_IsServer_result1_upvr (readonly)
			[3]: ._net_upvr (readonly)
		]]
		._state_upvr.roles[arg1] = {...}
		if any_IsServer_result1_upvr then
			._net_upvr.server.fire_update_role_perms(arg1, {...})
		end
	end;
	give_roles = ._user_upvr.give_roles;
	remove_roles = ._user_upvr.remove_roles;
	get_user = get_user_upvr;
	set_var = ._console_upvr.write_global;
	get_command_context = ._context.get_command_context;
	register_type = ._console_upvr.register_type;
	log = function(arg1, arg2) -- Line 219, Named "log"
		--[[ Upvalues[4]:
			[1]: any_IsServer_result1_upvr (readonly)
			[2]: ._state_upvr (readonly)
			[3]: ._net_upvr (readonly)
			[4]: ._console_upvr (readonly)
		]]
		if any_IsServer_result1_upvr then
			local var76 = ._state_upvr.command_context[coroutine.running()]
			if not var76 then
			else
				local player = var76.executor.player
				if not player then return end
				local tbl_4 = {}
				tbl_4.kind = arg1
				tbl_4.text = arg2
				._net_upvr.server.fire_log(player, tbl_4)
			end
		end
		local tbl_2 = {}
		tbl_2.kind = arg1
		tbl_2.text = arg2
		._console_upvr.console.output(tbl_2)
	end;
	register_default_commands = require("./bootstrap");
	console = ._console_upvr.console;
	analyze = ._console_upvr.analyze;
	_ = {
		create_user = ._user_upvr.create_user;
		disconnect_user = ._user_upvr.disconnect_user;
		create_local_user = function() -- Line 240, Named "create_local_user"
			--[[ Upvalues[2]:
				[1]: get_user_upvr (readonly)
				[2]: ._state_upvr (readonly)
			]]
			local get_user_result1_2 = get_user_upvr("local")
			._state_upvr.local_user = get_user_result1_2
			return get_user_result1_2
		end;
	};
}