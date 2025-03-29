--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.LoaderUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:32
-- Luau version 6, Types version 3
-- Time taken: 0.006846 seconds

local Parent_upvr = script.Parent
local BounceTemplateUtils_upvr = require(script.Parent.BounceTemplateUtils)
local ScriptInfoUtils_upvr = require(script.Parent.ScriptInfoUtils)
local Utils = require(script.Parent.Utils)
local module_upvr = {
	Utils = Utils;
	ContextTypes = Utils.readonly({
		CLIENT = "client";
		SERVER = "server";
	});
	IncludeBehavior = Utils.readonly({
		NO_INCLUDE = "noInclude";
		INCLUDE_ONLY = "includeOnly";
		INCLUDE_SHARED = "includeShared";
	});
}
local PackageInfoUtils_upvr = require(script.Parent.PackageInfoUtils)
local GroupInfoUtils_upvr = require(script.Parent.GroupInfoUtils)
function module_upvr.toWallyFormat(arg1, arg2) -- Line 26
	--[[ Upvalues[4]:
		[1]: module_upvr (readonly)
		[2]: ScriptInfoUtils_upvr (readonly)
		[3]: PackageInfoUtils_upvr (readonly)
		[4]: GroupInfoUtils_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var18
	if typeof(arg1) ~= "Instance" then
		var18 = false
	else
		var18 = true
	end
	assert(var18, "Bad instance")
	if type(arg2) ~= "boolean" then
		var18 = false
	else
		var18 = true
	end
	assert(var18, "Bad isPlugin")
	local tbl = {}
	var18 = module_upvr.discoverTopLevelPackages
	var18(tbl, arg1)
	var18 = module_upvr.injectLoader
	var18(tbl)
	var18 = {}
	if not arg2 or not ScriptInfoUtils_upvr.ModuleReplicationTypes.PLUGIN then
	end
	for i, v in pairs(tbl) do
		table.insert(var18, PackageInfoUtils_upvr.getOrCreatePackageInfo(v, {}, "", ScriptInfoUtils_upvr.ModuleReplicationTypes.SHARED))
		local _
	end
	PackageInfoUtils_upvr.fillDependencySet(var18)
	if arg2 then
		v = ScriptInfoUtils_upvr
		i = v.ModuleReplicationTypes
		i = "Folder"
		local any_2 = Instance.new(i)
		i = "PluginPackages"
		any_2.Name = i
		v = module_upvr
		i = v.reifyGroupList
		v = GroupInfoUtils_upvr.groupPackageInfos(var18, i.PLUGIN)
		i(v, module_upvr.getPublishPackageInfoSet(var18), any_2, ScriptInfoUtils_upvr.ModuleReplicationTypes.PLUGIN)
		return any_2
	end
	local any_getPublishPackageInfoSet_result1 = module_upvr.getPublishPackageInfoSet(var18)
	local Folder_3 = Instance.new("Folder")
	Folder_3.Name = "Packages"
	local Folder_2 = Instance.new("Folder")
	Folder_2.Name = "SharedPackages"
	local Folder = Instance.new("Folder")
	Folder.Name = "Packages"
	module_upvr.reifyGroupList(GroupInfoUtils_upvr.groupPackageInfos(var18, ScriptInfoUtils_upvr.ModuleReplicationTypes.CLIENT), any_getPublishPackageInfoSet_result1, Folder_3, ScriptInfoUtils_upvr.ModuleReplicationTypes.CLIENT)
	module_upvr.reifyGroupList(GroupInfoUtils_upvr.groupPackageInfos(var18, ScriptInfoUtils_upvr.ModuleReplicationTypes.SERVER), any_getPublishPackageInfoSet_result1, Folder, ScriptInfoUtils_upvr.ModuleReplicationTypes.SERVER)
	module_upvr.reifyGroupList(GroupInfoUtils_upvr.groupPackageInfos(var18, ScriptInfoUtils_upvr.ModuleReplicationTypes.SHARED), any_getPublishPackageInfoSet_result1, Folder_2, ScriptInfoUtils_upvr.ModuleReplicationTypes.SHARED)
	return Folder_3, Folder, Folder_2
end
function module_upvr.isPackage(arg1) -- Line 86
	--[[ Upvalues[1]:
		[1]: ScriptInfoUtils_upvr (readonly)
	]]
	local var33
	if typeof(arg1) ~= "Instance" then
		var33 = false
	else
		var33 = true
	end
	assert(var33, "Bad instance")
	var33 = arg1:GetChildren()
	for _, v_2 in pairs(var33) do
		if v_2:IsA("Folder") and (v_2.Name == "Server" or v_2.Name == "Client" or v_2.Name == "Shared" or v_2.Name == ScriptInfoUtils_upvr.DEPENDENCY_FOLDER_NAME) then
			return true
		end
	end
	return false
end
function module_upvr.injectLoader(arg1) -- Line 103
	--[[ Upvalues[1]:
		[1]: Parent_upvr (readonly)
	]]
	for _, v_3 in pairs(arg1) do
		if v_3 == Parent_upvr or Parent_upvr:IsDescendantOf(v_3) then return end
	end
	table.insert(arg1, Parent_upvr)
end
function module_upvr.discoverTopLevelPackages(arg1, arg2) -- Line 115
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 36 start (CF ANALYSIS FAILED)
	local var42
	if type(arg1) ~= "table" then
		var42 = false
	else
		var42 = true
	end
	assert(var42, "Bad packages")
	if typeof(arg2) ~= "Instance" then
		var42 = false
	else
		var42 = true
	end
	assert(var42, "Bad instance")
	var42 = module_upvr
	var42 = arg2
	-- KONSTANTERROR: [0] 1. Error Block 36 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 28. Error Block 10 start (CF ANALYSIS FAILED)
	var42 = arg1
	table.insert(var42, arg2)
	do
		return
	end
	-- KONSTANTERROR: [36] 28. Error Block 10 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [44] 34. Error Block 11 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [44] 34. Error Block 11 end (CF ANALYSIS FAILED)
end
function module_upvr.reifyGroupList(arg1, arg2, arg3, arg4) -- Line 143
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: BounceTemplateUtils_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 43 start (CF ANALYSIS FAILED)
	local var43
	if type(arg1) ~= "table" then
		var43 = false
	else
		var43 = true
	end
	assert(var43, "Bad groupInfoList")
	if type(arg2) ~= "table" then
		var43 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 43 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 46 start (CF ANALYSIS FAILED)
	var43 = true
	assert(var43, "Bad publishSet")
	if typeof(arg3) ~= "Instance" then
		var43 = false
		-- KONSTANTWARNING: GOTO [39] #30
	end
	-- KONSTANTERROR: [23] 18. Error Block 46 end (CF ANALYSIS FAILED)
end
function module_upvr.getPublishPackageInfoSet(arg1) -- Line 169
	local module = {}
	for _, v_4 in pairs(arg1) do
		module[v_4] = true
		for i_5, _ in pairs(v_4.explicitDependencySet) do
			module[i_5] = true
		end
	end
	return module
end
function module_upvr.needToReify(arg1, arg2) -- Line 181
	for _, v_6 in pairs(arg1.packageScriptInfoMap) do
		if v_6.replicationMode == arg2 then
			return true
		end
	end
	return false
end
function module_upvr.reifyGroup(arg1, arg2, arg3) -- Line 191
	--[[ Upvalues[2]:
		[1]: Parent_upvr (readonly)
		[2]: BounceTemplateUtils_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 60 start (CF ANALYSIS FAILED)
	local var81
	if type(arg1) ~= "table" then
		var81 = false
	else
		var81 = true
	end
	assert(var81, "Bad groupInfo")
	if typeof(arg2) ~= "Instance" then
		var81 = false
		-- KONSTANTWARNING: GOTO [24] #19
	end
	-- KONSTANTERROR: [0] 1. Error Block 60 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 18. Error Block 65 start (CF ANALYSIS FAILED)
	var81 = true
	assert(var81, "Bad parent")
	if type(arg3) ~= "string" then
		var81 = false
	else
		var81 = true
	end
	assert(var81, "Bad replicationMode")
	var81 = "Folder"
	var81 = assert(next(arg1.packageSet).fullName, "Bad package fullName")
	Instance.new(var81).Name = var81
	var81 = pairs(arg1.packageScriptInfoMap)
	local _, _, _ = pairs(arg1.packageScriptInfoMap)
	-- KONSTANTERROR: [23] 18. Error Block 65 end (CF ANALYSIS FAILED)
end
return module_upvr