--[[
    Script: ReplicatedStorage.Util.ZonePlus
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:42
-- Luau version 6, Types version 3
-- Time taken: 0.025031 seconds

local longstring1 = "Zone parts must belong to the 'Default' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts."
-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local RunService_upvr = game:GetService("RunService")
local var2
if RunService_upvr:IsClient() then
	local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
end
local enums_upvr = require(script.Enum).enums
local Janitor_upvr = require(script.Janitor)
local ZonePlusReference = require(script.ZonePlusReference)
local any_getObject_result1 = ZonePlusReference.getObject()
local ZoneController = script.ZoneController
local Tracker_upvr = ZoneController.Tracker
var2 = ZoneController
local var2_2_upvr = require(var2)
if game:GetService("RunService"):IsClient() then
	var2 = "Client"
else
	var2 = "Server"
end
if any_getObject_result1 then
	local SOME = any_getObject_result1:FindFirstChild(var2)
end
if SOME then
	return require(any_getObject_result1.Value)
end
local module_6_upvr = {}
module_6_upvr.__index = module_6_upvr
if not SOME then
	ZonePlusReference.addToReplicatedStorage()
end
module_6_upvr.enum = enums_upvr
local HttpService_upvr = game:GetService("HttpService")
local Signal_upvr = require(script.Signal)
function module_6_upvr.new(arg1) -- Line 34
	--[[ Upvalues[7]:
		[1]: module_6_upvr (readonly)
		[2]: enums_upvr (readonly)
		[3]: Janitor_upvr (readonly)
		[4]: HttpService_upvr (readonly)
		[5]: var2_2_upvr (readonly)
		[6]: Signal_upvr (readonly)
		[7]: LocalPlayer_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local module_2_upvr = {}
	setmetatable(module_2_upvr, module_6_upvr)
	local typeof_result1_2 = typeof(arg1)
	if typeof_result1_2 ~= "table" and typeof_result1_2 ~= "Instance" then
		error("The zone container must be a model, folder, basepart or table!")
	end
	module_2_upvr.accuracy = enums_upvr.Accuracy.High
	module_2_upvr.autoUpdate = true
	module_2_upvr.respectUpdateQueue = true
	local any_new_result1 = Janitor_upvr.new()
	module_2_upvr.janitor = any_new_result1
	module_2_upvr._updateConnections = any_new_result1:add(Janitor_upvr.new(), "destroy")
	module_2_upvr.container = arg1
	module_2_upvr.zoneParts = {}
	module_2_upvr.overlapParams = {}
	module_2_upvr.region = nil
	module_2_upvr.volume = nil
	module_2_upvr.boundMin = nil
	module_2_upvr.boundMax = nil
	module_2_upvr.recommendedMaxParts = nil
	module_2_upvr.zoneId = HttpService_upvr:GenerateGUID()
	module_2_upvr.activeTriggers = {}
	module_2_upvr.occupants = {}
	module_2_upvr.trackingTouchedTriggers = {}
	module_2_upvr.enterDetection = enums_upvr.Detection.Centre
	module_2_upvr.exitDetection = enums_upvr.Detection.Centre
	module_2_upvr._currentEnterDetection = nil
	module_2_upvr._currentExitDetection = nil
	module_2_upvr.totalPartVolume = 0
	module_2_upvr.allZonePartsAreBlocks = true
	module_2_upvr.trackedItems = {}
	module_2_upvr.settingsGroupName = nil
	module_2_upvr.worldModel = workspace
	module_2_upvr.onItemDetails = {}
	module_2_upvr.itemsToUntrack = {}
	var2_2_upvr.updateDetection(module_2_upvr)
	module_2_upvr.updated = any_new_result1:add(Signal_upvr.new(), "destroy")
	local tbl_4 = {"player", "part", "localPlayer", "item"}
	for _, v_upvr in pairs(tbl_4) do
		local var47_upvw = 0
		local var48_upvw = 0
		for _, v_2 in pairs({"entered", "exited"}) do
			local any_add_result1 = any_new_result1:add(Signal_upvr.new(true), "destroy")
			local var53_upvr = v_2:sub(1, 1):upper()..v_2:sub(2)
			module_2_upvr[v_upvr..var53_upvr] = any_add_result1
			any_add_result1.connectionsChanged:Connect(function(arg1_2) -- Line 105
				--[[ Upvalues[7]:
					[1]: v_upvr (readonly)
					[2]: LocalPlayer_upvr (copied, readonly)
					[3]: var53_upvr (readonly)
					[4]: var48_upvw (read and write)
					[5]: var47_upvw (read and write)
					[6]: var2_2_upvr (copied, readonly)
					[7]: module_2_upvr (readonly)
				]]
				if v_upvr == "localPlayer" and not LocalPlayer_upvr and arg1_2 == 1 then
					error("Can only connect to 'localPlayer%s' on the client!":format(var53_upvr))
				end
				var48_upvw = var47_upvw
				var47_upvw += arg1_2
				if var48_upvw == 0 and 0 < var47_upvw then
					var2_2_upvr._registerConnection(module_2_upvr, v_upvr, var53_upvr)
				elseif 0 < var48_upvw and var47_upvw == 0 then
					var2_2_upvr._deregisterConnection(module_2_upvr, v_upvr)
				end
			end)
			local var55
		end
	end
	module_6_upvr.touchedConnectionActions = {}
	for _, v_3 in pairs(tbl_4) do
		local var59_upvr = module_2_upvr["_%sTouchedZone":format(v_3)]
		if var59_upvr then
			module_2_upvr.trackingTouchedTriggers[v_3] = {}
			module_6_upvr.touchedConnectionActions[v_3] = function(arg1_3) -- Line 129
				--[[ Upvalues[2]:
					[1]: var59_upvr (readonly)
					[2]: module_2_upvr (readonly)
				]]
				var59_upvr(module_2_upvr, arg1_3)
			end
		end
	end
	module_2_upvr:_update()
	var2_2_upvr._registerZone(module_2_upvr)
	var55:add(function() -- Line 140
		--[[ Upvalues[2]:
			[1]: var2_2_upvr (copied, readonly)
			[2]: module_2_upvr (readonly)
		]]
		var2_2_upvr._deregisterZone(module_2_upvr)
	end, true)
	return module_2_upvr
end
function module_6_upvr.fromRegion(arg1, arg2) -- Line 147
	--[[ Upvalues[1]:
		[1]: module_6_upvr (readonly)
	]]
	local Model_upvr = Instance.new("Model")
	local function createCube_upvr(arg1_4, arg2_2) -- Line 150, Named "createCube"
		--[[ Upvalues[2]:
			[1]: createCube_upvr (readonly)
			[2]: Model_upvr (readonly)
		]]
		if 2024 < arg2_2.X or 2024 < arg2_2.Y or 2024 < arg2_2.Z then
			local var63 = arg2_2 * 0.25
			local var64 = arg2_2 * 0.5
			createCube_upvr(arg1_4 * CFrame.new(-var63.X, -var63.Y, -var63.Z), var64)
			createCube_upvr(arg1_4 * CFrame.new(-var63.X, -var63.Y, var63.Z), var64)
			createCube_upvr(arg1_4 * CFrame.new(-var63.X, var63.Y, -var63.Z), var64)
			createCube_upvr(arg1_4 * CFrame.new(-var63.X, var63.Y, var63.Z), var64)
			createCube_upvr(arg1_4 * CFrame.new(var63.X, -var63.Y, -var63.Z), var64)
			createCube_upvr(arg1_4 * CFrame.new(var63.X, -var63.Y, var63.Z), var64)
			createCube_upvr(arg1_4 * CFrame.new(var63.X, var63.Y, -var63.Z), var64)
			createCube_upvr(arg1_4 * CFrame.new(var63.X, var63.Y, var63.Z), var64)
		else
			local Part_2 = Instance.new("Part")
			Part_2.CFrame = arg1_4
			Part_2.Size = arg2_2
			Part_2.Anchored = true
			Part_2.Parent = Model_upvr
		end
	end
	createCube_upvr(arg1, arg2)
	local any_new_result1_2 = module_6_upvr.new(Model_upvr)
	any_new_result1_2:relocate()
	return any_new_result1_2
end
function module_6_upvr._calculateRegion(arg1, arg2, arg3) -- Line 179
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tbl_2 = {
		Min = {};
		Max = {};
	}
	for i_4_upvr, v_4 in pairs(tbl_2) do
		v_4.Values = {}
		function v_4.parseCheck(arg1_5, arg2_3) -- Line 183
			--[[ Upvalues[1]:
				[1]: i_4_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var111 = i_4_upvr
			if var111 == "Min" then
				if arg1_5 > arg2_3 then
					var111 = false
				else
					var111 = true
				end
				return var111
			end
			var111 = i_4_upvr
			if var111 == "Max" then
				if arg2_3 > arg1_5 then
				else
				end
				return true
			end
		end
		function v_4.parse(arg1_6, arg2_4) -- Line 190
			for i_5, v_5 in pairs(arg2_4) do
				if arg1_6.parseCheck(v_5, arg1_6.Values[i_5] or v_5) then
					arg1_6.Values[i_5] = v_5
				end
			end
		end
	end
	for _, v_6 in pairs(arg2) do
		local var120 = v_6.Size * 0.5
		for _, v_7 in pairs({v_6.CFrame * CFrame.new(-var120.X, -var120.Y, -var120.Z), v_6.CFrame * CFrame.new(-var120.X, -var120.Y, var120.Z), v_6.CFrame * CFrame.new(-var120.X, var120.Y, -var120.Z), v_6.CFrame * CFrame.new(-var120.X, var120.Y, var120.Z), v_6.CFrame * CFrame.new(var120.X, -var120.Y, -var120.Z), v_6.CFrame * CFrame.new(var120.X, -var120.Y, var120.Z), v_6.CFrame * CFrame.new(var120.X, var120.Y, -var120.Z), v_6.CFrame * CFrame.new(var120.X, var120.Y, var120.Z)}) do
			local any_GetComponents_result1, any_GetComponents_result2, any_GetComponents_result3 = v_7:GetComponents()
			local tbl_6 = {any_GetComponents_result1, any_GetComponents_result2, any_GetComponents_result3}
			tbl_2.Min:parse(tbl_6)
			tbl_2.Max:parse(tbl_6)
		end
	end
	local function _(arg1_7) -- Line 222, Named "roundToFour"
		return math.floor((arg1_7 + 2) / 4) * 4
	end
	for i_8, v_8 in pairs(tbl_2) do
		local var135
		for _, v_9 in pairs(v_8.Values) do
			if i_8 ~= "Min" or not {} then
			end
			if not arg3 then
				if i_8 == "Min" then
					var135 = -2
				else
					var135 = 2
				end
			end
			table.insert({}, math.floor((v_9 + var135 + 2) / 4) * 4)
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local vector3_2 = Vector3.new(unpack({}))
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local vector3 = Vector3.new(unpack({}))
	return Region3.new(vector3_2, vector3), vector3_2, vector3
end
function module_6_upvr._displayBounds(arg1) -- Line 245
	if not arg1.displayBoundParts then
		arg1.displayBoundParts = true
		for i_10, v_10 in pairs({
			BoundMin = arg1.boundMin;
			BoundMax = arg1.boundMax;
		}) do
			local Part = Instance.new("Part")
			Part.Anchored = true
			Part.CanCollide = false
			Part.Transparency = 0.5
			Part.Size = Vector3.new(1, 1, 1)
			Part.Color = Color3.fromRGB(255, 0, 0)
			Part.CFrame = CFrame.new(v_10)
			Part.Name = i_10
			Part.Parent = workspace
			arg1.janitor:add(Part, "Destroy")
		end
	end
end
function module_6_upvr._update(arg1) -- Line 264
	--[[ Upvalues[1]:
		[1]: RunService_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local container_2 = arg1.container
	local tbl = {}
	local var203_upvw = 0
	arg1._updateConnections:clean()
	local typeof_result1 = typeof(container_2)
	local tbl_7 = {}
	local var206
	if typeof_result1 == "table" then
		var206 = pairs(container_2)
		local pairs_result1_11, pairs_result2_20, pairs_result3 = pairs(container_2)
		for _, v_11 in pairs_result1_11, pairs_result2_20, pairs_result3 do
			if v_11:IsA("BasePart") then
				table.insert(tbl, v_11)
			end
		end
	elseif typeof_result1 == "Instance" then
		pairs_result1_11 = container_2:IsA("BasePart")
		if pairs_result1_11 then
			pairs_result1_11 = table.insert
			pairs_result1_11(tbl, container_2)
		else
			pairs_result1_11 = table.insert
			pairs_result1_11(tbl_7, container_2)
			pairs_result1_11 = pairs(container_2:GetDescendants())
			local pairs_result1_13, pairs_result2, pairs_result3_16 = pairs(container_2:GetDescendants())
			for _, v_24 in pairs_result1_13, pairs_result2, pairs_result3_16 do
				if v_24:IsA("BasePart") then
					table.insert(tbl, v_24)
				else
					table.insert(tbl_7, v_24)
				end
			end
		end
	end
	arg1.zoneParts = tbl
	pairs_result1_13 = {}
	arg1.overlapParams = pairs_result1_13
	pairs_result1_13 = true
	for _, v_12_upvr in pairs(tbl) do
		local _, pcall_result2_3 = pcall(function() -- Line 298
			--[[ Upvalues[1]:
				[1]: v_12_upvr (readonly)
			]]
			return v_12_upvr.Shape.Name
		end)
		if pcall_result2_3 ~= "Block" then
			pairs_result1_13 = false
		end
	end
	arg1.allZonePartsAreBlocks = pairs_result1_13
	local OverlapParams_new_result1_2 = OverlapParams.new()
	OverlapParams_new_result1_2.FilterType = Enum.RaycastFilterType.Whitelist
	OverlapParams_new_result1_2.MaxParts = #tbl
	OverlapParams_new_result1_2.FilterDescendantsInstances = tbl
	arg1.overlapParams.zonePartsWhitelist = OverlapParams_new_result1_2
	local OverlapParams_new_result1 = OverlapParams.new()
	OverlapParams_new_result1.FilterType = Enum.RaycastFilterType.Blacklist
	OverlapParams_new_result1.FilterDescendantsInstances = tbl
	arg1.overlapParams.zonePartsIgnorelist = OverlapParams_new_result1
	local function _(arg1_8) -- Line 340, Named "verifyDefaultCollision"
		if arg1_8.CollisionGroupId ~= 0 then
			error(longstring1)
		end
	end
	for _, v_13_upvr in pairs(tbl) do
		for _, v_14 in pairs({"Size", "Position"}) do
			arg1._updateConnections:add(v_13_upvr:GetPropertyChangedSignal(v_14):Connect(function() -- Line 318, Named "update"
				--[[ Upvalues[3]:
					[1]: arg1 (readonly)
					[2]: var203_upvw (read and write)
					[3]: RunService_upvr (copied, readonly)
				]]
				if arg1.autoUpdate then
					local os_clock_result1_2_upvw = os.clock()
					if arg1.respectUpdateQueue then
						var203_upvw += 1
						os_clock_result1_2_upvw += 0.1
					end
					local var223_upvw
					var223_upvw = RunService_upvr.Heartbeat:Connect(function() -- Line 326
						--[[ Upvalues[4]:
							[1]: os_clock_result1_2_upvw (read and write)
							[2]: var223_upvw (read and write)
							[3]: arg1 (copied, readonly)
							[4]: var203_upvw (copied, read and write)
						]]
						if os_clock_result1_2_upvw <= os.clock() then
							var223_upvw:Disconnect()
							if arg1.respectUpdateQueue then
								var203_upvw -= 1
							end
							if var203_upvw == 0 and arg1.zoneId then
								arg1:_update()
							end
						end
					end)
				end
			end), "Disconnect")
			local _
		end
		if v_13_upvr.CollisionGroupId ~= 0 then
			error(longstring1)
		end
		arg1._updateConnections:add(v_13_upvr:GetPropertyChangedSignal("CollisionGroupId"):Connect(function() -- Line 350
			--[[ Upvalues[1]:
				[1]: v_13_upvr (readonly)
			]]
			if v_13_upvr.CollisionGroupId ~= 0 then
				error(longstring1)
			end
		end), "Disconnect")
	end
	for _, _ in pairs(tbl_7) do
		for _, v_16 in pairs({"ChildAdded", "ChildRemoved"}) do
			arg1._updateConnections:add(arg1.container[v_16]:Connect(function(arg1_9) -- Line 357
				--[[ Upvalues[3]:
					[1]: arg1 (readonly)
					[2]: var203_upvw (read and write)
					[3]: RunService_upvr (copied, readonly)
				]]
				if arg1_9:IsA("BasePart") and arg1.autoUpdate then
					local os_clock_result1_upvw = os.clock()
					if arg1.respectUpdateQueue then
						var203_upvw += 1
						os_clock_result1_upvw += 0.1
					end
					local var243_upvw
					var243_upvw = RunService_upvr.Heartbeat:Connect(function() -- Line 326
						--[[ Upvalues[4]:
							[1]: os_clock_result1_upvw (read and write)
							[2]: var243_upvw (read and write)
							[3]: arg1 (copied, readonly)
							[4]: var203_upvw (copied, read and write)
						]]
						if os_clock_result1_upvw <= os.clock() then
							var243_upvw:Disconnect()
							if arg1.respectUpdateQueue then
								var203_upvw -= 1
							end
							if var203_upvw == 0 and arg1.zoneId then
								arg1:_update()
							end
						end
					end)
				end
			end), "Disconnect")
		end
	end
	local any__calculateRegion_result1, any__calculateRegion_result2, any__calculateRegion_result3 = arg1:_calculateRegion(tbl)
	local any__calculateRegion_result1_2, _, _ = arg1:_calculateRegion(tbl, true)
	arg1.region = any__calculateRegion_result1
	arg1.exactRegion = any__calculateRegion_result1_2
	arg1.boundMin = any__calculateRegion_result2
	arg1.boundMax = any__calculateRegion_result3
	local Size = any__calculateRegion_result1.Size
	arg1.volume = Size.X * Size.Y * Size.Z
	arg1:_updateTouchedConnections()
	arg1.updated:Fire()
end
function module_6_upvr._updateOccupants(arg1, arg2, arg3) -- Line 393
	local var259 = arg1.occupants[arg2]
	if not var259 then
		var259 = {}
		arg1.occupants[arg2] = var259
	end
	local module_5 = {}
	for i_17, v_17 in pairs(var259) do
		local var264 = arg3[i_17]
		if var264 == nil or var264 ~= v_17 then
			var259[i_17] = nil
			if not module_5.exited then
				module_5.exited = {}
			end
			table.insert(module_5.exited, i_17)
		end
	end
	for i_18, _ in pairs(arg3) do
		local var268
		if var259[i_18] == nil then
			local function INLINED() -- Internal function, doesn't exist in bytecode
				var268 = i_18.Character
				return var268
			end
			if not i_18:IsA("Player") or not INLINED() then
				var268 = true
			end
			var259[i_18] = var268
			var268 = module_5.entered
			if not var268 then
				var268 = {}
				module_5.entered = var268
			end
			var268 = table.insert
			var268(module_5.entered, i_18)
		end
	end
	return module_5
end
function module_6_upvr._formTouchedConnection(arg1, arg2) -- Line 423
	--[[ Upvalues[1]:
		[1]: Janitor_upvr (readonly)
	]]
	local var269 = "_touchedJanitor"..arg2
	if arg1[var269] then
		arg1[var269]:clean()
	else
		arg1[var269] = arg1.janitor:add(Janitor_upvr.new(), "destroy")
	end
	arg1:_updateTouchedConnection(arg2)
end
function module_6_upvr._updateTouchedConnection(arg1, arg2) -- Line 435
	local var274 = arg1["_touchedJanitor"..arg2]
	if not var274 then
	else
		for _, v_25 in pairs(arg1.zoneParts) do
			var274:add(v_25.Touched:Connect(arg1.touchedConnectionActions[arg2], arg1), "Disconnect")
		end
	end
end
function module_6_upvr._updateTouchedConnections(arg1) -- Line 444
	for i_19, _ in pairs(arg1.touchedConnectionActions) do
		local var283 = arg1["_touchedJanitor"..i_19]
		if var283 then
			var283:cleanup()
			arg1:_updateTouchedConnection(i_19)
		end
	end
end
function module_6_upvr._disconnectTouchedConnection(arg1, arg2) -- Line 455
	local var284 = "_touchedJanitor"..arg2
	local var285 = arg1[var284]
	if var285 then
		var285:cleanup()
		arg1[var284] = nil
	end
end
local function _(arg1, arg2) -- Line 464, Named "round"
	return math.round(arg1 * 10 ^ arg2) * 10 ^ (-arg2)
end
local Heartbeat_upvr = RunService_upvr.Heartbeat
function module_6_upvr._partTouchedZone(arg1, arg2) -- Line 467
	--[[ Upvalues[3]:
		[1]: Janitor_upvr (readonly)
		[2]: Heartbeat_upvr (readonly)
		[3]: enums_upvr (readonly)
	]]
	local part_upvr = arg1.trackingTouchedTriggers.part
	if part_upvr[arg2] then
	else
		local any_add_result1_upvr = arg1.janitor:add(Janitor_upvr.new(), "destroy")
		part_upvr[arg2] = any_add_result1_upvr
		if not ({
			Seat = true;
			VehicleSeat = true;
		})[arg2.ClassName] and ({
			HumanoidRootPart = true;
		})[arg2.Name] then
			arg2.CanTouch = false
		end
		local var291_upvr = math.round(arg2.Size.X * arg2.Size.Y * arg2.Size.Z * 100000) * 0.00001
		arg1.totalPartVolume += var291_upvr
		local const_number_upvw = 0
		local var294_upvw = false
		local Position_upvw = arg2.Position
		local os_clock_result1_upvw_2 = os.clock()
		any_add_result1_upvr:add(Heartbeat_upvr:Connect(function() -- Line 485
			--[[ Upvalues[8]:
				[1]: const_number_upvw (read and write)
				[2]: enums_upvr (copied, readonly)
				[3]: arg1 (readonly)
				[4]: arg2 (readonly)
				[5]: var294_upvw (read and write)
				[6]: Position_upvw (read and write)
				[7]: os_clock_result1_upvw_2 (read and write)
				[8]: any_add_result1_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			local os_clock_result1 = os.clock()
			local var298 = const_number_upvw
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [44] 35. Error Block 7 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [44] 35. Error Block 7 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [54] 42. Error Block 8 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [54] 42. Error Block 8 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [63] 49. Error Block 13 start (CF ANALYSIS FAILED)
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [63.2]
			if not nil then
				var294_upvw = false
				Position_upvw = arg2.Position
				os_clock_result1_upvw_2 = os.clock()
				arg1.partExited:Fire(arg2)
			end
			-- KONSTANTERROR: [63] 49. Error Block 13 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [81] 63. Error Block 12 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [81] 63. Error Block 12 end (CF ANALYSIS FAILED)
		end), "Disconnect")
		any_add_result1_upvr:add(function() -- Line 516
			--[[ Upvalues[4]:
				[1]: part_upvr (readonly)
				[2]: arg2 (readonly)
				[3]: arg1 (readonly)
				[4]: var291_upvr (readonly)
			]]
			part_upvr[arg2] = nil
			arg2.CanTouch = true
			arg1.totalPartVolume = math.round((arg1.totalPartVolume - var291_upvr) * 100000) * 0.00001
		end, true)
	end
end
local tbl_upvr = {
	Ball = function(arg1) -- Line 524
		return "GetPartBoundsInRadius", {arg1.Position, arg1.Size.X}
	end;
	Block = function(arg1) -- Line 527
		return "GetPartBoundsInBox", {arg1.CFrame, arg1.Size}
	end;
	Other = function(arg1) -- Line 530
		local module_4 = {}
		module_4[1] = arg1
		return "GetPartsInPart", module_4
	end;
}
function module_6_upvr._getRegionConstructor(arg1, arg2, arg3) -- Line 534
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local pcall_result1, pcall_result2 = pcall(function() -- Line 535
		--[[ Upvalues[1]:
			[1]: arg2 (readonly)
		]]
		return arg2.Shape.Name
	end)
	local var320
	if pcall_result1 then
		if arg1.allZonePartsAreBlocks then
			local var321 = tbl_upvr[pcall_result2]
			if var321 then
				local var321_result1, var321_result2 = var321(arg2)
				var320 = var321_result2
			end
		end
	end
	if not var321_result1 then
		local any_Other_result1, any_Other_result2 = tbl_upvr.Other(arg2)
		var320 = any_Other_result2
	end
	if arg3 then
		table.insert(var320, arg3)
	end
	return any_Other_result1, var320
end
function module_6_upvr.findLocalPlayer(arg1) -- Line 555
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	if not LocalPlayer_upvr then
		error("Can only call 'findLocalPlayer' on the client!")
	end
	return arg1:findPlayer(LocalPlayer_upvr)
end
function module_6_upvr._find(arg1, arg2, arg3) -- Line 562
	--[[ Upvalues[1]:
		[1]: var2_2_upvr (readonly)
	]]
	var2_2_upvr.updateDetection(arg1)
	for _, v_20 in pairs(var2_2_upvr.getTouchingZones(arg3, false, arg1._currentEnterDetection, var2_2_upvr.trackers[arg2])) do
		if v_20 == arg1 then
			return true
		end
	end
	return false
end
function module_6_upvr.findPlayer(arg1, arg2) -- Line 574
	local var332 = arg2.Character
	if var332 then
		var332 = arg2.Character:FindFirstChildOfClass("Humanoid")
	end
	if not var332 then
		return false
	end
	return arg1:_find("player", arg2.Character)
end
function module_6_upvr.findItem(arg1, arg2) -- Line 583
	return arg1:_find("item", arg2)
end
function module_6_upvr.findPart(arg1, arg2) -- Line 587
	local any__getRegionConstructor_result1_2, any__getRegionConstructor_result2_2 = arg1:_getRegionConstructor(arg2, arg1.overlapParams.zonePartsWhitelist)
	local any_any_result1_2 = arg1.worldModel[any__getRegionConstructor_result1_2](arg1.worldModel, unpack(any__getRegionConstructor_result2_2))
	if 0 < #any_any_result1_2 then
		return true, any_any_result1_2
	end
	return false
end
function module_6_upvr.getCheckerPart(arg1) -- Line 597
	--[[ Upvalues[1]:
		[1]: var2_2_upvr (readonly)
	]]
	local var336
	if not arg1.checkerPart then
		var336 = arg1.janitor:add(Instance.new("Part"), "Destroy")
		local var337 = var336
		var336 = Vector3.new(0.10000, 0.10000, 0.10000)
		var337.Size = var336
		var336 = "ZonePlusCheckerPart"
		var337.Name = var336
		var336 = true
		var337.Anchored = var336
		var336 = 1
		var337.Transparency = var336
		var336 = false
		var337.CanCollide = var336
		arg1.checkerPart = var337
	end
	var336 = arg1.worldModel
	if var336 == workspace then
		var336 = var2_2_upvr.getWorkspaceContainer()
	end
	if var337.Parent ~= var336 then
		var337.Parent = var336
	end
	return var337
end
function module_6_upvr.findPoint(arg1, arg2) -- Line 618
	local var338 = arg2
	if typeof(arg2) == "Vector3" then
		var338 = CFrame.new(arg2)
	end
	local any_getCheckerPart_result1 = arg1:getCheckerPart()
	any_getCheckerPart_result1.CFrame = var338
	local any__getRegionConstructor_result1, any__getRegionConstructor_result2 = arg1:_getRegionConstructor(any_getCheckerPart_result1, arg1.overlapParams.zonePartsWhitelist)
	local any_any_result1 = arg1.worldModel[any__getRegionConstructor_result1](arg1.worldModel, unpack(any__getRegionConstructor_result2))
	if 0 < #any_any_result1 then
		return true, any_any_result1
	end
	return false
end
function module_6_upvr._getAll(arg1, arg2) -- Line 635
	--[[ Upvalues[1]:
		[1]: var2_2_upvr (readonly)
	]]
	var2_2_upvr.updateDetection(arg1)
	local module_3 = {}
	local var349 = var2_2_upvr._getZonesAndItems(arg2, {
		self = true;
	}, arg1.volume, false, arg1._currentEnterDetection)[arg1]
	if var349 then
		for i_21, _ in pairs(var349) do
			table.insert(module_3, i_21)
		end
	end
	return module_3
end
function module_6_upvr.getPlayers(arg1) -- Line 648
	return arg1:_getAll("player")
end
function module_6_upvr.getItems(arg1) -- Line 652
	return arg1:_getAll("item")
end
function module_6_upvr.getParts(arg1) -- Line 656
	local module = {}
	if arg1.activeTriggers.part then
		for i_22, _ in pairs(arg1.trackingTouchedTriggers.part) do
			table.insert(module, i_22)
		end
		return module
	end
	for _, v_23 in pairs(arg1.worldModel:GetPartBoundsInBox(arg1.region.CFrame, arg1.region.Size, arg1.overlapParams.zonePartsIgnorelist)) do
		if arg1:findPart(v_23) then
			table.insert(module, v_23)
		end
	end
	return module
end
function module_6_upvr.getRandomPoint(arg1) -- Line 677
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Size_2 = arg1.exactRegion.Size
	local random_state = Random.new()
	local var371
	repeat
		var371 = arg1.exactRegion.CFrame * CFrame.new(random_state:NextNumber(-Size_2.X / 2, Size_2.X / 2), random_state:NextNumber(-Size_2.Y / 2, Size_2.Y / 2), random_state:NextNumber(-Size_2.Z / 2, Size_2.Z / 2))
		local any_findPoint_result1, any_findPoint_result2 = arg1:findPoint(var371)
		local var374
		if any_findPoint_result1 then
			var374 = true
		end
	until var374
	return var371.Position, any_findPoint_result2
end
function module_6_upvr.setAccuracy(arg1, arg2) -- Line 696
	--[[ Upvalues[1]:
		[1]: enums_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 11 start (CF ANALYSIS FAILED)
	local tonumber_result1_2 = tonumber(arg2)
	if not tonumber_result1_2 then
		tonumber_result1_2 = enums_upvr.Accuracy[arg2]
		if not tonumber_result1_2 then
			error("'%s' is an invalid enumName!":format(arg2))
			-- KONSTANTWARNING: GOTO [36] #29
		end
	elseif not enums_upvr.Accuracy.getName(tonumber_result1_2) then
		error("%s is an invalid enumId!":format(tonumber_result1_2))
	end
	-- KONSTANTERROR: [0] 1. Error Block 11 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 29. Error Block 7 start (CF ANALYSIS FAILED)
	arg1.accuracy = tonumber_result1_2
	-- KONSTANTERROR: [36] 29. Error Block 7 end (CF ANALYSIS FAILED)
end
function module_6_upvr.setDetection(arg1, arg2) -- Line 712
	--[[ Upvalues[1]:
		[1]: enums_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 11 start (CF ANALYSIS FAILED)
	local tonumber_result1 = tonumber(arg2)
	if not tonumber_result1 then
		tonumber_result1 = enums_upvr.Detection[arg2]
		if not tonumber_result1 then
			error("'%s' is an invalid enumName!":format(arg2))
			-- KONSTANTWARNING: GOTO [36] #29
		end
	elseif not enums_upvr.Detection.getName(tonumber_result1) then
		error("%s is an invalid enumId!":format(tonumber_result1))
	end
	-- KONSTANTERROR: [0] 1. Error Block 11 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 29. Error Block 7 start (CF ANALYSIS FAILED)
	arg1.enterDetection = tonumber_result1
	arg1.exitDetection = tonumber_result1
	-- KONSTANTERROR: [36] 29. Error Block 7 end (CF ANALYSIS FAILED)
end
function module_6_upvr.trackItem(arg1, arg2) -- Line 729
	--[[ Upvalues[2]:
		[1]: Janitor_upvr (readonly)
		[2]: Tracker_upvr (readonly)
	]]
	local children = arg2:IsA("BasePart")
	local var378 = false
	if not children then
		local class_Humanoid = arg2:FindFirstChildOfClass("Humanoid")
		if class_Humanoid then
			class_Humanoid = arg2:FindFirstChild("HumanoidRootPart")
		end
		var378 = class_Humanoid
	end
	assert(children or var378, "Only BaseParts or Characters/NPCs can be tracked!")
	if arg1.trackedItems[arg2] then
	else
		if arg1.itemsToUntrack[arg2] then
			arg1.itemsToUntrack[arg2] = nil
		end
		local any_add_result1_2 = arg1.janitor:add(Janitor_upvr.new(), "destroy")
		local tbl_3 = {
			janitor = any_add_result1_2;
		}
		tbl_3.item = arg2
		tbl_3.isBasePart = children
		tbl_3.isCharacter = var378
		arg1.trackedItems[arg2] = tbl_3
		any_add_result1_2:add(arg2.AncestryChanged:Connect(function() -- Line 754
			--[[ Upvalues[2]:
				[1]: arg2 (readonly)
				[2]: arg1 (readonly)
			]]
			if not arg2:IsDescendantOf(game) then
				arg1:untrackItem(arg2)
			end
		end), "Disconnect")
		require(Tracker_upvr).itemAdded:Fire(tbl_3)
	end
end
function module_6_upvr.untrackItem(arg1, arg2) -- Line 764
	--[[ Upvalues[1]:
		[1]: Tracker_upvr (readonly)
	]]
	local var383 = arg1.trackedItems[arg2]
	if var383 then
		var383.janitor:destroy()
	end
	arg1.trackedItems[arg2] = nil
	require(Tracker_upvr).itemRemoved:Fire(var383)
end
function module_6_upvr.bindToGroup(arg1, arg2) -- Line 775
	--[[ Upvalues[1]:
		[1]: var2_2_upvr (readonly)
	]]
	arg1:unbindFromGroup()
	local any_getGroup_result1 = var2_2_upvr.getGroup(arg2)
	if not any_getGroup_result1 then
		any_getGroup_result1 = var2_2_upvr.setGroup(arg2)
	end
	any_getGroup_result1._memberZones[arg1.zoneId] = arg1
	arg1.settingsGroupName = arg2
end
function module_6_upvr.unbindFromGroup(arg1) -- Line 782
	--[[ Upvalues[1]:
		[1]: var2_2_upvr (readonly)
	]]
	if arg1.settingsGroupName then
		local any_getGroup_result1_2 = var2_2_upvr.getGroup(arg1.settingsGroupName)
		if any_getGroup_result1_2 then
			any_getGroup_result1_2._memberZones[arg1.zoneId] = nil
		end
		arg1.settingsGroupName = nil
	end
end
local CollectiveWorldModel_upvr = ZoneController.CollectiveWorldModel
function module_6_upvr.relocate(arg1) -- Line 792
	--[[ Upvalues[1]:
		[1]: CollectiveWorldModel_upvr (readonly)
	]]
	if arg1.hasRelocated then
	else
		local any_setupWorldModel_result1 = require(CollectiveWorldModel_upvr).setupWorldModel(arg1)
		arg1.worldModel = any_setupWorldModel_result1
		arg1.hasRelocated = true
		local container = arg1.container
		if typeof(container) == "table" then
			container = Instance.new("Folder")
			for _, v_26 in pairs(arg1.zoneParts) do
				v_26.Parent = container
			end
		end
		arg1.relocationContainer = arg1.janitor:add(container, "Destroy", "RelocationContainer")
		container.Parent = any_setupWorldModel_result1
	end
end
function module_6_upvr._onItemCallback(arg1, arg2, arg3, arg4, arg5) -- Line 813
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	local tbl_5 = {}
	arg1.onItemDetails[arg4] = tbl_5
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 7. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_6_upvr.onItemEnter(arg1, ...) -- Line 860
	arg1:_onItemCallback("itemEntered", true, ...)
end
function module_6_upvr.onItemExit(arg1, ...) -- Line 864
	arg1:_onItemCallback("itemExited", false, ...)
end
function module_6_upvr.destroy(arg1) -- Line 868
	arg1:unbindFromGroup()
	arg1.janitor:destroy()
end
module_6_upvr.Destroy = module_6_upvr.destroy
return module_6_upvr