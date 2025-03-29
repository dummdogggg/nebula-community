--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.ConnectionUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:28
-- Luau version 6, Types version 3
-- Time taken: 0.001099 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 25
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1._connections = {}
	return setmetatable_result1
end
function module_upvr.trackConnection(arg1, arg2, arg3) -- Line 33
	if arg1._connections[arg2] then
		arg1._connections[arg2]()
	end
	arg1._connections[arg2] = function() -- Line 38
		--[[ Upvalues[1]:
			[1]: arg3 (readonly)
		]]
		arg3:Disconnect()
	end
end
function module_upvr.trackBoundFunction(arg1, arg2, arg3) -- Line 41
	if arg1._connections[arg2] then
		arg1._connections[arg2]()
	end
	arg1._connections[arg2] = arg3
end
function module_upvr.disconnect(arg1, arg2) -- Line 48
	if arg1._connections[arg2] then
		arg1._connections[arg2]()
		arg1._connections[arg2] = nil
	end
end
function module_upvr.disconnectAll(arg1) -- Line 55
	for _, v in pairs(arg1._connections) do
		v()
	end
	arg1._connections = {}
end
return module_upvr