--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader.LegacyLoader
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:21
-- Luau version 6, Types version 3
-- Time taken: 0.002963 seconds

local module_upvr = {
	ClassName = "LegacyLoader";
}
module_upvr.__index = module_upvr
function module_upvr.new(arg1) -- Line 20
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return setmetatable({
		_script = assert(arg1, "No script");
		_container = false;
		_locked = false;
		_lookupMap = {};
	}, module_upvr)
end
function module_upvr.Lock(arg1) -- Line 29
	assert(not arg1._container, "Cannot bootstrap game when legacy loader was already used")
	arg1._locked = true
end
local Loader_upvr = require(script.Parent.Loader)
function module_upvr.GetLoader(arg1, arg2) -- Line 34
	--[[ Upvalues[1]:
		[1]: Loader_upvr (readonly)
	]]
	return Loader_upvr.new(arg2)
end
function module_upvr.Require(arg1, arg2) -- Line 38
	assert(not arg1._locked, "Cannot use legacy loader after already transformed")
	arg1:_setupIfNeeded()
	if type(arg2) == "number" then
		return require(arg2)
	end
	if type(arg2) == "string" then
		local var4 = arg1._lookupMap[arg2]
		if var4 then
			return require(var4)
		end
		error("Error: Library '"..tostring(arg2).."' does not exist.", 2)
	else
		if typeof(arg2) == "Instance" and arg2:IsA("ModuleScript") then
			return require(arg2)
		end
		error("Error: module must be a string or ModuleScript, got '%s' for '%s'":format(typeof(arg2), tostring(arg2)))
	end
end
local BounceTemplateUtils_upvr = require(script.Parent.BounceTemplateUtils)
function module_upvr._buildLookupContainer(arg1) -- Line 60
	--[[ Upvalues[1]:
		[1]: BounceTemplateUtils_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local pairs_result1_2, pairs_result2_2, pairs_result3 = pairs(arg1._container:GetDescendants())
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [66] 48. Error Block 11 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [66] 48. Error Block 11 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 7. Error Block 19 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [66.6]
	if nil then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not nil then
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [66.7]
			if nil then
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil ~= nil then
					-- KONSTANTWARNING: GOTO [66] #48
				end
			else
			end
		end
	end
	-- KONSTANTERROR: [9] 7. Error Block 19 end (CF ANALYSIS FAILED)
end
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local RunService_upvr = game:GetService("RunService")
local ServerScriptService_upvr = game:GetService("ServerScriptService")
local LoaderUtils_upvr = require(script.Parent.LoaderUtils)
function module_upvr._setupIfNeeded(arg1) -- Line 85
	--[[ Upvalues[4]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: ServerScriptService_upvr (readonly)
		[4]: LoaderUtils_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 44 start (CF ANALYSIS FAILED)
	local rawget_result1 = rawget(arg1, "_container")
	local var17
	if rawget_result1 then
		return rawget_result1
	end
	if arg1._script.Name ~= "Nevermore" then
		var17 = false
	else
		var17 = true
	end
	assert(var17, "Cannot invoke legacy mode if not at ReplicatedStorage.Nevermore")
	if arg1._script.Parent ~= ReplicatedStorage_upvr then
		var17 = false
	else
		var17 = true
	end
	assert(var17, "Cannot invoke legacy mode if not at ReplicatedStorage.Nevermore")
	-- KONSTANTERROR: [0] 1. Error Block 44 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [43] 31. Error Block 12 start (CF ANALYSIS FAILED)
	var17 = "Test mode not supported"
	error(var17)
	do
		return
	end
	-- KONSTANTERROR: [43] 31. Error Block 12 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [48] 35. Error Block 13 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [48] 35. Error Block 13 end (CF ANALYSIS FAILED)
end
return module_upvr