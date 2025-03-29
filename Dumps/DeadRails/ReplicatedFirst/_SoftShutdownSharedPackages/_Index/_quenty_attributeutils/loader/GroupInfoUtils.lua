--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.GroupInfoUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:20
-- Luau version 6, Types version 3
-- Time taken: 0.005015 seconds

local module_2_upvr = {}
local Utils_upvr = require(script.Parent.Utils)
function module_2_upvr.createGroupInfo() -- Line 13
	--[[ Upvalues[1]:
		[1]: Utils_upvr (readonly)
	]]
	return Utils_upvr.readonly({
		scriptInfoMap = {};
		packageScriptInfoMap = {};
		packageSet = {};
	})
end
local Queue_upvr = require(script.Parent.Queue)
local LoaderConstants_upvr = require(script.Parent.LoaderConstants)
function module_2_upvr.groupPackageInfos(arg1, arg2) -- Line 21
	--[[ Upvalues[3]:
		[1]: Queue_upvr (readonly)
		[2]: module_2_upvr (readonly)
		[3]: LoaderConstants_upvr (readonly)
	]]
	local var14
	if type(arg1) ~= "table" then
		var14 = false
	else
		var14 = true
	end
	assert(var14, "Bad packageInfoList")
	if type(arg2) ~= "string" then
		var14 = false
	else
		var14 = true
	end
	assert(var14, "Bad replicationMode")
	var14 = Queue_upvr
	local any_new_result1 = var14.new()
	var14 = {}
	for i, v in pairs(arg1) do
		if not var14[v] then
			var14[v] = true
			any_new_result1:PushRight(v)
		end
	end
	local module = {}
	while not any_new_result1:IsEmpty() do
		local any_PopLeft_result1 = any_new_result1:PopLeft()
		v = module_2_upvr
		i = v.hasAnythingToReplicate
		v = any_PopLeft_result1
		i = i(v, arg2)
		if i then
			v = module_2_upvr
			i = v.canAddPackageInfoToGroup
			v = module_2_upvr.createGroupInfo()
			i = i(v, any_PopLeft_result1, arg2)
			local var21
			if i then
				v = module_2_upvr
				i = v.addPackageInfoToGroup
				v = var21
				i(v, any_PopLeft_result1, arg2)
				v = LoaderConstants_upvr
				i = v.GROUP_EACH_PACKAGE_INDIVIDUALLY
				if i then
					v = module
					i = table.insert
					i(v, var21)
					v = module_2_upvr
					i = v.createGroupInfo()
					var21 = i
					local var22 = var21
					-- KONSTANTWARNING: GOTO [138] #108
				end
			else
				v = LoaderConstants_upvr
				i = v.ALLOW_MULTIPLE_GROUPS
				if i then
					v = module
					i = table.insert
					i(v, var22)
					v = module_2_upvr
					i = v.createGroupInfo()
					var22 = i
					v = module_2_upvr
					i = v.addPackageInfoToGroup
					v = var22
					i(v, any_PopLeft_result1, arg2)
				else
					v = module_2_upvr
					i = v.addPackageInfoToGroup
					v = var22
					i(v, any_PopLeft_result1, arg2)
					i = error
					v = "Cannot add package to group"
					i(v)
				end
			end
		end
		i = pairs
		v = any_PopLeft_result1.dependencySet
		i = i(v)
		for i_2, _ in i(v) do
			if not var14[i_2] then
				var14[i_2] = true
				any_new_result1:PushRight(i_2)
			end
		end
	end
	if next(var22.packageSet) then
		table.insert(module, var22)
	end
	return module
end
function module_2_upvr.hasAnythingToReplicate(arg1, arg2) -- Line 75
	local var26
	if next(arg1.scriptInfoLookup[arg2]) == nil then
		var26 = false
	else
		var26 = true
	end
	return var26
end
function module_2_upvr.canAddScriptInfoToGroup(arg1, arg2, arg3, arg4) -- Line 79
	-- KONSTANTERROR: [0] 1. Error Block 35 start (CF ANALYSIS FAILED)
	local var27
	if type(arg1) ~= "table" then
		var27 = false
	else
		var27 = true
	end
	assert(var27, "Bad groupInfo")
	if type(arg2) ~= "table" then
		var27 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 35 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 38 start (CF ANALYSIS FAILED)
	var27 = true
	assert(var27, "Bad scriptInfo")
	if type(arg3) ~= "string" then
		var27 = false
		-- KONSTANTWARNING: GOTO [39] #30
	end
	-- KONSTANTERROR: [23] 18. Error Block 38 end (CF ANALYSIS FAILED)
end
function module_2_upvr.canAddPackageInfoToGroup(arg1, arg2, arg3) -- Line 98
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 39 start (CF ANALYSIS FAILED)
	local var40
	if type(arg1) ~= "table" then
		var40 = false
	else
		var40 = true
	end
	assert(var40, "Bad groupInfo")
	if type(arg2) ~= "table" then
		var40 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 39 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 43 start (CF ANALYSIS FAILED)
	var40 = true
	assert(var40, "Bad packageInfo")
	if type(arg3) ~= "string" then
		var40 = false
	else
		var40 = true
	end
	assert(var40, "Bad replicationMode")
	local tbl = {}
	var40 = pairs(arg2.scriptInfoLookup[arg3])
	local pairs_result1_5, pairs_result2_4, pairs_result3_2 = pairs(arg2.scriptInfoLookup[arg3])
	for i_3, v_3 in pairs_result1_5, pairs_result2_4, pairs_result3_2 do
		if module_2_upvr.canAddScriptInfoToGroup(arg1, v_3, i_3, tbl) then
			tbl[i_3] = v_3
		else
			return false
		end
	end
	pairs_result1_5 = pairs(arg2.dependencySet)
	local pairs_result1_4, pairs_result2_2, pairs_result3_6 = pairs(arg2.dependencySet)
	for i_4, _ in pairs_result1_4, pairs_result2_2, pairs_result3_6 do
		if not arg1.packageSet[i_4] then
			for i_5, v_5 in pairs(i_4.scriptInfoLookup[arg3]) do
				if module_2_upvr.canAddScriptInfoToGroup(arg1, v_5, i_5, tbl) then
					tbl[i_5] = v_5
				else
					return false
				end
			end
		end
	end
	pairs_result1_4 = true
	do
		return pairs_result1_4
	end
	-- KONSTANTERROR: [23] 18. Error Block 43 end (CF ANALYSIS FAILED)
end
function module_2_upvr.addScriptToGroup(arg1, arg2, arg3) -- Line 132
	-- KONSTANTERROR: [0] 1. Error Block 25 start (CF ANALYSIS FAILED)
	local var51
	if type(arg1) ~= "table" then
		var51 = false
	else
		var51 = true
	end
	assert(var51, "Bad groupInfo")
	if type(arg3) ~= "table" then
		var51 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 25 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 27 start (CF ANALYSIS FAILED)
	var51 = true
	assert(var51, "Bad scriptInfo")
	if type(arg2) ~= "string" then
		var51 = false
	else
		var51 = true
	end
	assert(var51, "Bad scriptName")
	var51 = arg1.scriptInfoMap
	local var52 = var51[arg2]
	if var52 and var52 ~= arg3 then
		var51 = error
		var51("Cannot add to package group, conflicting scriptInfo for %q already there":format(arg2))
	end
	var51 = arg1.scriptInfoMap
	var51[arg2] = arg3
	-- KONSTANTERROR: [23] 18. Error Block 27 end (CF ANALYSIS FAILED)
end
function module_2_upvr.addPackageInfoToGroup(arg1, arg2, arg3) -- Line 146
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	arg1.packageSet[arg2] = true
	for i_6, v_6 in pairs(arg2.scriptInfoLookup[arg3]) do
		module_2_upvr.addScriptToGroup(arg1, i_6, v_6)
		arg1.packageScriptInfoMap[i_6] = v_6
	end
	for i_7, _ in pairs(arg2.dependencySet) do
		if not arg1.packageSet[i_7] then
			for i_8, v_8 in pairs(i_7.scriptInfoLookup[arg3]) do
				module_2_upvr.addScriptToGroup(arg1, i_8, v_8)
			end
		end
	end
end
return module_2_upvr