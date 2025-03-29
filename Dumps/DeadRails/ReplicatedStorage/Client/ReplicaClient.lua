--[[
    Script: ReplicatedStorage.Client.ReplicaClient
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:47
-- Luau version 6, Types version 3
-- Time taken: 0.069996 seconds

local ReplicaShared = game.ReplicatedStorage.ReplicaShared
local Remote = require(ReplicaShared.Remote)
local Signal_upvr = require(ReplicaShared.Signal)
local tbl_4_upvr = {}
local CollectionService_2 = game:GetService("CollectionService")
local tbl_upvr = {}
local tbl_13_upvr = {}
local tbl_31_upvr = {}
local tbl_30_upvr = {}
local tbl_29_upvr = {}
local any_New_result1_upvr_2 = Remote.New("ReplicaRequestData")
local any_New_result1_upvr_5 = Remote.New("ReplicaSignal")
local any_New_result1_upvr_6 = Remote.New("ReplicaSignalUnreliable", true)
local var410_upvw = false
local tbl_2_upvr = {}
local function LoadWriteLib_upvr(arg1) -- Line 115, Named "LoadWriteLib"
	--[[ Upvalues[1]:
		[1]: tbl_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var428 = tbl_2_upvr[arg1]
	if var428 ~= nil then
		return var428
	end
	for i, v in pairs(require(arg1)) do
		table.insert({}, {i, v})
		local var434
	end
	table.sort(var434, function(arg1_6, arg2) -- Line 131
		local var436
		if arg1_6[1] >= arg2[1] then
			var436 = false
		else
			var436 = true
		end
		return var436
	end)
	local tbl_24 = {}
	for i_2, v_2 in ipairs(var434) do
		local tbl_6 = {
			Name = v_2[1];
			Id = i_2;
			fn = v_2[2];
		}
		tbl_24[v_2[1]] = tbl_6
		tbl_24[i_2] = tbl_6
		local var442
	end
	tbl_2_upvr[arg1] = var442
	return var442
end
local tbl_26_upvr = {}
tbl_26_upvr.__index = tbl_26_upvr
local var444_upvw
local function AcquireRunnerThreadAndCallEventHandler_upvr(arg1, ...) -- Line 188, Named "AcquireRunnerThreadAndCallEventHandler"
	--[[ Upvalues[1]:
		[1]: var444_upvw (read and write)
	]]
	var444_upvw = nil
	arg1(...)
	var444_upvw = var444_upvw
end
local function RunEventHandlerInFreeThread_upvr(...) -- Line 196, Named "RunEventHandlerInFreeThread"
	--[[ Upvalues[1]:
		[1]: AcquireRunnerThreadAndCallEventHandler_upvr (readonly)
	]]
	AcquireRunnerThreadAndCallEventHandler_upvr(...)
	while true do
		AcquireRunnerThreadAndCallEventHandler_upvr(coroutine.yield())
	end
end
function ConnectionNew(arg1, arg2) -- Line 203
	--[[ Upvalues[1]:
		[1]: tbl_26_upvr (readonly)
	]]
	local tbl_34 = {}
	tbl_34.t = arg1
	tbl_34.fn = arg2
	local setmetatable_result1_4 = setmetatable(tbl_34, tbl_26_upvr)
	arg1[setmetatable_result1_4] = true
	return setmetatable_result1_4
end
function ConnectionFire(arg1, ...) -- Line 216
	--[[ Upvalues[2]:
		[1]: var444_upvw (read and write)
		[2]: RunEventHandlerInFreeThread_upvr (readonly)
	]]
	if not var444_upvw then
		var444_upvw = coroutine.create(RunEventHandlerInFreeThread_upvr)
	end
	task.spawn(var444_upvw, arg1.fn, ...)
end
function tbl_26_upvr.Disconnect(arg1) -- Line 223
	arg1.t[arg1] = nil
end
local module_3_upvr = {
	IsReady = false;
	OnLocalReady = Signal_upvr.New();
}
module_3_upvr.__index = module_3_upvr
local Maid_upvr_2 = require(ReplicaShared.Maid)
local function ReplicaNew_upvr(arg1, arg2) -- Line 233, Named "ReplicaNew"
	--[[ Upvalues[7]:
		[1]: LoadWriteLib_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: tbl_13_upvr (readonly)
		[4]: Signal_upvr (readonly)
		[5]: Maid_upvr_2 (readonly)
		[6]: tbl_4_upvr (readonly)
		[7]: module_3_upvr (readonly)
	]]
	local var449
	local var450
	if arg2[5] ~= nil then
		var450 = arg2[5]
		var449 = LoadWriteLib_upvr(var450)
	end
	var450 = tbl_31_upvr[arg2[4]]
	if not var450 then
		var450 = tbl_13_upvr[arg2[4]]
	end
	local tbl_25 = {
		Tags = arg2[2];
		Data = arg2[3];
	}
	tbl_25.Id = arg1
	tbl_25.Token = arg2[1]
	tbl_25.Parent = var450
	tbl_25.Children = {}
	tbl_25.BoundInstance = nil
	tbl_25.OnClientEvent = Signal_upvr.New()
	tbl_25.Maid = Maid_upvr_2.New(tbl_4_upvr)
	tbl_25.self_creation = arg2
	tbl_25.write_lib = var449
	tbl_25.set_listeners = {}
	tbl_25.write_listeners = {}
	tbl_25.changed_listeners = {}
	local setmetatable_result1_2 = setmetatable(tbl_25, module_3_upvr)
	if var450 ~= nil then
		var450.Children[setmetatable_result1_2] = true
	end
	return setmetatable_result1_2
end
local var453_upvw = false
function module_3_upvr.RequestData() -- Line 272
	--[[ Upvalues[3]:
		[1]: var453_upvw (read and write)
		[2]: any_New_result1_upvr_2 (readonly)
		[3]: module_3_upvr (readonly)
	]]
	if var453_upvw == true then
	else
		var453_upvw = true
		task.spawn(function() -- Line 280
			--[[ Upvalues[2]:
				[1]: any_New_result1_upvr_2 (copied, readonly)
				[2]: module_3_upvr (copied, readonly)
			]]
			any_New_result1_upvr_2:FireServer()
			while task.wait(2) and module_3_upvr.IsReady ~= true do
				any_New_result1_upvr_2:FireServer()
			end
		end)
	end
end
function module_3_upvr.OnNew(arg1, arg2) -- Line 295
	--[[ Upvalues[2]:
		[1]: tbl_29_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if type(arg1) ~= "string" then
		error(`[{script.Name}]: "token" must be a string`)
	end
	local var459 = tbl_29_upvr[arg1]
	if var459 == nil then
		var459 = {}
		tbl_29_upvr[arg1] = var459
	end
	local var460 = tbl_upvr[arg1]
	if var460 ~= nil then
		for i_3 in pairs(var460) do
			ConnectionFire(ConnectionNew(var459, arg2), i_3)
			local var464
		end
	end
	return var464
end
function module_3_upvr.FromId(arg1) -- Line 322
	--[[ Upvalues[1]:
		[1]: tbl_13_upvr (readonly)
	]]
	return tbl_13_upvr[arg1]
end
function module_3_upvr.Test() -- Line 326
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_13_upvr (readonly)
		[3]: tbl_31_upvr (readonly)
		[4]: tbl_30_upvr (readonly)
	]]
	return {
		TokenReplicas = tbl_upvr;
		Replicas = tbl_13_upvr;
		BindReplicas = tbl_31_upvr;
		BindInstances = tbl_30_upvr;
	}
end
function module_3_upvr.OnSet(arg1, arg2, arg3) -- Line 335
	local concatenated_2 = table.concat(arg2, '.')
	local var467 = arg1.set_listeners[concatenated_2]
	if var467 == nil then
		var467 = {}
		arg1.set_listeners[concatenated_2] = var467
	end
	return ConnectionNew(var467, arg3)
end
function module_3_upvr.OnWrite(arg1, arg2, arg3) -- Line 346
	local var468 = arg1.write_listeners[arg2]
	if var468 == nil then
		var468 = {}
		arg1.write_listeners[arg2] = var468
	end
	return ConnectionNew(var468, arg3)
end
function module_3_upvr.OnChange(arg1, arg2) -- Line 356
	return ConnectionNew(arg1.changed_listeners, arg2)
end
function module_3_upvr.GetChild(arg1, arg2) -- Line 360
	if type(arg2) ~= "string" then
		error(`[{script.Name}]: "token" must be a string`)
	end
	for i_4 in pairs(arg1.Children) do
		if i_4.Token == arg2 then
			return i_4
		end
	end
	return nil
end
function module_3_upvr.FireServer(arg1, ...) -- Line 372
	--[[ Upvalues[1]:
		[1]: any_New_result1_upvr_5 (readonly)
	]]
	any_New_result1_upvr_5:FireServer(arg1.Id, ...)
end
function module_3_upvr.UFireServer(arg1, ...) -- Line 376
	--[[ Upvalues[1]:
		[1]: any_New_result1_upvr_6 (readonly)
	]]
	any_New_result1_upvr_6:FireServer(arg1.Id, ...)
end
function module_3_upvr.Identify(arg1) -- Line 380
	local var480
	for i_5, v_3 in pairs(arg1.Tags) do
		local var481
		if true == true then
			var481 = ""
		else
			var481 = ';'
		end
		var480 = var480..`{var481}{tostring(i_5)}={tostring(v_3)}`
	end
	return `[Id:{arg1.Id};Token:{arg1.Token};Tags:{{var480}}]`
end
function module_3_upvr.IsActive(arg1) -- Line 390
	return arg1.Maid:IsActive()
end
function module_3_upvr.Set(arg1, arg2, arg3) -- Line 394
	--[[ Upvalues[1]:
		[1]: var410_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var494
	if var494 ~= true then
		var494 = error
		var494(`[{script.Name}]: "Set()" can't be called outside of WriteLibs client-side`)
	end
	var494 = arg1.Data
	for i_6 = 1, #arg2 - 1 do
		var494 = var494[arg2[i_6]]
	end
	local var495 = arg2[#arg2]
	var494[var495] = arg3
	if next(arg1.set_listeners) ~= nil then
		local var496 = arg1.set_listeners[table.concat(arg2, '.')]
		if var496 ~= nil then
			for i_7 in pairs(var496) do
				ConnectionFire(i_7, arg3, var494[var495])
				local var500
			end
		end
	end
	for i_8 in pairs(arg1.changed_listeners) do
		ConnectionFire(i_8, "Set", arg2, arg3, var500)
		local _
	end
end
function module_3_upvr.SetValues(arg1, arg2, arg3) -- Line 426
	--[[ Upvalues[1]:
		[1]: var410_upvw (read and write)
	]]
	local var515
	if var515 ~= true then
		var515 = error
		var515(`[{script.Name}]: "SetValues()" can't be called outside of WriteLibs client-side`)
	end
	var515 = arg1.Data
	for _, v_4 in ipairs(arg2) do
		var515 = var515[v_4]
	end
	for i_10, v_5 in pairs(arg3) do
		var515[i_10] = v_5
	end
	for i_11 in pairs(arg1.changed_listeners) do
		ConnectionFire(i_11, "SetValues", arg2, arg3)
	end
end
function module_3_upvr.TableInsert(arg1, arg2, arg3, arg4) -- Line 450
	--[[ Upvalues[1]:
		[1]: var410_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var537
	if var537 ~= true then
		var537 = error
		var537(`[{script.Name}]: "TableInsert()" can't be called outside of WriteLibs client-side`)
	end
	var537 = arg1.Data
	for i_12, v_6 in ipairs(arg2) do
		var537 = var537[v_6]
	end
	if arg4 ~= nil then
		i_12 = arg3
		table.insert(var537, arg4, i_12)
	else
		table.insert(var537, arg3)
		local len_2 = #var537
	end
	for i_13 in pairs(arg1.changed_listeners) do
		ConnectionFire(i_13, "TableInsert", arg2, arg3, len_2)
	end
	return len_2
end
function module_3_upvr.TableRemove(arg1, arg2, arg3) -- Line 479
	--[[ Upvalues[1]:
		[1]: var410_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var557
	if var557 ~= true then
		var557 = error
		var557(`[{script.Name}]: "TableRemove()" can't be called outside of WriteLibs client-side`)
	end
	var557 = arg1.Data
	for _, v_7 in ipairs(arg2) do
		var557 = var557[v_7]
	end
	for i_15 in pairs(arg1.changed_listeners) do
		ConnectionFire(i_15, "TableRemove", arg2, table.remove(var557, arg3), arg3)
		local var565
	end
	return var565
end
function module_3_upvr.Write(arg1, arg2, ...) -- Line 503
	--[[ Upvalues[1]:
		[1]: var410_upvw (read and write)
	]]
	if var410_upvw ~= true then
		error(`[{script.Name}]: "Write()" can't be called outside of WriteLibs client-side`)
	end
	local var567 = arg1.write_listeners[arg2]
	if var567 ~= nil then
		for i_16 in pairs(var567) do
			ConnectionFire(i_16, ...)
		end
	end
	return table.unpack(table.pack(arg1.write_lib[arg2].fn(arg1, ...)))
end
local function DestroyReplica_upvr(arg1, arg2) -- Line 527, Named "DestroyReplica"
	--[[ Upvalues[5]:
		[1]: DestroyReplica_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: tbl_13_upvr (readonly)
		[4]: tbl_31_upvr (readonly)
		[5]: tbl_4_upvr (readonly)
	]]
	for _, v_8 in ipairs(arg1.Children) do
		DestroyReplica_upvr(v_8, true)
	end
	if arg2 ~= true then
		if arg1.Parent ~= nil then
			arg1.Parent.Children[arg1] = nil
		end
	end
	local Id = arg1.Id
	local var577 = tbl_upvr[arg1.Token]
	if var577 ~= nil then
		var577[arg1] = nil
	end
	if tbl_13_upvr[Id] == arg1 then
		tbl_13_upvr[Id] = nil
	end
	if tbl_31_upvr[Id] == arg1 then
		tbl_31_upvr[Id] = nil
	end
	arg1.Maid:Unlock(tbl_4_upvr)
	arg1.Maid:Cleanup()
	arg1.BoundInstance = nil
end
local function ReplicaToBindBuffer_upvr(arg1, arg2) -- Line 559, Named "ReplicaToBindBuffer"
	--[[ Upvalues[4]:
		[1]: ReplicaNew_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: ReplicaToBindBuffer_upvr (readonly)
		[4]: DestroyReplica_upvr (readonly)
	]]
	local ReplicaNew_upvr_result1_2 = ReplicaNew_upvr(arg1.Id, arg1.self_creation)
	tbl_31_upvr[arg1.Id] = ReplicaNew_upvr_result1_2
	for i_18 in pairs(arg1.Children) do
		ReplicaToBindBuffer_upvr(i_18, true)
	end
	if arg2 ~= true then
		DestroyReplica_upvr(arg1)
	end
	return ReplicaNew_upvr_result1_2
end
local function ReplicaFromBindBuffer_upvr(arg1, arg2) -- Line 580, Named "ReplicaFromBindBuffer"
	--[[ Upvalues[5]:
		[1]: tbl_31_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: tbl_13_upvr (readonly)
		[4]: ReplicaFromBindBuffer_upvr (readonly)
		[5]: tbl_29_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var599
	if var599 == nil then
		var599 = {}
	end
	tbl_31_upvr[arg1.Id] = nil
	local Token_5 = arg1.Token
	local var601 = tbl_upvr[Token_5]
	if var601 == nil then
		var601 = {}
		tbl_upvr[Token_5] = var601
	end
	var601[arg1] = true
	tbl_13_upvr[arg1.Id] = arg1
	table.insert(var599, arg1)
	for i_19 in pairs(arg1.Children) do
		ReplicaFromBindBuffer_upvr(i_19, var599)
	end
	if true == true then
		for _, v_9 in ipairs(var599) do
			local var608 = tbl_29_upvr[v_9.Token]
			if var608 ~= nil then
				for i_21 in pairs(var608) do
					ConnectionFire(i_21, v_9)
				end
			end
		end
	end
end
local function CreationScan_upvr(arg1, arg2, arg3) -- Line 621, Named "CreationScan"
	--[[ Upvalues[1]:
		[1]: CreationScan_upvr (readonly)
	]]
	local var614 = arg1[arg3]
	if var614 ~= nil then
		table.sort(var614, function(arg1_7, arg2_5) -- Line 625
			local var616
			if arg1_7.Id >= arg2_5.Id then
				var616 = false
			else
				var616 = true
			end
			return var616
		end)
		for _, v_10 in ipairs(var614) do
			arg2(v_10.Id, v_10.SelfCreation)
			CreationScan_upvr(arg1, arg2, v_10.Id)
		end
	end
end
local function BreadthCreationSort_upvr(arg1, arg2, arg3) -- Line 637, Named "BreadthCreationSort"
	--[[ Upvalues[1]:
		[1]: CreationScan_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local tbl_18 = {}
	local tbl_17 = {}
	local tbl_3 = {}
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 9. Error Block 90 start (CF ANALYSIS FAILED)
	local ipairs_result1_7, _, ipairs_result3_2 = ipairs(arg1)
	local var662
	for _, v_11 in ipairs_result1_7, var662, ipairs_result3_2 do
		for i_24, v_12 in pairs(v_11) do
			local tbl_27 = {
				Id = tonumber(i_24);
				SelfCreation = v_12;
			}
			local _4_5 = v_12[4]
			if _4_5 == 0 or tbl_27.Id == arg2 then
				table.insert(tbl_18, tbl_27)
			elseif v_11[tostring(_4_5)] ~= nil then
				local var668 = tbl_17[_4_5]
				if var668 == nil then
					var668 = {}
					tbl_17[_4_5] = var668
				end
				table.insert(var668, tbl_27)
			else
				table.insert(tbl_3, tbl_27)
			end
		end
	end
	var662 = tbl_18
	table.sort(var662, function(arg1_8, arg2_6) -- Line 688
		local var670
		if arg1_8.Id >= arg2_6.Id then
			var670 = false
		else
			var670 = true
		end
		return var670
	end)
	var662 = ipairs(tbl_18)
	local ipairs_result1_3, ipairs_result2, ipairs_result3_5 = ipairs(tbl_18)
	for i_25, v_13 in ipairs_result1_3, ipairs_result2, ipairs_result3_5 do
		arg3(v_13.Id, v_13.SelfCreation)
		CreationScan_upvr(tbl_17, arg3, v_13.Id)
	end
	ipairs_result1_3 = #tbl_3
	if ipairs_result1_3 ~= 0 then
		v_13 = script
		i_25 = v_13.Name
		ipairs_result1_3 = `[{i_25}]: GROUP REPLICATION ERROR - Missing parents for:\n`
		i_25 = 1
		v_13 = math.min(#tbl_3, 50)
		for i_26 = i_25, v_13 do
			v_13 = tbl_3[i_26]
			local SelfCreation = v_13.SelfCreation
			local var678
			for i_27, v_14 in pairs(SelfCreation[2]) do
				local var679
				if true == true then
					var679 = ""
				else
					var679 = ';'
				end
				var678 = var678..`{var679}{tostring(i_27)}={tostring(v_14)}`
			end
			ipairs_result1_3 = ipairs_result1_3..`[Id:{v_13.Id};ParentId:{SelfCreation[4]};Token:{SelfCreation[1]};Tags:{{var678}}]\n`
		end
		if 50 < #tbl_3 then
			i_26 = "(hiding %* more)\n"
			var678 = #tbl_3
			i_26 = i_26:format(50 - var678)
			ipairs_result1_3 = ipairs_result1_3..i_26
		end
		ipairs_result1_3 = ipairs_result1_3.."Traceback:\n"..debug.traceback()
		warn(ipairs_result1_3)
	end
	do
		return {}
	end
	-- KONSTANTERROR: [13] 9. Error Block 90 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 729, Named "GetInternalReplica"
	--[[ Upvalues[2]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
	]]
	local var680 = tbl_13_upvr[arg1]
	if not var680 then
		var680 = tbl_31_upvr[arg1]
	end
	if var680 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	return var680
end
any_New_result1_upvr_2.OnClientEvent:Connect(function() -- Line 739
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	if module_3_upvr.IsReady == true then
	else
		module_3_upvr.IsReady = true
		print(`[{script.Name}]: Initial data received`)
		module_3_upvr.OnLocalReady:Fire()
	end
end)
Remote.New("ReplicaSet").OnClientEvent:Connect(function(arg1, arg2, arg3) -- Line 751
	--[[ Upvalues[3]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: var410_upvw (read and write)
	]]
	local var683 = tbl_13_upvr[arg1]
	if not var683 then
		var683 = tbl_31_upvr[arg1]
	end
	if var683 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	local var684 = var683
	var410_upvw = true
	local pcall_result1_2, pcall_result2_3 = pcall(var684.Set, var684, arg2, arg3)
	var410_upvw = false
	if pcall_result1_2 ~= true then
		error(`[{script.Name}]: Error while updating replica:\n{var684:Identify()}\n`..pcall_result2_3)
	end
end)
Remote.New("ReplicaSetValues").OnClientEvent:Connect(function(arg1, arg2, arg3) -- Line 761
	--[[ Upvalues[3]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: var410_upvw (read and write)
	]]
	local var688 = tbl_13_upvr[arg1]
	if not var688 then
		var688 = tbl_31_upvr[arg1]
	end
	if var688 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	local var689 = var688
	var410_upvw = true
	local pcall_result1_5, pcall_result2_5 = pcall(var689.SetValues, var689, arg2, arg3)
	var410_upvw = false
	if pcall_result1_5 ~= true then
		error(`[{script.Name}]: Error while updating replica:\n{var689:Identify()}\n`..pcall_result2_5)
	end
end)
Remote.New("ReplicaTableInsert").OnClientEvent:Connect(function(arg1, arg2, arg3, arg4) -- Line 771
	--[[ Upvalues[3]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: var410_upvw (read and write)
	]]
	local var693 = tbl_13_upvr[arg1]
	if not var693 then
		var693 = tbl_31_upvr[arg1]
	end
	if var693 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	local var694 = var693
	var410_upvw = true
	local pcall_result1_4, pcall_result2_4 = pcall(var694.TableInsert, var694, arg2, arg3, arg4)
	var410_upvw = false
	if pcall_result1_4 ~= true then
		error(`[{script.Name}]: Error while updating replica:\n{var694:Identify()}\n`..pcall_result2_4)
	end
end)
Remote.New("ReplicaTableRemove").OnClientEvent:Connect(function(arg1, arg2, arg3) -- Line 781
	--[[ Upvalues[3]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: var410_upvw (read and write)
	]]
	local var698 = tbl_13_upvr[arg1]
	if not var698 then
		var698 = tbl_31_upvr[arg1]
	end
	if var698 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	local var699 = var698
	var410_upvw = true
	local pcall_result1_7, pcall_result2_8 = pcall(var699.TableRemove, var699, arg2, arg3)
	var410_upvw = false
	if pcall_result1_7 ~= true then
		error(`[{script.Name}]: Error while updating replica:\n{var699:Identify()}\n`..pcall_result2_8)
	end
end)
Remote.New("ReplicaWrite").OnClientEvent:Connect(function(arg1, arg2, ...) -- Line 791
	--[[ Upvalues[3]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: var410_upvw (read and write)
	]]
	local var703 = tbl_13_upvr[arg1]
	if not var703 then
		var703 = tbl_31_upvr[arg1]
	end
	if var703 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	local var704 = var703
	var410_upvw = true
	local pcall_result1_6, pcall_result2_6 = pcall(var704.Write, var704, var704.write_lib[arg2].Name, ...)
	var410_upvw = false
	if pcall_result1_6 ~= true then
		error(`[{script.Name}]: Error while updating replica:\n{var704:Identify()}\n`..pcall_result2_6)
	end
end)
local function RemoteSignalHandle(arg1, ...) -- Line 802
	--[[ Upvalues[2]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
	]]
	local var707 = tbl_13_upvr[arg1]
	if not var707 then
		var707 = tbl_31_upvr[arg1]
	end
	if var707 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	var707.OnClientEvent:Fire(...)
end
any_New_result1_upvr_5.OnClientEvent:Connect(RemoteSignalHandle)
any_New_result1_upvr_6.OnClientEvent:Connect(RemoteSignalHandle)
Remote.New("ReplicaParent").OnClientEvent:Connect(function(arg1, arg2) -- Line 810
	--[[ Upvalues[4]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: ReplicaFromBindBuffer_upvr (readonly)
		[4]: ReplicaToBindBuffer_upvr (readonly)
	]]
	local var709 = tbl_13_upvr[arg1]
	if not var709 then
		var709 = tbl_31_upvr[arg1]
	end
	if var709 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	local var710 = var709
	local Parent_3 = var710.Parent
	local var712 = tbl_13_upvr[arg2]
	if not var712 then
		var712 = tbl_31_upvr[arg2]
	end
	if var712 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg2}]`)
	end
	local var713 = var712
	Parent_3.Children[var710] = nil
	var713.Children[var710] = true
	var710.Parent = var713
	var710.self_creation[4] = arg2
	if tbl_31_upvr[Parent_3.Id] ~= nil and tbl_13_upvr[arg2] ~= nil then
		ReplicaFromBindBuffer_upvr(var710)
	elseif tbl_13_upvr[Parent_3.Id] ~= nil and tbl_31_upvr[arg2] ~= nil then
		ReplicaToBindBuffer_upvr(var710)
	end
end)
Remote.New("ReplicaCreate").OnClientEvent:Connect(function(arg1, arg2) -- Line 831
	--[[ Upvalues[7]:
		[1]: BreadthCreationSort_upvr (readonly)
		[2]: ReplicaNew_upvr (readonly)
		[3]: tbl_30_upvr (readonly)
		[4]: tbl_31_upvr (readonly)
		[5]: tbl_upvr (readonly)
		[6]: tbl_13_upvr (readonly)
		[7]: tbl_29_upvr (readonly)
	]]
	local tbl_15_upvr = {}
	BreadthCreationSort_upvr(arg1, arg2, function(arg1_9, arg2_7) -- Line 835
		--[[ Upvalues[6]:
			[1]: ReplicaNew_upvr (copied, readonly)
			[2]: tbl_30_upvr (copied, readonly)
			[3]: tbl_31_upvr (copied, readonly)
			[4]: tbl_upvr (copied, readonly)
			[5]: tbl_13_upvr (copied, readonly)
			[6]: tbl_15_upvr (readonly)
		]]
		local _4_2 = arg2_7[4]
		local ReplicaNew_upvr_result1 = ReplicaNew_upvr(arg1_9, arg2_7)
		local var722 = false
		if _4_2 == 0 then
			if ReplicaNew_upvr_result1.Tags.Bind == true then
				local var723 = tbl_30_upvr[arg1_9]
				ReplicaNew_upvr_result1.BoundInstance = var723
				if var723 == nil then
					var722 = true
					-- KONSTANTWARNING: GOTO [27] #21
				end
				-- KONSTANTWARNING: GOTO [27] #21
			end
		elseif tbl_31_upvr[_4_2] ~= nil then
			var722 = true
		end
		if var722 == true then
			tbl_31_upvr[arg1_9] = ReplicaNew_upvr_result1
		else
			local Token_4 = ReplicaNew_upvr_result1.Token
			local var725 = tbl_upvr[Token_4]
			if var725 == nil then
				var725 = {}
				tbl_upvr[Token_4] = var725
			end
			var725[ReplicaNew_upvr_result1] = true
			tbl_13_upvr[arg1_9] = ReplicaNew_upvr_result1
			table.insert(tbl_15_upvr, ReplicaNew_upvr_result1)
		end
	end)
	for _, v_15 in ipairs(tbl_15_upvr) do
		local var729 = tbl_29_upvr[v_15.Token]
		if var729 ~= nil then
			for i_29 in pairs(var729) do
				ConnectionFire(i_29, v_15)
			end
		end
	end
end)
Remote.New("ReplicaBind").OnClientEvent:Connect(function(arg1) -- Line 892
	--[[ Upvalues[4]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: tbl_30_upvr (readonly)
		[4]: ReplicaToBindBuffer_upvr (readonly)
	]]
	local var734 = tbl_13_upvr[arg1]
	if not var734 then
		var734 = tbl_31_upvr[arg1]
	end
	if var734 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	local var735 = var734
	var735.Tags.Bind = true
	local var736 = tbl_30_upvr[arg1]
	var735.BoundInstance = var736
	if var736 == nil then
		ReplicaToBindBuffer_upvr(var735)
	end
end)
Remote.New("ReplicaDestroy").OnClientEvent:Connect(function(arg1) -- Line 906
	--[[ Upvalues[3]:
		[1]: tbl_13_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: DestroyReplica_upvr (readonly)
	]]
	local var738 = tbl_13_upvr[arg1]
	if not var738 then
		var738 = tbl_31_upvr[arg1]
	end
	if var738 == nil then
		error(`[{script.Name}]: Received update for missing replica [Id:{arg1}]`)
	end
	DestroyReplica_upvr(var738)
end)
local function _(arg1) -- Line 913, Named "OnBindInstanceAdded"
	--[[ Upvalues[3]:
		[1]: tbl_30_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: ReplicaFromBindBuffer_upvr (readonly)
	]]
	local Value_9 = arg1.Value
	local Parent_4 = arg1.Parent
	tbl_30_upvr[Value_9] = Parent_4
	local var741 = tbl_31_upvr[Value_9]
	if var741 ~= nil then
		var741.BoundInstance = Parent_4
		ReplicaFromBindBuffer_upvr(var741)
	end
end
local function _(arg1) -- Line 928, Named "OnBindInstanceRemoved"
	--[[ Upvalues[3]:
		[1]: tbl_30_upvr (readonly)
		[2]: tbl_13_upvr (readonly)
		[3]: ReplicaToBindBuffer_upvr (readonly)
	]]
	local Value_8 = arg1.Value
	tbl_30_upvr[Value_8] = nil
	local var743 = tbl_13_upvr[Value_8]
	if var743 ~= nil then
		ReplicaToBindBuffer_upvr(var743)
	end
end
CollectionService_2:GetInstanceAddedSignal("REPLICA"):Connect(function(arg1) -- Line 941
	--[[ Upvalues[3]:
		[1]: tbl_30_upvr (readonly)
		[2]: tbl_31_upvr (readonly)
		[3]: ReplicaFromBindBuffer_upvr (readonly)
	]]
	if arg1:IsA("NumberValue") == true then
		local Value_7 = arg1.Value
		local Parent = arg1.Parent
		tbl_30_upvr[Value_7] = Parent
		local var747 = tbl_31_upvr[Value_7]
		if var747 ~= nil then
			var747.BoundInstance = Parent
			ReplicaFromBindBuffer_upvr(var747)
		end
	end
end)
CollectionService_2:GetInstanceRemovedSignal("REPLICA"):Connect(function(arg1) -- Line 947
	--[[ Upvalues[3]:
		[1]: tbl_30_upvr (readonly)
		[2]: tbl_13_upvr (readonly)
		[3]: ReplicaToBindBuffer_upvr (readonly)
	]]
	if arg1:IsA("NumberValue") == true then
		local Value_6 = arg1.Value
		tbl_30_upvr[Value_6] = nil
		local var750 = tbl_13_upvr[Value_6]
		if var750 ~= nil then
			ReplicaToBindBuffer_upvr(var750)
		end
	end
end)
for _, v_16 in pairs(CollectionService_2:GetTagged("REPLICA")) do
	if v_16:IsA("NumberValue") == true then
		local Value_4 = v_16.Value
		local Parent_2 = v_16.Parent
		tbl_30_upvr[Value_4] = Parent_2
		local var756 = tbl_31_upvr[Value_4]
		if var756 ~= nil then
			var756.BoundInstance = Parent_2
			ReplicaFromBindBuffer_upvr(var756)
		end
	end
end
return module_3_upvr