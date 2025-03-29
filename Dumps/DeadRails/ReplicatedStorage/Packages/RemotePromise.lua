--[[
    Script: ReplicatedStorage.Packages.RemotePromise
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:04
-- Luau version 6, Types version 3
-- Time taken: 0.003496 seconds

local RunService_upvr = game:GetService("RunService")
local TypedPromise_upvr = require(script.TypedPromise)
local function var3_upvr() -- Line 14
end
local module_upvr = {
	Error = TypedPromise_upvr.Error;
}
module_upvr.__index = module_upvr
local Remotes_upvr = script:WaitForChild("Remotes")
function module_upvr.new(arg1) -- Line 43
	--[[ Upvalues[4]:
		[1]: RunService_upvr (readonly)
		[2]: Remotes_upvr (readonly)
		[3]: module_upvr (readonly)
		[4]: var3_upvr (readonly)
	]]
	local var6
	if typeof(arg1) ~= "string" then
		var6 = false
	else
		var6 = true
	end
	assert(var6, "First argument must be a string")
	local module_upvr_2 = {}
	var6 = nil
	module_upvr_2.OnServerInvoke = var6
	var6 = nil
	module_upvr_2.OnClientInvoke = var6
	var6 = {}
	module_upvr_2._connections = var6
	var6 = {}
	module_upvr_2._instances = var6
	var6 = RunService_upvr:IsServer()
	if var6 then
		var6 = Remotes_upvr:FindFirstChild(`S_{arg1}`)
		module_upvr_2._serverToClientEvent = var6
		var6 = Remotes_upvr:FindFirstChild(`C_{arg1}`)
		module_upvr_2._clientToServerEvent = var6
		var6 = module_upvr_2._serverToClientEvent
		if not var6 then
			var6 = Instance.new("RemoteEvent")
			module_upvr_2._serverToClientEvent = var6
			var6 = module_upvr_2._serverToClientEvent
			var6.Name = `S_{arg1}`
			var6 = module_upvr_2._serverToClientEvent
			var6.Parent = Remotes_upvr
			var6 = table.insert
			var6(module_upvr_2._instances, module_upvr_2._serverToClientEvent)
		end
		var6 = module_upvr_2._clientToServerEvent
		if not var6 then
			var6 = Instance.new("RemoteEvent")
			module_upvr_2._clientToServerEvent = var6
			var6 = module_upvr_2._clientToServerEvent
			var6.Name = `C_{arg1}`
			var6 = module_upvr_2._clientToServerEvent
			var6.Parent = Remotes_upvr
			var6 = table.insert
			var6(module_upvr_2._instances, module_upvr_2._clientToServerEvent)
			-- KONSTANTWARNING: GOTO [150] #104
		end
	else
		var6 = Remotes_upvr:WaitForChild(`S_{arg1}`)
		module_upvr_2._serverToClientEvent = var6
		var6 = Remotes_upvr:WaitForChild(`C_{arg1}`)
		module_upvr_2._clientToServerEvent = var6
	end
	var6 = setmetatable
	var6(module_upvr_2, module_upvr)
	var6 = RunService_upvr:IsServer()
	if var6 then
		var6 = module_upvr_2._clientToServerEvent.OnServerEvent
		var6 = var6:Connect(function(arg1_2, ...) -- Line 82
			--[[ Upvalues[2]:
				[1]: module_upvr_2 (readonly)
				[2]: var3_upvr (copied, readonly)
			]]
			local var9
			if module_upvr_2.OnServerInvoke then
				var9 = module_upvr_2.OnServerInvoke
			else
				var9 = var3_upvr
			end
			module_upvr_2._clientToServerEvent:FireClient(arg1_2, var9(arg1_2, ...))
		end)
		table.insert(module_upvr_2._connections, var6)
		return module_upvr_2
	end
	var6 = RunService_upvr:IsClient()
	if var6 then
		var6 = module_upvr_2._serverToClientEvent.OnClientEvent
		var6 = var6:Connect(function(arg1_3, ...) -- Line 90
			--[[ Upvalues[2]:
				[1]: module_upvr_2 (readonly)
				[2]: var3_upvr (copied, readonly)
			]]
			local var11
			if module_upvr_2.OnClientInvoke then
				var11 = module_upvr_2.OnClientInvoke
			else
				var11 = var3_upvr
			end
			module_upvr_2._serverToClientEvent:FireServer(arg1_3, var11(...))
		end)
		table.insert(module_upvr_2._connections, var6)
	end
	return module_upvr_2
end
function module_upvr.InvokeServer(arg1, ...) -- Line 102
	--[[ Upvalues[2]:
		[1]: RunService_upvr (readonly)
		[2]: TypedPromise_upvr (readonly)
	]]
	assert(RunService_upvr:IsClient(), "InvokeServer can only be called from a client!")
	arg1._clientToServerEvent:FireServer(...)
	return TypedPromise_upvr.fromEvent(arg1._clientToServerEvent.OnClientEvent, function() -- Line 109
		return true
	end)
end
local HttpService_upvr = game:GetService("HttpService")
function module_upvr.InvokeClient(arg1, arg2, ...) -- Line 115
	--[[ Upvalues[3]:
		[1]: RunService_upvr (readonly)
		[2]: HttpService_upvr (readonly)
		[3]: TypedPromise_upvr (readonly)
	]]
	assert(RunService_upvr:IsServer(), "InvokeClient can only be called from the server!")
	local var14 = arg2
	if var14 then
		var14 = arg2:IsA("Player")
	end
	assert(var14, "Invalid player argument")
	arg1._serverToClientEvent:FireClient(arg2, HttpService_upvr:GenerateGUID(false), ...)
	local function var15_upvr(...) -- Line 122
		return true
	end
	return TypedPromise_upvr.new(function(arg1_4, arg2_2, arg3) -- Line 126
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var15_upvr (readonly)
		]]
		local var17_upvw
		local var18_upvw = false
		local function disconnect() -- Line 130
			--[[ Upvalues[1]:
				[1]: var17_upvw (read and write)
			]]
			if var17_upvw then
				var17_upvw:Disconnect()
			end
			var17_upvw = nil
		end
		var17_upvw = arg1._serverToClientEvent.OnServerEvent:Connect(function(...) -- Line 142
			--[[ Upvalues[4]:
				[1]: var15_upvr (copied, readonly)
				[2]: arg1_4 (readonly)
				[3]: var17_upvw (read and write)
				[4]: var18_upvw (read and write)
			]]
			local var15_upvr_result1 = var15_upvr(...)
			if var15_upvr_result1 == true then
				arg1_4(select(3, ...))
				if var17_upvw then
					if var17_upvw then
						var17_upvw:Disconnect()
					end
					var17_upvw = nil
				else
					var18_upvw = true
				end
			end
			if type(var15_upvr_result1) ~= "boolean" then
				error("Predicate should always return a boolean")
			end
		end)
		if var18_upvw and var17_upvw then
			return disconnect()
		end
		arg3(disconnect)
	end)
end
function module_upvr.Destroy(arg1) -- Line 166
	for _, v in arg1._connections do
		v:Disconnect()
	end
	for _, v_2 in arg1._instances do
		v_2:Destroy()
	end
end
return module_upvr