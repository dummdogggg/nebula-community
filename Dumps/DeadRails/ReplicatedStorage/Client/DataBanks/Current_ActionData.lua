--[[
    Script: ReplicatedStorage.Client.DataBanks.Current_ActionData
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Client.Controllers.ActionController);
local v2 = {
    Action = {
        Shoot = "Shoot", 
        Reload = "Reload", 
        Throw = "Throw", 
        DragObject = "DragObject", 
        WeldObject = "WeldObject", 
        RotateObject = "RotateObject", 
        ChangeRotationAxis = "ChangeRotationAxis", 
        StoreObject = "StoreObject", 
        PickUpObject = "PickUpObject", 
        DropObject = "DropObject"
    }
};
v2.ActionContext = {
    [v2.Action.Shoot] = {
        showAction = true, 
        buttonText = "Shoot", 
        buttonSize = UDim2.fromOffset(55, 55), 
        buttonPosition = UDim2.fromScale(0.9, 0.5)
    }, 
    [v2.Action.Throw] = {
        showAction = true, 
        buttonText = "Throw", 
        buttonSize = UDim2.fromOffset(55, 55), 
        buttonPosition = UDim2.fromScale(0.9, 0.5)
    }, 
    [v2.Action.Reload] = {
        showAction = true, 
        buttonText = "Reload", 
        buttonSize = UDim2.fromOffset(55, 55), 
        buttonPosition = UDim2.fromScale(0.75, 0.55)
    }, 
    [v2.Action.DragObject] = {
        description = "Drag a draggable object", 
        showAction = true, 
        buttonText = "Drag", 
        buttonSize = UDim2.fromOffset(55, 55), 
        buttonPosition = UDim2.fromScale(0.9, 0.5)
    }, 
    [v2.Action.WeldObject] = {
        description = "Weld a draggable object", 
        showAction = true, 
        buttonText = "Weld", 
        buttonSize = UDim2.fromOffset(55, 55), 
        buttonPosition = UDim2.fromScale(0.75, 0.55)
    }, 
    [v2.Action.RotateObject] = {
        description = "Rotate the object you're dragging", 
        showAction = true, 
        buttonText = "Rotate (Hold)", 
        buttonSize = UDim2.fromOffset(55, 55), 
        buttonPosition = UDim2.fromScale(0.75, 0.55)
    }, 
    [v2.Action.ChangeRotationAxis] = {
        description = "Change the axis to rotate along", 
        showAction = true, 
        buttonText = "Change Axis", 
        buttonSize = UDim2.fromOffset(55, 55), 
        buttonPosition = UDim2.fromScale(0.8, 0.35)
    }, 
    [v2.Action.StoreObject] = {
        description = "Store objects in the sack", 
        showAction = true, 
        buttonText = "Store", 
        buttonSize = UDim2.fromOffset(48, 48), 
        buttonPosition = UDim2.fromScale(0.92, 0.3)
    }, 
    [v2.Action.PickUpObject] = {
        description = "Pick up object", 
        showAction = true, 
        buttonText = "Pick Up", 
        buttonSize = UDim2.fromOffset(48, 48), 
        buttonPosition = UDim2.fromScale(0.92, 0.3)
    }, 
    [v2.Action.DropObject] = {
        description = "Drop object", 
        showAction = true, 
        buttonText = "Drop", 
        buttonSize = UDim2.fromOffset(48, 48), 
        buttonPosition = UDim2.fromScale(0.92, 0.3)
    }
};
v2.ActionPriority = {
    Highest = 0, 
    High = 1, 
    Medium = 2, 
    Low = 3, 
    Lowest = 4
};
v2.noOp = function() --[[ Line: 123 ]]
    return Enum.ContextActionResult.Pass;
end;
return table.freeze(v2);