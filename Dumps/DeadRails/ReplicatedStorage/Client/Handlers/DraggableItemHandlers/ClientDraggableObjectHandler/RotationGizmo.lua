--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientDraggableObjectHandler.RotationGizmo
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Trove);
local v3 = require(l_ReplicatedStorage_0.Packages.Spring);
local l_tick_0 = tick;
local l_Instance_0 = script:WaitForChild("Instance");
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), v2 (copy), l_Instance_0 (copy), v3 (copy), l_tick_0 (copy), v6 (copy)
    assert(l_RunService_0:IsClient(), "RotationGizmo can only be created on the client");
    local v8 = v2.new();
    local v9 = l_Instance_0:Clone();
    local v10 = {
        _trove = v8, 
        _currentAxisSpring = v3.new(1, 1, 20, l_tick_0), 
        _otherAxisSpring = v3.new(1, 1, 20, l_tick_0), 
        _boundInstance = v7, 
        _gizmoInstance = v9, 
        _currentAxis = Enum.Axis.X, 
        _destroyed = false
    };
    setmetatable(v10, v6);
    local v11 = 0;
    local l_v7_ExtentsSize_0 = v7:GetExtentsSize();
    local l_X_0 = l_v7_ExtentsSize_0.X;
    local l_Y_0 = l_v7_ExtentsSize_0.Y;
    local l_Z_0 = l_v7_ExtentsSize_0.Z;
    if v11 < l_X_0 then
        v11 = l_X_0;
    elseif v11 < l_Y_0 then
        v11 = l_Y_0;
    elseif v11 < l_Z_0 then
        v11 = l_Z_0;
    end;
    local v16 = math.clamp(v11 * 1.4142135623730951 * 1.1, 1, 3) / 2;
    v10._gizmoInstance.X.InnerRadius = v16 - 0.1;
    v10._gizmoInstance.Y.InnerRadius = v16 - 0.1;
    v10._gizmoInstance.Z.InnerRadius = v16 - 0.1;
    v10._gizmoInstance.X.Radius = v16;
    v10._gizmoInstance.Y.Radius = v16;
    v10._gizmoInstance.Z.Radius = v16;
    v8:Add(v9);
    v8:Add(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 75 ]]
        -- upvalues: v10 (copy)
        v10:update();
    end));
    v8:Add(v7.Destroying:Connect(function() --[[ Line: 79 ]]
        -- upvalues: v10 (copy)
        v10:destroy();
    end));
    return v10;
end;
v6.update = function(v17) --[[ Line: 86 ]] --[[ Name: update ]]
    if v17._destroyed or not v17._boundInstance then
        return;
    else
        local l_Pivot_0 = v17._boundInstance:GetPivot();
        v17._gizmoInstance:PivotTo(l_Pivot_0);
        for _, v20 in Enum.Axis:GetEnumItems() do
            local l_FirstChild_0 = v17._gizmoInstance:FindFirstChild(v20.Name);
            if l_FirstChild_0 then
                l_FirstChild_0.Transparency = if v17._currentAxis == v20 then v17._currentAxisSpring.Position else v17._otherAxisSpring.Position;
            end;
        end;
        return;
    end;
end;
v6.setCurrentAxis = function(v22, v23) --[[ Line: 103 ]] --[[ Name: setCurrentAxis ]]
    v22._currentAxis = v23;
end;
v6.setParent = function(v24, v25) --[[ Line: 107 ]] --[[ Name: setParent ]]
    if v24._destroyed then
        return;
    else
        v24._gizmoInstance.Parent = v25;
        return;
    end;
end;
v6.show = function(v26) --[[ Line: 115 ]] --[[ Name: show ]]
    v26._currentAxisSpring.Target = 0.2;
    v26._otherAxisSpring.Target = 0.8;
end;
v6.hide = function(v27) --[[ Line: 120 ]] --[[ Name: hide ]]
    v27._currentAxisSpring.Target = 1;
    v27._otherAxisSpring.Target = 1;
end;
v6.destroy = function(v28) --[[ Line: 125 ]] --[[ Name: destroy ]]
    if v28._destroyed then
        return;
    else
        v28._destroyed = true;
        v28._trove:Destroy();
        return;
    end;
end;
return {
    new = v6.new
};