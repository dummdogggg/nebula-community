--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.PackageInfoUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:41
-- Luau version 6, Types version 3
-- Time taken: 0.006400 seconds

local ScriptInfoUtils_upvr = require(script.Parent.ScriptInfoUtils)
local Utils_upvr = require(script.Parent.Utils)
local module_upvr = {
	createPackageInfo = function(arg1, arg2, arg3, arg4) -- Line 15, Named "createPackageInfo"
		--[[ Upvalues[1]:
			[1]: Utils_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
		local var4
		if typeof(arg1) ~= "Instance" then
			var4 = false
		else
			var4 = true
		end
		assert(var4, "Bad packageFolder")
		if type(arg2) ~= "table" then
			var4 = false
			-- KONSTANTWARNING: GOTO [24] #19
		end
		-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [23] 18. Error Block 29 start (CF ANALYSIS FAILED)
		var4 = true
		assert(var4, "Bad explicitDependencySet")
		if type(arg3) ~= "table" then
			var4 = false
			-- KONSTANTWARNING: GOTO [39] #30
		end
		-- KONSTANTERROR: [23] 18. Error Block 29 end (CF ANALYSIS FAILED)
	end;
	createDependencyQueueInfo = function(arg1, arg2) -- Line 31, Named "createDependencyQueueInfo"
		--[[ Upvalues[1]:
			[1]: Utils_upvr (readonly)
		]]
		local var5
		if type(arg1) ~= "table" then
			var5 = false
		else
			var5 = true
		end
		assert(var5, "Bad packageInfo")
		if type(arg2) ~= "table" then
			var5 = false
		else
			var5 = true
		end
		assert(var5, "Bad implicitDependencySet")
		var5 = Utils_upvr
		var5 = {}
		var5.packageInfo = arg1
		var5.implicitDependencySet = arg2
		return var5.readonly(var5)
	end;
}
local Queue_upvr = require(script.Parent.Queue)
function module_upvr.fillDependencySet(arg1) -- Line 41
	--[[ Upvalues[2]:
		[1]: Queue_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local var15
	if type(arg1) ~= "table" then
		var15 = false
	else
		var15 = true
	end
	assert(var15, "Bad packageInfoList")
	var15 = Queue_upvr
	local any_new_result1 = var15.new()
	var15 = {}
	local tbl = {}
	for i, v in pairs(arg1) do
		if not var15[v] then
			tbl[v] = v
			var15[v] = true
			any_new_result1:PushRight(module_upvr.createDependencyQueueInfo(v, tbl))
		end
	end
	while not any_new_result1:IsEmpty() do
		local any_PopLeft_result1 = any_new_result1:PopLeft()
		i = any_PopLeft_result1.packageInfo
		assert(not i.dependencySet, "Already wrote dependencySet")
		local any_computePackageDependencySet_result1 = module_upvr.computePackageDependencySet(any_PopLeft_result1.packageInfo, any_PopLeft_result1.implicitDependencySet)
		any_PopLeft_result1.packageInfo.dependencySet = any_computePackageDependencySet_result1
		v = any_PopLeft_result1.packageInfo
		for i_2, _ in pairs(v.explicitDependencySet) do
			if not var15[i_2] then
				var15[i_2] = true
				any_new_result1:PushRight(module_upvr.createDependencyQueueInfo(i_2, any_computePackageDependencySet_result1))
			end
		end
	end
end
local LoaderConstants_upvr = require(script.Parent.LoaderConstants)
function module_upvr.computePackageDependencySet(arg1, arg2) -- Line 79
	--[[ Upvalues[1]:
		[1]: LoaderConstants_upvr (readonly)
	]]
	local var39
	if type(arg1) ~= "table" then
		var39 = false
	else
		var39 = true
	end
	assert(var39, "Bad packageInfo")
	if type(arg2) ~= "table" then
		var39 = false
	else
		var39 = true
	end
	assert(var39, "Bad implicitDependencySet")
	var39 = LoaderConstants_upvr.INCLUDE_IMPLICIT_DEPENDENCIES
	if var39 then
		var39 = pairs(arg2)
		local pairs_result1_6, pairs_result2_4, pairs_result3_4 = pairs(arg2)
		for i_3, _ in pairs_result1_6, pairs_result2_4, pairs_result3_4 do
			({})[i_3.name] = i_3
			local var44
		end
	end
	pairs_result1_6 = pairs(arg1.explicitDependencySet)
	local pairs_result1_5, pairs_result2_3, pairs_result3 = pairs(arg1.explicitDependencySet)
	for i_4, _ in pairs_result1_5, pairs_result2_3, pairs_result3 do
		var44[i_4.name] = i_4
	end
	pairs_result1_5 = arg1.name
	var44[pairs_result1_5] = nil
	pairs_result1_5 = {}
	for _, v_5 in pairs(var44) do
		pairs_result1_5[v_5] = true
	end
	return pairs_result1_5
end
function module_upvr.getOrCreatePackageInfo(arg1, arg2, arg3, arg4) -- Line 110
	--[[ Upvalues[2]:
		[1]: ScriptInfoUtils_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
	local var51
	if typeof(arg1) ~= "Instance" then
		var51 = false
	else
		var51 = true
	end
	assert(var51, "Bad packageFolder")
	if type(arg2) ~= "table" then
		var51 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 33 start (CF ANALYSIS FAILED)
	var51 = true
	assert(var51, "Bad packageInfoMap")
	if type(arg3) ~= "string" then
		var51 = false
	else
		var51 = true
	end
	assert(var51, "Bad scope")
	var51 = arg4
	assert(var51, "No defaultReplicationType")
	if arg2[arg1] then
		return arg2[arg1]
	end
	var51 = ScriptInfoUtils_upvr
	local any_createScriptInfoLookup_result1 = var51.createScriptInfoLookup()
	var51 = ScriptInfoUtils_upvr.populateScriptInfoLookup
	var51(arg1, any_createScriptInfoLookup_result1, arg4)
	var51 = {}
	local var53
	if arg3 == "" then
		var53 = arg1.Name
	else
		var53 = arg3..'/'..arg1.Name
	end
	local any_createPackageInfo_result1 = module_upvr.createPackageInfo(arg1, var51, any_createScriptInfoLookup_result1, var53)
	arg2[arg1] = any_createPackageInfo_result1
	module_upvr.fillExplicitPackageDependencySet(var51, arg1, arg2, arg4)
	do
		return any_createPackageInfo_result1
	end
	-- KONSTANTERROR: [23] 18. Error Block 33 end (CF ANALYSIS FAILED)
end
function module_upvr.getPackageInfoListFromDependencyFolder(arg1, arg2, arg3) -- Line 148
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var71 = false
	if typeof(arg1) == "Instance" then
		var71 = arg1:IsA("Folder")
	end
	assert(var71, "Bad folder")
	if type(arg2) ~= "table" then
		var71 = false
	else
		var71 = true
	end
	assert(var71, "Bad packageInfoMap")
	var71 = arg3
	assert(var71, "No defaultReplicationType")
	var71 = pairs(arg1:GetChildren())
	for _, v_6 in pairs(arg1:GetChildren()) do
		if v_6:IsA("Folder") then
			if v_6.Name:sub(1, 1) == '@' then
				for i_7, v_7 in pairs(v_6:GetChildren()) do
					module_upvr.tryLoadPackageFromInstance({}, arg2, v_7, v_6.Name, arg3)
					local var78
				end
			else
				i_7 = ""
				v_7 = arg3
				module_upvr.tryLoadPackageFromInstance(var78, arg2, v_6, i_7, v_7)
			end
		else
			warn("Unknown instance in dependencyFolder - %q":format(v_6:GetFullName()))
		end
	end
	return var78
end
local BounceTemplateUtils_upvr = require(script.Parent.BounceTemplateUtils)
function module_upvr.tryLoadPackageFromInstance(arg1, arg2, arg3, arg4, arg5) -- Line 176
	--[[ Upvalues[2]:
		[1]: BounceTemplateUtils_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 48 start (CF ANALYSIS FAILED)
	local var80
	if type(arg1) ~= "table" then
		var80 = false
	else
		var80 = true
	end
	assert(var80, "Bad packageInfoList")
	if type(arg2) ~= "table" then
		var80 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 48 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 51 start (CF ANALYSIS FAILED)
	var80 = true
	assert(var80, "Bad packageInfoMap")
	if typeof(arg3) ~= "Instance" then
		var80 = false
		-- KONSTANTWARNING: GOTO [39] #30
	end
	-- KONSTANTERROR: [23] 18. Error Block 51 end (CF ANALYSIS FAILED)
end
function module_upvr.fillExplicitPackageDependencySet(arg1, arg2, arg3, arg4) -- Line 206
	--[[ Upvalues[2]:
		[1]: ScriptInfoUtils_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 32 start (CF ANALYSIS FAILED)
	local var89
	if type(arg1) ~= "table" then
		var89 = false
	else
		var89 = true
	end
	assert(var89, "Bad explicitDependencySet")
	if typeof(arg2) ~= "Instance" then
		var89 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 32 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 34 start (CF ANALYSIS FAILED)
	var89 = true
	assert(var89, "Bad packageFolder")
	if type(arg3) ~= "table" then
		var89 = false
	else
		var89 = true
	end
	assert(var89, "Bad packageInfoMap")
	var89 = arg4
	assert(var89, "No defaultReplicationType")
	var89 = arg2:GetChildren()
	for _, v_8 in pairs(var89) do
		if v_8:IsA("Folder") and v_8.Name == ScriptInfoUtils_upvr.DEPENDENCY_FOLDER_NAME then
			for _, v_9 in pairs(module_upvr.getPackageInfoListFromDependencyFolder(v_8, arg3, arg4)) do
				arg1[v_9] = true
			end
		end
	end
	-- KONSTANTERROR: [23] 18. Error Block 34 end (CF ANALYSIS FAILED)
end
return module_upvr