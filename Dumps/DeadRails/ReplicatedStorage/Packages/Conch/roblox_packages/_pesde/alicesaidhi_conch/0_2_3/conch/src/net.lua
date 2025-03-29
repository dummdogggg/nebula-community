--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.net
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:52
-- Luau version 6, Types version 3
-- Time taken: 0.007331 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local var2_upvr
if game:GetService("RunService"):IsServer() then
	var2_upvr = "server"
else
	var2_upvr = "client"
end
local function _(arg1) -- Line 68, Named "assert_run_context"
	--[[ Upvalues[1]:
		[1]: var2_upvr (readonly)
	]]
	local var3
	if var2_upvr ~= arg1 then
		var3 = false
	else
		var3 = true
	end
	assert(var3, `expected run context {arg1} but got {var2_upvr}`)
end
local var4_upvw
local module_upvr = {
	client = {
		initialized = false;
	};
	server = {
		initialized = false;
	};
}
local function init() -- Line 86
	--[[ Upvalues[4]:
		[1]: var2_upvr (readonly)
		[2]: ReplicatedStorage_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: module_upvr (readonly)
	]]
	local remote
	if var2_upvr ~= "server" then
		remote = false
	else
		remote = true
	end
	assert(remote, `expected run context {"server"} but got {var2_upvr}`)
	remote = "Folder"
	local any_upvr = Instance.new(remote)
	remote = "conch_networking"
	any_upvr.Name = remote
	remote = ReplicatedStorage_upvr
	any_upvr.Parent = remote
	function remote(arg1) -- Line 93
		--[[ Upvalues[1]:
			[1]: any_upvr (readonly)
		]]
		local RemoteEvent = Instance.new("RemoteEvent")
		RemoteEvent.Name = arg1
		RemoteEvent.Parent = any_upvr
		return RemoteEvent
	end
	local tbl_2 = {}
	local RemoteEvent_7 = Instance.new("RemoteEvent")
	RemoteEvent_7.Name = "invoke_server_command"
	RemoteEvent_7.Parent = any_upvr
	tbl_2.invoke_server_command = RemoteEvent_7
	local RemoteEvent_3 = Instance.new("RemoteEvent")
	RemoteEvent_3.Name = "create_user"
	RemoteEvent_3.Parent = any_upvr
	tbl_2.create_user = RemoteEvent_3
	local RemoteEvent_5 = Instance.new("RemoteEvent")
	RemoteEvent_5.Name = "update_user_roles"
	RemoteEvent_5.Parent = any_upvr
	tbl_2.update_user_roles = RemoteEvent_5
	local RemoteEvent_8 = Instance.new("RemoteEvent")
	RemoteEvent_8.Name = "update_role_permissions"
	RemoteEvent_8.Parent = any_upvr
	tbl_2.update_role_permissions = RemoteEvent_8
	local RemoteEvent_4 = Instance.new("RemoteEvent")
	RemoteEvent_4.Name = "register_command"
	RemoteEvent_4.Parent = any_upvr
	tbl_2.register_command = RemoteEvent_4
	local RemoteEvent_6 = Instance.new("RemoteEvent")
	RemoteEvent_6.Name = "log"
	RemoteEvent_6.Parent = any_upvr
	tbl_2.log = RemoteEvent_6
	local RemoteEvent_2 = Instance.new("RemoteEvent")
	RemoteEvent_2.Name = "log_command"
	RemoteEvent_2.Parent = any_upvr
	tbl_2.log_command = RemoteEvent_2
	var4_upvw = tbl_2
	module_upvr.server.initialized = true
end
module_upvr.server.init = init
module_upvr.client.init = function() -- Line 116, Named "init"
	--[[ Upvalues[4]:
		[1]: var2_upvr (readonly)
		[2]: ReplicatedStorage_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: module_upvr (readonly)
	]]
	local remote
	if var2_upvr ~= "client" then
		remote = false
	else
		remote = true
	end
	assert(remote, `expected run context {"client"} but got {var2_upvr}`)
	local conch_networking_upvr = ReplicatedStorage_upvr:WaitForChild("conch_networking")
	function remote(arg1) -- Line 121
		--[[ Upvalues[1]:
			[1]: conch_networking_upvr (readonly)
		]]
		return conch_networking_upvr:WaitForChild(arg1)
	end
	var4_upvw = {
		invoke_server_command = conch_networking_upvr:WaitForChild("invoke_server_command");
		create_user = conch_networking_upvr:WaitForChild("create_user");
		update_user_roles = conch_networking_upvr:WaitForChild("update_user_roles");
		update_role_permissions = conch_networking_upvr:WaitForChild("update_role_permissions");
		register_command = conch_networking_upvr:WaitForChild("register_command");
		log = conch_networking_upvr:WaitForChild("log");
		log_command = conch_networking_upvr:WaitForChild("log_command");
	}
	module_upvr.client.initialized = true
end
module_upvr.client.on_user_roles_update = function(arg1) -- Line 140, Named "on_user_roles_update"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_4 = module_upvr.client.initialized
	assert(initialized_4, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_4 = false
	else
		initialized_4 = true
	end
	assert(initialized_4, `expected run context {"client"} but got {var2_upvr}`)
	var4_upvw.update_user_roles.OnClientEvent:Connect(arg1)
end
module_upvr.client.on_command_registered = function(arg1) -- Line 151, Named "on_command_registered"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_5 = module_upvr.client.initialized
	assert(initialized_5, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_5 = false
	else
		initialized_5 = true
	end
	assert(initialized_5, `expected run context {"client"} but got {var2_upvr}`)
	var4_upvw.register_command.OnClientEvent:Connect(arg1)
end
module_upvr.client.on_role_info_received = function(arg1) -- Line 162, Named "on_role_info_received"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_16 = module_upvr.client.initialized
	assert(initialized_16, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_16 = false
	else
		initialized_16 = true
	end
	assert(initialized_16, `expected run context {"client"} but got {var2_upvr}`)
	var4_upvw.update_role_permissions.OnClientEvent:Connect(arg1)
end
module_upvr.client.on_user_info_received = function(arg1) -- Line 171, Named "on_user_info_received"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_10 = module_upvr.client.initialized
	assert(initialized_10, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_10 = false
	else
		initialized_10 = true
	end
	assert(initialized_10, `expected run context {"client"} but got {var2_upvr}`)
	var4_upvw.create_user.OnClientEvent:Connect(arg1)
end
module_upvr.client.on_log_received = function(arg1) -- Line 178, Named "on_log_received"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_7 = module_upvr.client.initialized
	assert(initialized_7, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_7 = false
	else
		initialized_7 = true
	end
	assert(initialized_7, `expected run context {"client"} but got {var2_upvr}`)
	var4_upvw.log.OnClientEvent:Connect(arg1)
end
module_upvr.client.invoke_command = function(arg1, arg2, arg3) -- Line 185, Named "invoke_command"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_11 = module_upvr.client.initialized
	assert(initialized_11, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_11 = false
	else
		initialized_11 = true
	end
	assert(initialized_11, `expected run context {"client"} but got {var2_upvr}`)
	local tbl = {}
	tbl.invoke_id = arg1
	tbl.name = arg2
	tbl.args = arg3
	var4_upvw.invoke_server_command:FireServer(tbl)
end
module_upvr.client.on_invoke_reply = function(arg1) -- Line 202, Named "on_invoke_reply"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_6 = module_upvr.client.initialized
	assert(initialized_6, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_6 = false
	else
		initialized_6 = true
	end
	assert(initialized_6, `expected run context {"client"} but got {var2_upvr}`)
	var4_upvw.invoke_server_command.OnClientEvent:Connect(arg1)
end
module_upvr.client.fire_log_command = function(arg1) -- Line 209, Named "fire_log_command"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_14 = module_upvr.client.initialized
	assert(initialized_14, "client not initialized")
	if var2_upvr ~= "client" then
		initialized_14 = false
	else
		initialized_14 = true
	end
	assert(initialized_14, `expected run context {"client"} but got {var2_upvr}`)
	var4_upvw.log_command:FireServer(arg1)
end
module_upvr.server.on_log_command = function(arg1) -- Line 216, Named "on_log_command"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_3 = module_upvr.server.initialized
	assert(initialized_3, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_3 = false
	else
		initialized_3 = true
	end
	assert(initialized_3, `expected run context {"server"} but got {var2_upvr}`)
	return var4_upvw.log_command.OnServerEvent:Connect(arg1)
end
module_upvr.server.fire_log = function(arg1, arg2) -- Line 223, Named "fire_log"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_17 = module_upvr.server.initialized
	assert(initialized_17, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_17 = false
	else
		initialized_17 = true
	end
	assert(initialized_17, `expected run context {"server"} but got {var2_upvr}`)
	var4_upvw.log:FireClient(arg1, arg2)
end
module_upvr.server.fire_register_command = function(arg1, arg2) -- Line 230, Named "fire_register_command"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_8 = module_upvr.server.initialized
	assert(initialized_8, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_8 = false
	else
		initialized_8 = true
	end
	assert(initialized_8, `expected run context {"server"} but got {var2_upvr}`)
	var4_upvw.register_command:FireClient(arg1, arg2)
end
module_upvr.server.on_command_invoke = function(arg1) -- Line 240, Named "on_command_invoke"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_2 = module_upvr.server.initialized
	assert(initialized_2, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_2 = false
	else
		initialized_2 = true
	end
	assert(initialized_2, `expected run context {"server"} but got {var2_upvr}`)
	var4_upvw.invoke_server_command.OnServerEvent:Connect(arg1)
end
module_upvr.server.fire_successful_invoke_reply = function(arg1, arg2, arg3) -- Line 250, Named "fire_successful_invoke_reply"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized = module_upvr.server.initialized
	assert(initialized, "server not initialized")
	if var2_upvr ~= "server" then
		initialized = false
	else
		initialized = true
	end
	assert(initialized, `expected run context {"server"} but got {var2_upvr}`)
	local tbl_5 = {
		status = "ok";
	}
	tbl_5.invoke_id = arg2
	tbl_5.results = arg3
	var4_upvw.invoke_server_command:FireClient(arg1, tbl_5)
end
module_upvr.server.fire_failed_invoke_reply = function(arg1, arg2) -- Line 267, Named "fire_failed_invoke_reply"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_12 = module_upvr.server.initialized
	assert(initialized_12, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_12 = false
	else
		initialized_12 = true
	end
	assert(initialized_12, `expected run context {"server"} but got {var2_upvr}`)
	local tbl_3 = {
		status = "err";
	}
	tbl_3.invoke_id = arg2
	var4_upvw.invoke_server_command:FireClient(arg1, tbl_3)
end
module_upvr.server.fire_create_user = function(arg1, arg2, arg3) -- Line 279, Named "fire_create_user"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_15 = module_upvr.server.initialized
	assert(initialized_15, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_15 = false
	else
		initialized_15 = true
	end
	assert(initialized_15, `expected run context {"server"} but got {var2_upvr}`)
	local tbl_4 = {}
	tbl_4.name = arg3
	tbl_4.id = arg2
	var4_upvw.create_user:FireClient(arg1, tbl_4)
end
module_upvr.server.fire_update_user_roles = function(arg1, arg2) -- Line 291, Named "fire_update_user_roles"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_13 = module_upvr.server.initialized
	assert(initialized_13, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_13 = false
	else
		initialized_13 = true
	end
	assert(initialized_13, `expected run context {"server"} but got {var2_upvr}`)
	var4_upvw.update_user_roles:FireClient(arg1, arg2)
end
module_upvr.server.fire_update_role_perms = function(arg1, arg2) -- Line 301, Named "fire_update_role_perms"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: var2_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	local initialized_9 = module_upvr.server.initialized
	assert(initialized_9, "server not initialized")
	if var2_upvr ~= "server" then
		initialized_9 = false
	else
		initialized_9 = true
	end
	assert(initialized_9, `expected run context {"server"} but got {var2_upvr}`)
	local tbl_6 = {}
	tbl_6.name = arg1
	tbl_6.permissions = arg2
	var4_upvw.update_role_permissions:FireAllClients(tbl_6)
end
return module_upvr