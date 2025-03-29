--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.loader
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:12
-- Luau version 6, Types version 3
-- Time taken: 0.002455 seconds

local RunService_upvr = game:GetService("RunService")
local LoaderUtils_upvr = require(script.LoaderUtils)
local var3
if RunService_upvr:IsRunning() then
	local any_new_result1_upvw = require(script.LegacyLoader).new(script)
	local tbl = {}
	local function __call(arg1, arg2) -- Line 28
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvw (read and write)
		]]
		return any_new_result1_upvw:Require(arg2)
	end
	tbl.__call = __call
	local function __index(arg1, arg2) -- Line 31
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvw (read and write)
		]]
		return any_new_result1_upvw:Require(arg2)
	end
	tbl.__index = __index
	var3 = tbl
else
	any_new_result1_upvw = require(script.StaticLegacyLoader).new()
	local var6_upvw = any_new_result1_upvw
	var3 = {
		__call = function(arg1, arg2) -- Line 38, Named "__call"
			--[[ Upvalues[1]:
				[1]: var6_upvw (read and write)
			]]
			return var6_upvw:Require(getfenv(2).script, arg2)
		end;
		__index = function(arg1, arg2) -- Line 42, Named "__index"
			--[[ Upvalues[1]:
				[1]: var6_upvw (read and write)
			]]
			return var6_upvw:Require(getfenv(2).script, arg2)
		end;
	}
end
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local ServerScriptService_upvr = game:GetService("ServerScriptService")
local LegacyLoader_upvr = require(script.LegacyLoader)
return setmetatable({
	load = function(arg1) -- Line 127, Named "handleLoad"
		--[[ Upvalues[1]:
			[1]: var6_upvw (read and write)
		]]
		local var18
		if typeof(arg1) ~= "Instance" then
			var18 = false
		else
			var18 = true
		end
		assert(var18, "Bad moduleScript")
		return var6_upvw:GetLoader(arg1)
	end;
	bootstrapGame = function(arg1) -- Line 70, Named "bootstrapGame"
		--[[ Upvalues[5]:
			[1]: RunService_upvr (readonly)
			[2]: var6_upvw (read and write)
			[3]: LoaderUtils_upvr (readonly)
			[4]: ReplicatedStorage_upvr (readonly)
			[5]: ServerScriptService_upvr (readonly)
		]]
		local var10
		if typeof(arg1) ~= "Instance" then
			var10 = false
		else
			var10 = true
		end
		assert(var10, "Bad instance")
		var10 = RunService_upvr:IsRunning()
		assert(var10, "Game must be running")
		var6_upvw:Lock()
		var10 = LoaderUtils_upvr
		var10 = arg1
		local any_toWallyFormat_result1, any_toWallyFormat_result2, any_toWallyFormat_result3 = var10.toWallyFormat(var10, false)
		any_toWallyFormat_result1.Parent = ReplicatedStorage_upvr
		any_toWallyFormat_result3.Parent = ReplicatedStorage_upvr
		any_toWallyFormat_result2.Parent = ServerScriptService_upvr
		return any_toWallyFormat_result2
	end;
	bootstrapPlugin = function(arg1) -- Line 85, Named "bootstrapPlugin"
		--[[ Upvalues[3]:
			[1]: var6_upvw (read and write)
			[2]: LegacyLoader_upvr (readonly)
			[3]: LoaderUtils_upvr (readonly)
		]]
		local var17
		if typeof(arg1) ~= "Instance" then
			var17 = false
		else
			var17 = true
		end
		assert(var17, "Bad instance")
		var17 = LegacyLoader_upvr
		var17 = script
		var6_upvw = var17.new(var17)
		var6_upvw:Lock()
		var17 = LoaderUtils_upvr
		var17 = arg1
		local any_toWallyFormat_result1_2_upvr = var17.toWallyFormat(var17, true)
		any_toWallyFormat_result1_2_upvr.Parent = arg1
		function var17(arg1_2) -- Line 93
			--[[ Upvalues[1]:
				[1]: any_toWallyFormat_result1_2_upvr (readonly)
			]]
			if type(arg1_2) == "string" then
				if any_toWallyFormat_result1_2_upvr:FindFirstChild(arg1_2) then
					return require(any_toWallyFormat_result1_2_upvr:FindFirstChild(arg1_2))
				end
				error("Unknown module %q":format(tostring(arg1_2)))
			else
				return require(arg1_2)
			end
		end
		return var17
	end;
}, var3)