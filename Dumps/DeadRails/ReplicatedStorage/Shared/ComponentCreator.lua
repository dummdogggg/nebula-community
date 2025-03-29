--[[
    Script: ReplicatedStorage.Shared.ComponentCreator
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:38
-- Luau version 6, Types version 3
-- Time taken: 0.001695 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local module_upvr = {}
module_upvr.__index = module_upvr
local Connections_upvr = require(ReplicatedStorage.Shared.Connections)
local Signal_upvr = require(ReplicatedStorage.Packages.Signal)
function module_upvr.new(arg1, arg2, ...) -- Line 40
	--[[ Upvalues[3]:
		[1]: Connections_upvr (readonly)
		[2]: Signal_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	local module = {}
	module.tag = arg1
	module.wrapperClass = arg2
	module._connections = Connections_upvr.new()
	module._wrappersByInstance = {}
	module._wrapperParameters = table.pack(...)
	module.objectAdded = Signal_upvr.new()
	setmetatable(module, module_upvr)
	return module
end
local CollectionService_upvr = game:GetService("CollectionService")
function module_upvr.listen(arg1) -- Line 59
	--[[ Upvalues[1]:
		[1]: CollectionService_upvr (readonly)
	]]
	for _, v in ipairs(CollectionService_upvr:GetTagged(arg1.tag)) do
		arg1:_wrapInstance(v)
	end
	arg1._connections:add(CollectionService_upvr:GetInstanceAddedSignal(arg1.tag):Connect(function(arg1_2) -- Line 68
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:_wrapInstance(arg1_2)
		arg1.objectAdded:Fire(arg1._wrappersByInstance[arg1_2])
	end), CollectionService_upvr:GetInstanceRemovedSignal(arg1.tag):Connect(function(arg1_3) -- Line 74
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:_unwrapInstance(arg1_3)
	end))
end
function module_upvr.getComponentFromInstance(arg1, arg2) -- Line 81
	return arg1._wrappersByInstance[arg2]
end
function module_upvr._wrapInstance(arg1, arg2) -- Line 86
	arg1._wrappersByInstance[arg2] = arg1.wrapperClass.new(arg2, table.unpack(arg1._wrapperParameters))
end
function module_upvr._unwrapInstance(arg1, arg2) -- Line 90
	local var14 = arg1._wrappersByInstance[arg2]
	arg1._wrappersByInstance[arg2] = nil
	if var14.destroy then
		var14:destroy()
	end
end
function module_upvr.destroy(arg1) -- Line 99
	arg1._connections:disconnect()
	for _, v_2 in pairs(arg1._wrappersByInstance) do
		v_2:destroy()
	end
	arg1.objectAdded:DisconnectAll()
end
return module_upvr