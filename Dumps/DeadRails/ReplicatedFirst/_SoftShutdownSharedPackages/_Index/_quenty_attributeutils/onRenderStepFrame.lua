--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.onRenderStepFrame
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:25
-- Luau version 6, Types version 3
-- Time taken: 0.001143 seconds

local HttpService_upvr = game:GetService("HttpService")
local RunService_upvr = game:GetService("RunService")
return function(arg1, arg2) -- Line 17
	--[[ Upvalues[2]:
		[1]: HttpService_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	local var4_upvw
	if type(arg1) ~= "number" then
		var4_upvw = false
	else
		var4_upvw = true
	end
	assert(var4_upvw, "Bad priority")
	if type(arg2) ~= "function" then
		var4_upvw = false
	else
		var4_upvw = true
	end
	assert(var4_upvw, "Bad callback")
	var4_upvw = HttpService_upvr:GenerateGUID(false)
	local var5_upvr = var4_upvw.."_onRenderStepFrame"
	var4_upvw = false
	RunService_upvr:BindToRenderStep(var5_upvr, arg1, function() -- Line 24
		--[[ Upvalues[4]:
			[1]: var4_upvw (read and write)
			[2]: RunService_upvr (copied, readonly)
			[3]: var5_upvr (readonly)
			[4]: arg2 (readonly)
		]]
		if not var4_upvw then
			RunService_upvr:UnbindFromRenderStep(var5_upvr)
			arg2()
		end
	end)
	return function() -- Line 31
		--[[ Upvalues[3]:
			[1]: var4_upvw (read and write)
			[2]: RunService_upvr (copied, readonly)
			[3]: var5_upvr (readonly)
		]]
		if not var4_upvw then
			RunService_upvr:UnbindFromRenderStep(var5_upvr)
			var4_upvw = true
		end
	end
end