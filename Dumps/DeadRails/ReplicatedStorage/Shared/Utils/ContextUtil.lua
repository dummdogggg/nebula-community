--[[
    Script: ReplicatedStorage.Shared.Utils.ContextUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:20
-- Luau version 6, Types version 3
-- Time taken: 0.003283 seconds

local RunService_upvr = game:GetService("RunService")
local module_upvr = {
	isStudio = function() -- Line 12, Named "isStudio"
		--[[ Upvalues[1]:
			[1]: RunService_upvr (readonly)
		]]
		return RunService_upvr:IsStudio()
	end;
	isClient = function() -- Line 16, Named "isClient"
		--[[ Upvalues[1]:
			[1]: RunService_upvr (readonly)
		]]
		return RunService_upvr:IsClient()
	end;
	isServer = function() -- Line 20, Named "isServer"
		--[[ Upvalues[1]:
			[1]: RunService_upvr (readonly)
		]]
		return RunService_upvr:IsServer()
	end;
	isRunning = function() -- Line 24, Named "isRunning"
		--[[ Upvalues[1]:
			[1]: RunService_upvr (readonly)
		]]
		return RunService_upvr:IsRunning()
	end;
	isRunMode = function() -- Line 28, Named "isRunMode"
		--[[ Upvalues[1]:
			[1]: RunService_upvr (readonly)
		]]
		return RunService_upvr:IsRunMode()
	end;
}
function module_upvr.isLivePlayer() -- Line 32
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var4 = not module_upvr.isStudio()
	if var4 then
		var4 = module_upvr.isClient()
		if var4 then
			var4 = not module_upvr.isServer()
		end
	end
	return var4
end
function module_upvr.isLiveServer() -- Line 36
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var5 = not module_upvr.isStudio()
	if var5 then
		var5 = not module_upvr.isClient()
		if var5 then
			var5 = module_upvr.isServer()
		end
	end
	return var5
end
function module_upvr.isStudioPlayClient() -- Line 40
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_isStudio_result1_2 = module_upvr.isStudio()
	if any_isStudio_result1_2 then
		any_isStudio_result1_2 = module_upvr.isClient()
		if any_isStudio_result1_2 then
			any_isStudio_result1_2 = not module_upvr.isServer()
			if any_isStudio_result1_2 then
				any_isStudio_result1_2 = module_upvr.isRunning()
				if any_isStudio_result1_2 then
					any_isStudio_result1_2 = not module_upvr.isRunMode()
				end
			end
		end
	end
	return any_isStudio_result1_2
end
function module_upvr.isStudioPlayServer() -- Line 46
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_isStudio_result1 = module_upvr.isStudio()
	if any_isStudio_result1 then
		any_isStudio_result1 = not module_upvr.isClient()
		if any_isStudio_result1 then
			any_isStudio_result1 = module_upvr.isServer()
			if any_isStudio_result1 then
				any_isStudio_result1 = module_upvr.isRunning()
				if any_isStudio_result1 then
					any_isStudio_result1 = module_upvr.isRunMode()
				end
			end
		end
	end
	return any_isStudio_result1
end
function module_upvr.getCurrentContext() -- Line 52
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.isStudioPlayClient() then
		return "Studio Play Client"
	end
	if module_upvr.isStudioPlayServer() then
		return "Studio Play Server"
	end
	if module_upvr.isLivePlayer() then
		return "Live Client"
	end
	if module_upvr.isLiveServer() then
		return "Live Server"
	end
	if module_upvr.isRunMode() then
		return "Run Mode"
	end
	return "Unknown Context"
end
function module_upvr.getContextTable() -- Line 68
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return {
		isStudio = module_upvr.isStudio();
		isClient = module_upvr.isClient();
		isServer = module_upvr.isServer();
		isRunning = module_upvr.isRunning();
		isRunMode = module_upvr.isRunMode();
		isLivePlayer = module_upvr.isLivePlayer();
		isLiveServer = module_upvr.isLiveServer();
		isStudioPlayClient = module_upvr.isStudioPlayClient();
		isStudioPlayServer = module_upvr.isStudioPlayServer();
	}
end
return module_upvr