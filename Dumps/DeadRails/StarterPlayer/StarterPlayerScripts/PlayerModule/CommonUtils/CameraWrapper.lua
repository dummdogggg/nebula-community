--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CameraWrapper
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:02
-- Luau version 6, Types version 3
-- Time taken: 0.001547 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
local ConnectionUtil_upvr = require(script.Parent.ConnectionUtil)
function module_upvr.new() -- Line 39
	--[[ Upvalues[2]:
		[1]: ConnectionUtil_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	return setmetatable({
		_camera = game.Workspace.CurrentCamera;
		_callbacks = {};
		_connectionUtil = ConnectionUtil_upvr.new();
		_enabled = false;
	}, module_upvr)
end
function module_upvr._connectCallbacks(arg1) -- Line 52
	arg1._camera = game.Workspace.CurrentCamera
	if not arg1._camera then
	else
		for var4, var5 in arg1._callbacks do
			arg1._connectionUtil:trackConnection(var4, arg1._camera:GetPropertyChangedSignal(var4):Connect(var5))
			var5()
		end
	end
end
function module_upvr.Enable(arg1) -- Line 65
	if arg1._enabled then
	else
		arg1._enabled = true
		arg1._cameraChangedConnection = game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line 72
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:_connectCallbacks()
		end)
		arg1:_connectCallbacks()
	end
end
function module_upvr.Disable(arg1) -- Line 79
	if not arg1._enabled then
	else
		arg1._enabled = false
		if arg1._cameraChangedConnection then
			arg1._cameraChangedConnection:Disconnect()
			arg1._cameraChangedConnection = nil
		end
		arg1._connectionUtil:disconnectAll()
	end
end
function module_upvr.Connect(arg1, arg2, arg3) -- Line 94
	arg1._callbacks[arg2] = arg3
	if not arg1._camera then
	else
		arg1._connectionUtil:trackConnection(arg2, arg1._camera:GetPropertyChangedSignal(arg2):Connect(arg3))
	end
end
function module_upvr.Disconnect(arg1, arg2) -- Line 104
	arg1._connectionUtil:disconnect(arg2)
	arg1._callbacks[arg2] = nil
end
function module_upvr.getCamera(arg1) -- Line 110
	return arg1._camera
end
return module_upvr