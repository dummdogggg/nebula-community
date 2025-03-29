--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.PromiseGetRemoteFunction
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:56
-- Luau version 6, Types version 3
-- Time taken: 0.001740 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local RunService = game:GetService("RunService")
local var1_result1_upvr_2 = any_load_result1("GetRemoteFunction")
local var1_result1_upvr = any_load_result1("Promise")
if not RunService:IsRunning() then
	return function(arg1) -- Line 26
		--[[ Upvalues[2]:
			[1]: var1_result1_upvr (readonly)
			[2]: var1_result1_upvr_2 (readonly)
		]]
		return var1_result1_upvr.resolved(var1_result1_upvr_2(arg1))
	end
end
if RunService:IsServer() then
	return function(arg1) -- Line 30
		--[[ Upvalues[2]:
			[1]: var1_result1_upvr (readonly)
			[2]: var1_result1_upvr_2 (readonly)
		]]
		return var1_result1_upvr.resolved(var1_result1_upvr_2(arg1))
	end
end
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local var1_result1_upvr_3 = any_load_result1("ResourceConstants")
return function(arg1) -- Line 34
	--[[ Upvalues[4]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: var1_result1_upvr_3 (readonly)
		[3]: var1_result1_upvr (readonly)
		[4]: var1_result1_upvr_2 (readonly)
	]]
	local var13
	if type(arg1) ~= "string" then
		var13 = false
	else
		var13 = true
	end
	assert(var13, "Bad name")
	if ReplicatedStorage_upvr:FindFirstChild(var1_result1_upvr_3.REMOTE_FUNCTION_STORAGE_NAME) then
		var13 = ReplicatedStorage_upvr:FindFirstChild(var1_result1_upvr_3.REMOTE_FUNCTION_STORAGE_NAME):FindFirstChild(arg1)
		if var13 then
			return var1_result1_upvr.resolved(var13)
		end
	end
	var13 = var1_result1_upvr.spawn
	var13 = var13(function(arg1_3, arg2) -- Line 45
		--[[ Upvalues[2]:
			[1]: var1_result1_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
		]]
		arg1_3(var1_result1_upvr_2(arg1))
	end)
	return var13
end