--[[
    Script: ReplicatedStorage.Client.DataBanks.ActionData
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:01
-- Luau version 6, Types version 3
-- Time taken: 0.001637 seconds

local module = {
	Action = {
		Shoot = "Shoot";
		Reload = "Reload";
		Throw = "Throw";
		DragObject = "DragObject";
		WeldObject = "WeldObject";
		RotateObject = "RotateObject";
		ChangeRotationAxis = "ChangeRotationAxis";
		StoreObject = "StoreObject";
		PickUpObject = "PickUpObject";
		DropObject = "DropObject";
		ActivateObject = "ActivateObject";
	};
	ActionContext = {
		[module.Action.Shoot] = {
			showAction = true;
			buttonText = "Shoot";
			buttonSize = UDim2.fromOffset(70, 70);
			buttonPosition = UDim2.fromScale(0.76, 0.61);
		};
		[module.Action.Throw] = {
			showAction = true;
			buttonText = "Throw";
			buttonSize = UDim2.fromOffset(70, 70);
			buttonPosition = UDim2.fromScale(0.76, 0.61);
		};
		[module.Action.Reload] = {
			showAction = true;
			buttonText = "Reload";
			buttonSize = UDim2.fromOffset(60, 60);
			buttonPosition = UDim2.fromScale(0.68, 0.48);
		};
		[module.Action.DragObject] = {
			description = "Drag a draggable object";
			showAction = true;
			buttonText = "Drag";
			buttonSize = UDim2.fromOffset(70, 70);
			buttonPosition = UDim2.fromScale(0.76, 0.61);
		};
		[module.Action.WeldObject] = {
			description = "Weld a draggable object";
			showAction = true;
			buttonText = "Weld";
			buttonSize = UDim2.fromOffset(60, 60);
			buttonPosition = UDim2.fromScale(0.68, 0.48);
		};
		[module.Action.RotateObject] = {
			description = "Rotate the object you're dragging";
			showAction = true;
			buttonText = "Rotate";
			buttonSize = UDim2.fromOffset(60, 60);
			buttonPosition = UDim2.fromScale(0.68, 0.48);
		};
		[module.Action.ChangeRotationAxis] = {
			description = "Change the axis to rotate along";
			showAction = true;
			buttonText = "Change Axis";
			buttonSize = UDim2.fromOffset(50, 50);
			buttonPosition = UDim2.fromScale(0.79, 0.37);
		};
		[module.Action.StoreObject] = {
			description = "Store objects in the sack";
			showAction = true;
			buttonText = "Store";
			buttonSize = UDim2.fromOffset(56, 56);
			buttonPosition = UDim2.fromScale(0.92, 0.32);
		};
		[module.Action.PickUpObject] = {
			description = "Pick up object";
			showAction = true;
			buttonText = "Pick Up";
			buttonSize = UDim2.fromOffset(48, 48);
			buttonPosition = UDim2.fromScale(0.85, 0.32);
		};
		[module.Action.DropObject] = {
			description = "Drop object";
			showAction = true;
			buttonText = "Drop";
			buttonSize = UDim2.fromOffset(56, 56);
			buttonPosition = UDim2.fromScale(0.92, 0.32);
		};
		[module.Action.ActivateObject] = {
			description = "Activate an object";
			showAction = true;
			buttonText = "Activate";
			buttonSize = UDim2.fromOffset(48, 48);
			buttonPosition = UDim2.fromScale(0.85, 0.3);
		};
	};
	ActionPriority = {
		Highest = 0;
		High = 1;
		Medium = 2;
		Low = 3;
		Lowest = 4;
	};
}
function module.noOp() -- Line 125
	return Enum.ContextActionResult.Pass
end
return table.freeze(module)