--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.StepUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:00
-- Luau version 6, Types version 3
-- Time taken: 0.002414 seconds

local RunService_upvr = game:GetService("RunService")
local module_upvr = {}
function module_upvr.bindToRenderStep(arg1) -- Line 38
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	return module_upvr.bindToSignal(RunService_upvr.RenderStepped, arg1)
end
function module_upvr.bindToSignal(arg1, arg2) -- Line 51
	if typeof(arg1) ~= "RBXScriptSignal" then
		error("signal must be of type RBXScriptSignal")
	end
	if type(arg2) ~= "function" then
		error("update must be of type function, got %q":format(type(arg2)))
	end
	local var3_upvw
	return function(...) -- Line 67, Named "connect"
		--[[ Upvalues[3]:
			[1]: var3_upvw (read and write)
			[2]: arg2 (readonly)
			[3]: arg1 (readonly)
		]]
		if var3_upvw and var3_upvw.Connected then
		else
			if not arg2(...) then return end
			if var3_upvw and var3_upvw.Connected then return end
			local args_list_upvr = {...}
			var3_upvw = arg1:Connect(function() -- Line 87
				--[[ Upvalues[3]:
					[1]: arg2 (copied, readonly)
					[2]: args_list_upvr (readonly)
					[3]: var3_upvw (copied, read and write)
				]]
				if not arg2(unpack(args_list_upvr)) and var3_upvw then
					var3_upvw:Disconnect()
					var3_upvw = nil
				end
			end)
		end
	end, function() -- Line 60, Named "disconnect"
		--[[ Upvalues[1]:
			[1]: var3_upvw (read and write)
		]]
		if var3_upvw then
			var3_upvw:Disconnect()
			var3_upvw = nil
		end
	end
end
local HttpService_upvr = game:GetService("HttpService")
function module_upvr.onceAtRenderPriority(arg1, arg2) -- Line 105
	--[[ Upvalues[2]:
		[1]: HttpService_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	local cleanup
	if type(arg1) ~= "number" then
		cleanup = false
	else
		cleanup = true
	end
	assert(cleanup, "Bad priority")
	if type(arg2) ~= "function" then
		cleanup = false
	else
		cleanup = true
	end
	assert(cleanup, "Bad func")
	local formatted_upvr = "StepUtils.onceAtPriority_%s":format(HttpService_upvr:GenerateGUID(false))
	function cleanup() -- Line 111
		--[[ Upvalues[2]:
			[1]: RunService_upvr (copied, readonly)
			[2]: formatted_upvr (readonly)
		]]
		RunService_upvr:UnbindFromRenderStep(formatted_upvr)
	end
	RunService_upvr:BindToRenderStep(formatted_upvr, arg1, function() -- Line 115
		--[[ Upvalues[3]:
			[1]: RunService_upvr (copied, readonly)
			[2]: formatted_upvr (readonly)
			[3]: arg2 (readonly)
		]]
		RunService_upvr:UnbindFromRenderStep(formatted_upvr)
		arg2()
	end)
	return cleanup
end
function module_upvr.onceAtStepped(arg1) -- Line 135
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	return module_upvr.onceAtEvent(RunService_upvr.Stepped, arg1)
end
function module_upvr.onceAtRenderStepped(arg1) -- Line 145
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	return module_upvr.onceAtEvent(RunService_upvr.RenderStepped, arg1)
end
function module_upvr.onceAtEvent(arg1, arg2) -- Line 156
	local cleanup
	if type(arg2) ~= "function" then
		cleanup = false
	else
		cleanup = true
	end
	assert(cleanup, "Bad func")
	local var11_upvw
	function cleanup() -- Line 160
		--[[ Upvalues[1]:
			[1]: var11_upvw (read and write)
		]]
		if var11_upvw then
			var11_upvw:Disconnect()
			var11_upvw = nil
		end
	end
	var11_upvw = arg1:Connect(function(...) -- Line 167
		--[[ Upvalues[2]:
			[1]: var11_upvw (read and write)
			[2]: arg2 (readonly)
		]]
		if var11_upvw then
			var11_upvw:Disconnect()
			var11_upvw = nil
		end
		arg2(...)
	end)
	return cleanup
end
return module_upvr