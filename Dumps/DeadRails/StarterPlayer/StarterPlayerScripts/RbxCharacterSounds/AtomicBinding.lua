--[[
    Script: StarterPlayer.StarterPlayerScripts.RbxCharacterSounds.AtomicBinding
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:26
-- Luau version 6, Types version 3
-- Time taken: 0.005295 seconds

local function parsePath_upvr(arg1) -- Line 4, Named "parsePath"
	local string_split_result1 = string.split(arg1, '/')
	for i = #string_split_result1, 1, -1 do
		if string_split_result1[i] == "" then
			table.remove(string_split_result1, i)
		end
	end
	return string_split_result1
end
local function _(arg1, arg2) -- Line 14, Named "isManifestResolved"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 15 start (CF ANALYSIS FAILED)
	local var7 = 0
	for _ in pairs(arg1) do
		var7 += 1
	end
	if var7 > arg2 then
		-- KONSTANTWARNING: GOTO [13] #11
	end
	-- KONSTANTERROR: [0] 1. Error Block 15 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 10. Error Block 18 start (CF ANALYSIS FAILED)
	assert(true, var7)
	if var7 ~= arg2 then
	else
	end
	do
		return true
	end
	-- KONSTANTERROR: [12] 10. Error Block 18 end (CF ANALYSIS FAILED)
end
local function unbindNodeDescend_upvr(arg1, arg2) -- Line 24, Named "unbindNodeDescend"
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	if arg1.instance == nil then
	else
		arg1.instance = nil
		local connections = arg1.connections
		if connections then
			for _, v_7 in ipairs(connections) do
				v_7:Disconnect()
			end
			table.clear(connections)
		end
		if arg2 and arg1.alias then
			arg2[arg1.alias] = nil
		end
		local children = arg1.children
		if children then
			for _, v_8 in pairs(children) do
				unbindNodeDescend_upvr(v_8, arg2)
			end
		end
	end
end
local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new(arg1, arg2) -- Line 54
	--[[ Upvalues[2]:
		[1]: parsePath_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local tbl = {}
	local var29 = 1
	for i_3, v in pairs(arg1) do
		tbl[i_3] = parsePath_upvr(v)
		var29 += 1
	end
	local module = {}
	module._boundFn = arg2
	module._parsedManifest = tbl
	module._manifestSizeTarget = var29
	module._dtorMap = {}
	module._connections = {}
	module._rootInstToRootNode = {}
	module._rootInstToManifest = {}
	return setmetatable(module, module_upvr)
end
function module_upvr._startBoundFn(arg1, arg2, arg3) -- Line 80
	local _dtorMap = arg1._dtorMap
	local var35 = _dtorMap[arg2]
	if var35 then
		var35()
		_dtorMap[arg2] = nil
	end
	local any__boundFn_result1 = arg1._boundFn(arg3)
	if any__boundFn_result1 then
		_dtorMap[arg2] = any__boundFn_result1
	end
end
function module_upvr._stopBoundFn(arg1, arg2) -- Line 96
	local _dtorMap_2 = arg1._dtorMap
	local var38 = _dtorMap_2[arg2]
	if var38 then
		var38()
		_dtorMap_2[arg2] = nil
	end
end
function module_upvr.bindRoot(arg1, arg2) -- Line 106
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	debug.profilebegin("AtomicBinding:BindRoot")
	local _parsedManifest = arg1._parsedManifest
	local _rootInstToManifest_2 = arg1._rootInstToManifest
	local var57
	if _rootInstToManifest_2[arg2] ~= nil then
		var57 = false
	else
		var57 = true
	end
	assert(var57)
	local tbl_upvr = {}
	_rootInstToManifest_2[arg2] = tbl_upvr
	var57 = debug.profilebegin
	var57("BuildTree")
	var57 = {}
	var57.alias = "root"
	var57.instance = arg2
	if next(_parsedManifest) then
		var57.children = {}
		var57.connections = {}
	end
	arg1._rootInstToRootNode[arg2] = var57
	for i_4, v_2 in pairs(_parsedManifest) do
		local var62 = var57
		for i_5, v_3 in ipairs(v_2) do
			local var66
			if i_5 ~= #v_2 then
				var66 = false
			else
				var66 = true
			end
			if not var62.children[v_3] then
				local tbl_2 = {}
				local var68
			end
			if var66 then
				var68 = tbl_2.alias
				if var68 ~= nil then
					var68 = error
					var68("Multiple aliases assigned to one instance")
				end
				tbl_2.alias = i_4
			else
				var68 = tbl_2.children
				if not var68 then
					var68 = {}
				end
				tbl_2.children = var68
				var68 = tbl_2.connections
				if not var68 then
					var68 = {}
				end
				tbl_2.connections = var68
			end
			var62.children[v_3] = tbl_2
		end
	end
	debug.profileend()
	local _manifestSizeTarget_upvr = arg1._manifestSizeTarget
	local function processNode_upvr(arg1_2) -- Line 160, Named "processNode"
		--[[ Upvalues[6]:
			[1]: tbl_upvr (readonly)
			[2]: processNode_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: arg2 (readonly)
			[5]: unbindNodeDescend_upvr (copied, readonly)
			[6]: _manifestSizeTarget_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local alias = arg1_2.alias
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 9. Error Block 2 start (CF ANALYSIS FAILED)
		tbl_upvr[alias] = assert(arg1_2.instance)
		-- KONSTANTERROR: [12] 9. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 11. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 11. Error Block 3 end (CF ANALYSIS FAILED)
	end
	debug.profilebegin("ResolveTree")
	processNode_upvr(var57)
	debug.profileend()
	debug.profileend()
end
function module_upvr.unbindRoot(arg1, arg2) -- Line 236
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	local _rootInstToRootNode = arg1._rootInstToRootNode
	local _rootInstToManifest = arg1._rootInstToManifest
	arg1:_stopBoundFn(arg2)
	local var73 = _rootInstToRootNode[arg2]
	if var73 then
		unbindNodeDescend_upvr(var73, assert(_rootInstToManifest[arg2]))
		_rootInstToRootNode[arg2] = nil
	end
	_rootInstToManifest[arg2] = nil
end
function module_upvr.destroy(arg1) -- Line 252
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	debug.profilebegin("AtomicBinding:destroy")
	for _, v_4 in pairs(arg1._dtorMap) do
		v_4:destroy()
	end
	table.clear(arg1._dtorMap)
	for _, v_5 in ipairs(arg1._connections) do
		v_5:Disconnect()
	end
	table.clear(arg1._connections)
	for i_8, v_6 in pairs(arg1._rootInstToRootNode) do
		unbindNodeDescend_upvr(v_6, assert(arg1._rootInstToManifest[i_8]))
		local _
	end
	table.clear(arg1._rootInstToManifest)
	table.clear(arg1._rootInstToRootNode)
	debug.profileend()
end
return module_upvr