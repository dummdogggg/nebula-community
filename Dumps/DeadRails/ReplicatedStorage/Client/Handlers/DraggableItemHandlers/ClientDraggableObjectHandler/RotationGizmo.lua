--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientDraggableObjectHandler.RotationGizmo
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:35
-- Luau version 6, Types version 3
-- Time taken: 0.003110 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
local RunService_upvr = game:GetService("RunService")
local Trove_upvr = require(ReplicatedStorage.Packages.Trove)
local Instance_upvr = script:WaitForChild("Instance")
local Spring_upvr = require(ReplicatedStorage.Packages.Spring)
local tick_upvr = tick
function tbl_upvr.new(arg1) -- Line 31
	--[[ Upvalues[6]:
		[1]: RunService_upvr (readonly)
		[2]: Trove_upvr (readonly)
		[3]: Instance_upvr (readonly)
		[4]: Spring_upvr (readonly)
		[5]: tick_upvr (readonly)
		[6]: tbl_upvr (readonly)
	]]
	assert(RunService_upvr:IsClient(), "RotationGizmo can only be created on the client")
	local any_new_result1 = Trove_upvr.new()
	local clone = Instance_upvr:Clone()
	local module_upvr = {
		_trove = any_new_result1;
		_currentAxisSpring = Spring_upvr.new(1, 1, 20, tick_upvr);
		_otherAxisSpring = Spring_upvr.new(1, 1, 20, tick_upvr);
	}
	module_upvr._boundInstance = arg1
	module_upvr._gizmoInstance = clone
	module_upvr._currentAxis = Enum.Axis.X
	module_upvr._destroyed = false
	setmetatable(module_upvr, tbl_upvr)
	local var11 = 0
	local any_GetExtentsSize_result1 = arg1:GetExtentsSize()
	local X = any_GetExtentsSize_result1.X
	local Y = any_GetExtentsSize_result1.Y
	local Z = any_GetExtentsSize_result1.Z
	if var11 < X then
		var11 = X
	elseif var11 < Y then
		var11 = Y
	elseif var11 < Z then
		var11 = Z
	end
	local var16 = math.clamp(var11 * 1.4142135623730951 * 1.1, 1, 3) / 2
	module_upvr._gizmoInstance.X.InnerRadius = var16 - 0.1
	module_upvr._gizmoInstance.Y.InnerRadius = var16 - 0.1
	module_upvr._gizmoInstance.Z.InnerRadius = var16 - 0.1
	module_upvr._gizmoInstance.X.Radius = var16
	module_upvr._gizmoInstance.Y.Radius = var16
	module_upvr._gizmoInstance.Z.Radius = var16
	any_new_result1:Add(clone)
	any_new_result1:Add(RunService_upvr.RenderStepped:Connect(function() -- Line 75
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		module_upvr:update()
	end))
	any_new_result1:Add(arg1.Destroying:Connect(function() -- Line 79
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		module_upvr:destroy()
	end))
	return module_upvr
end
function tbl_upvr.update(arg1) -- Line 86
	if arg1._destroyed or not arg1._boundInstance then
	else
		arg1._gizmoInstance:PivotTo(arg1._boundInstance:GetPivot())
		for _, v in Enum.Axis:GetEnumItems() do
			local SOME = arg1._gizmoInstance:FindFirstChild(v.Name)
			local var27
			if SOME then
				if arg1._currentAxis == v then
					var27 = arg1._currentAxisSpring.Position
				else
					var27 = arg1._otherAxisSpring.Position
				end
				SOME.Transparency = var27
			end
		end
	end
end
function tbl_upvr.setCurrentAxis(arg1, arg2) -- Line 103
	arg1._currentAxis = arg2
end
function tbl_upvr.setParent(arg1, arg2) -- Line 107
	if arg1._destroyed then
	else
		arg1._gizmoInstance.Parent = arg2
	end
end
function tbl_upvr.show(arg1) -- Line 115
	arg1._currentAxisSpring.Target = 0.2
	arg1._otherAxisSpring.Target = 0.8
end
function tbl_upvr.hide(arg1) -- Line 120
	arg1._currentAxisSpring.Target = 1
	arg1._otherAxisSpring.Target = 1
end
function tbl_upvr.destroy(arg1) -- Line 125
	if arg1._destroyed then
	else
		arg1._destroyed = true
		arg1._trove:Destroy()
	end
end
return {
	new = tbl_upvr.new;
}