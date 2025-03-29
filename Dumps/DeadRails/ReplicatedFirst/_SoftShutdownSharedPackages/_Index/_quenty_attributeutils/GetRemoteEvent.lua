--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.GetRemoteEvent
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:12
-- Luau version 6, Types version 3
-- Time taken: 0.001427 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local var3_upvr = require(script.Parent.loader).load(script)("ResourceConstants")
if not RunService:IsRunning() then
	return function(arg1) -- Line 48
		local RemoteEvent = Instance.new("RemoteEvent")
		RemoteEvent.Archivable = false
		RemoteEvent.Name = "Mock"..arg1
		return RemoteEvent
	end
end
if RunService:IsServer() then
	return function(arg1) -- Line 56
		--[[ Upvalues[2]:
			[1]: ReplicatedStorage_upvr (readonly)
			[2]: var3_upvr (readonly)
		]]
		local var7
		if type(arg1) ~= "string" then
			var7 = false
		else
			var7 = true
		end
		assert(var7, "Bad name")
		if not ReplicatedStorage_upvr:FindFirstChild(var3_upvr.REMOTE_EVENT_STORAGE_NAME) then
			var7 = Instance.new("Folder")
			local var8 = var7
			var7 = var3_upvr.REMOTE_EVENT_STORAGE_NAME
			var8.Name = var7
			var7 = false
			var8.Archivable = var7
			var7 = ReplicatedStorage_upvr
			var8.Parent = var7
		end
		var7 = var8:FindFirstChild(arg1)
		if var7 then
			return var7
		end
		var7 = Instance.new("RemoteEvent")
		var7.Name = arg1
		var7.Archivable = false
		var7.Parent = var8
		return var7
	end
end
return function(arg1) -- Line 80
	--[[ Upvalues[2]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: var3_upvr (readonly)
	]]
	local var10
	if type(arg1) ~= "string" then
		var10 = false
	else
		var10 = true
	end
	assert(var10, "Bad name")
	return ReplicatedStorage_upvr:WaitForChild(var3_upvr.REMOTE_EVENT_STORAGE_NAME):WaitForChild(arg1)
end