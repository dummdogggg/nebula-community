--[[
    Script: ReplicatedStorage.ReplicaShared.Remote
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:44
-- Luau version 6, Types version 3
-- Time taken: 0.004048 seconds

-- KONSTANTERROR: [0] 1. Error Block 16 start (CF ANALYSIS FAILED)
local RunService = game:GetService("RunService")
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local any_IsServer_result1_upvr = RunService:IsServer()
local var4_upvw
local var5_upvw
if any_IsServer_result1_upvr == true then
	var4_upvw = ReplicatedStorage_upvr:FindFirstChild("RemoteEvents")
	if var4_upvw ~= nil then
		if RunService:IsStudio() == true then
			warn(`[{script.Name}]: ReplicatedStorage "{"RemoteEvents"}" container was already defined`)
			-- KONSTANTWARNING: GOTO [78] #57
		end
	else
		var4_upvw = Instance.new("Folder")
		var4_upvw.Name = "RemoteEvents"
		var4_upvw.Parent = ReplicatedStorage_upvr
	end
else
	var4_upvw = ReplicatedStorage_upvr:FindFirstChild("RemoteEvents")
	if var4_upvw == nil then
		var5_upvw = Instance.new("BindableEvent")
		task.spawn(function() -- Line 50
			--[[ Upvalues[3]:
				[1]: var4_upvw (read and write)
				[2]: ReplicatedStorage_upvr (readonly)
				[3]: var5_upvw (read and write)
			]]
			while task.wait() do
				var4_upvw = ReplicatedStorage_upvr:FindFirstChild("RemoteEvents")
				if var4_upvw ~= nil then
					var5_upvw:Fire()
					return
				end
			end
		end)
	end
end
-- KONSTANTERROR: [0] 1. Error Block 16 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [78] 57. Error Block 10 start (CF ANALYSIS FAILED)
local tbl_4_upvr = {}
tbl_4_upvr.__index = tbl_4_upvr
local function New(arg1) -- Line 71
	--[[ Upvalues[1]:
		[1]: tbl_4_upvr (readonly)
	]]
	local module = {}
	module.fn = arg1
	module.is_disconnected = false
	module.real_connection = nil
	return setmetatable(module, tbl_4_upvr)
end
tbl_4_upvr.New = New
function tbl_4_upvr.Disconnect(arg1) -- Line 79
	arg1.is_disconnected = true
	if arg1.real_connection ~= nil then
		arg1.real_connection:Disconnect()
	end
end
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
local tbl_5_upvr = {}
function module_2_upvr.New(arg1, arg2) -- Line 89
	--[[ Upvalues[6]:
		[1]: any_IsServer_result1_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: tbl_4_upvr (readonly)
		[5]: module_2_upvr (readonly)
		[6]: var5_upvw (read and write)
	]]
	local var11_upvw
	if var11_upvw ~= "string" then
		var11_upvw = error
		var11_upvw(`[{script.Name}]: name must be a string`)
	end
	var11_upvw = any_IsServer_result1_upvr
	if var11_upvw == true then
		var11_upvw = tbl_5_upvr[arg1]
		if var11_upvw ~= nil then
			var11_upvw = error
			var11_upvw(`[{script.Name}]: RemoteEvent {arg1} was already defined`)
		end
		var11_upvw = tbl_5_upvr
		local var12 = true
		var11_upvw[arg1] = var12
		var11_upvw = Instance.new
		if arg2 == true then
			var12 = "UnreliableRemoteEvent"
		else
			var12 = "RemoteEvent"
		end
		var11_upvw = var11_upvw(var12)
		var11_upvw.Name = arg1
		var11_upvw.Parent = var4_upvw
		return var11_upvw
	end
	var11_upvw = var4_upvw
	if var11_upvw then
		var11_upvw = var4_upvw:FindFirstChild(arg1)
	end
	if var11_upvw ~= nil then
		return var11_upvw
	end
	local tbl_3_upvw = {}
	local tbl = {}
	local tbl_2 = {}
	local function Connect(arg1_2, arg2_2) -- Line 121
		--[[ Upvalues[3]:
			[1]: var11_upvw (read and write)
			[2]: tbl_4_upvr (copied, readonly)
			[3]: tbl_3_upvw (read and write)
		]]
		if var11_upvw ~= nil then
			return var11_upvw.OnClientEvent:Connect(arg2_2)
		end
		local any_New_result1 = tbl_4_upvr.New(arg2_2)
		table.insert(tbl_3_upvw, any_New_result1)
		return any_New_result1
	end
	tbl_2.Connect = Connect
	tbl.OnClientEvent = tbl_2
	tbl.OnServerEvent = {
		Connect = function() -- Line 134, Named "Connect"
			error(`[{script.Name}]: Can't connect to "OnServerEvent" client-side`)
		end;
	}
	tbl.RemoteEvent = nil
	local setmetatable_result1_upvr = setmetatable(tbl, module_2_upvr)
	local function on_container_ready_upvr() -- Line 141, Named "on_container_ready"
		--[[ Upvalues[5]:
			[1]: var11_upvw (read and write)
			[2]: var4_upvw (copied, read and write)
			[3]: arg1 (readonly)
			[4]: tbl_3_upvw (read and write)
			[5]: setmetatable_result1_upvr (readonly)
		]]
		-- KONSTANTERROR: [39] 29. Error Block 7 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [39] 29. Error Block 7 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 24 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [39.1]
		if nil == nil then
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [39.0]
			if nil ~= nil then
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [39.2]
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [39.4292477000]
				if nil < nil then
				end
			end
			-- KONSTANTWARNING: GOTO [3] #3
		end
		-- KONSTANTERROR: [0] 1. Error Block 24 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [41] 31. Error Block 20 start (CF ANALYSIS FAILED)
		for _, v in ipairs(tbl_3_upvw) do
			if v.is_disconnected == false then
				v.real_connection = var11_upvw.OnClientEvent:Connect(v.fn)
			end
		end
		setmetatable_result1_upvr.RemoteEvent = var11_upvw
		tbl_3_upvw = nil
		-- KONSTANTERROR: [41] 31. Error Block 20 end (CF ANALYSIS FAILED)
	end
	if var4_upvw ~= nil then
		task.spawn(on_container_ready_upvr)
	else
		local var30_upvw
		var30_upvw = var5_upvw.Event:Connect(function() -- Line 173
			--[[ Upvalues[2]:
				[1]: var30_upvw (read and write)
				[2]: on_container_ready_upvr (readonly)
			]]
			var30_upvw:Disconnect()
			on_container_ready_upvr()
		end)
	end
	return setmetatable_result1_upvr
end
function module_2_upvr.FireServer(arg1, ...) -- Line 185
	if arg1.RemoteEvent ~= nil then
		arg1.RemoteEvent:FireServer(...)
	end
end
function module_2_upvr.FireClient(arg1) -- Line 191
	error(`[{script.Name}]: Can't use "FireClient" client-side`)
end
function module_2_upvr.FireAllClients(arg1) -- Line 195
	error(`[{script.Name}]: Can't use "FireAllClients" client-side`)
end
do
	return module_2_upvr
end
-- KONSTANTERROR: [78] 57. Error Block 10 end (CF ANALYSIS FAILED)