--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Table
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:08
-- Luau version 6, Types version 3
-- Time taken: 0.005417 seconds

local module_7_upvr = {
	append = function(arg1, arg2) -- Line 15, Named "append"
		for _, v in pairs(arg2) do
			arg1[#arg1 + 1] = v
		end
		return arg1
	end;
	merge = function(arg1, arg2) -- Line 30, Named "merge"
		local module_9 = {}
		for i_2, v_2 in pairs(arg1) do
			module_9[i_2] = v_2
		end
		for i_3, v_3 in pairs(arg2) do
			module_9[i_3] = v_3
		end
		return module_9
	end;
	reverse = function(arg1) -- Line 47, Named "reverse"
		local module_10 = {}
		for i_4 = #arg1, 1, -1 do
			table.insert(module_10, arg1[i_4])
		end
		return module_10
	end;
	values = function(arg1) -- Line 61, Named "values"
		local module_2 = {}
		for _, v_4 in pairs(arg1) do
			table.insert(module_2, v_4)
		end
		return module_2
	end;
	keys = function(arg1) -- Line 75, Named "keys"
		local module_3 = {}
		for i_6, _ in pairs(arg1) do
			table.insert(module_3, i_6)
		end
		return module_3
	end;
	mergeLists = function(arg1, arg2) -- Line 90, Named "mergeLists"
		local module = {}
		for _, v_6 in pairs(arg1) do
			table.insert(module, v_6)
		end
		for _, v_7 in pairs(arg2) do
			table.insert(module, v_7)
		end
		return module
	end;
	swapKeyValue = function(arg1) -- Line 107, Named "swapKeyValue"
		local module_8 = {}
		for i_9, v_8 in pairs(arg1) do
			module_8[v_8] = i_9
		end
		return module_8
	end;
	toList = function(arg1) -- Line 121, Named "toList"
		local module_11 = {}
		for _, v_9 in pairs(arg1) do
			table.insert(module_11, v_9)
		end
		return module_11
	end;
	count = function(arg1) -- Line 136, Named "count"
		local var76 = 0
		for _, _ in pairs(arg1) do
			var76 += 1
		end
		return var76
	end;
	copy = table.clone;
}
function module_7_upvr.deepCopy(arg1, arg2) -- Line 161
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var88 = arg2
	if not var88 then
		var88 = {}
	end
	local var89 = var88
	if var89[arg1] then
		return var89[arg1]
	end
	if type(arg1) == "table" then
		local module_4 = {}
		var89[arg1] = module_4
		for i_12, v_11 in pairs(arg1) do
			module_4[module_7_upvr.deepCopy(i_12, var89)] = module_7_upvr.deepCopy(v_11, var89)
			local var94
		end
		return setmetatable(module_4, module_7_upvr.deepCopy(getmetatable(arg1), var94))
	end
	return arg1
end
function module_7_upvr.deepOverwrite(arg1, arg2) -- Line 185
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	for i_13, v_12 in pairs(arg2) do
		if type(arg1[i_13]) == "table" and type(v_12) == "table" then
			arg1[i_13] = module_7_upvr.deepOverwrite(arg1[i_13], v_12)
		else
			arg1[i_13] = v_12
		end
	end
	return arg1
end
function module_7_upvr.getIndex(arg1, arg2) -- Line 203
	if arg2 == nil then
	else
	end
	assert(true, "Needle cannot be nil")
	for i_14, v_13 in pairs(arg1) do
		if arg2 == v_13 then
			return i_14
		end
	end
	return nil
end
function module_7_upvr.stringify(arg1, arg2, arg3) -- Line 222
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var115 = arg3
	if not var115 then
		var115 = tostring(arg1)
	end
	local var116 = arg2 or 0
	for i_15, v_14 in pairs(arg1) do
		if type(v_14) == "table" then
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		end
	end
	return module_7_upvr.stringify(v_14, var116 + 1, var115..'\n'..string.rep("  ", var116)..tostring(i_15)..": ")..'\n'..string.rep("  ", var116)..tostring(i_15)..": "..tostring(v_14)
end
function module_7_upvr.contains(arg1, arg2) -- Line 244
	for _, v_15 in pairs(arg1) do
		if v_15 == arg2 then
			return true
		end
	end
	return false
end
function module_7_upvr.overwrite(arg1, arg2) -- Line 261
	for i_17, v_16 in pairs(arg2) do
		arg1[i_17] = v_16
	end
	return arg1
end
function module_7_upvr.take(arg1, arg2) -- Line 278
	local module_6 = {}
	for i_18 = 1, math.min(#arg1, arg2) do
		module_6[i_18] = arg1[i_18]
	end
	return module_6
end
local function errorOnIndex(arg1, arg2) -- Line 286
	error("Bad index %q":format(tostring(arg2)), 2)
end
local module_5_upvr = {
	__index = errorOnIndex;
	__newindex = errorOnIndex;
}
function module_7_upvr.readonly(arg1) -- Line 302
	--[[ Upvalues[1]:
		[1]: module_5_upvr (readonly)
	]]
	return setmetatable(arg1, module_5_upvr)
end
function module_7_upvr.deepReadonly(arg1) -- Line 312
	--[[ Upvalues[1]:
		[1]: module_7_upvr (readonly)
	]]
	for _, v_17 in pairs(arg1) do
		if type(v_17) == "table" then
			module_7_upvr.deepReadonly(v_17)
		end
	end
	return module_7_upvr.readonly(arg1)
end
return module_7_upvr