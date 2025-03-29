--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientInteractableObjectHandler
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Shared.InteractableObjectValidation);
local v5 = require(l_ReplicatedStorage_0.Shared.Utils.findFirstAncestorOfClassWithTag);
local v6 = require(l_ReplicatedStorage_0.Shared.SharedConstants.CollectionServiceTag.InteractableObjectTags);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_ObjectHighlight_0 = script:FindFirstChild("ObjectHighlight");
local function v13() --[[ Line: 22 ]] --[[ Name: raycastInFrontOfCamera ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_LocalPlayer_0 (copy)
    local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
    local v11 = l_CurrentCamera_0.CFrame.LookVector * 10;
    local v12 = RaycastParams.new();
    v12.FilterType = Enum.RaycastFilterType.Exclude;
    v12.FilterDescendantsInstances = {
        l_LocalPlayer_0.Character
    };
    return workspace:Raycast(l_Position_0, v11, v12);
end;
local v14 = {
    _hoveringObject = nil, 
    OnHoveringObjectChanged = v3.new()
};
v14.start = function() --[[ Line: 38 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy), v14 (copy)
    l_RunService_0.RenderStepped:Connect(v14._updateHoveringObject);
    v14.OnHoveringObjectChanged:Connect(v14._updateHighlight);
    v14.OnHoveringObjectChanged:Connect(function() --[[ Line: 42 ]]
        warn("changed!!");
    end);
end;
v14.getHoveringInteractableObject = function() --[[ Line: 47 ]] --[[ Name: getHoveringInteractableObject ]]
    -- upvalues: v14 (copy)
    return v14._hoveringObject;
end;
v14._updateHighlight = function() --[[ Line: 51 ]] --[[ Name: _updateHighlight ]]
    -- upvalues: v14 (copy), l_ObjectHighlight_0 (copy)
    local l__hoveringObject_0 = v14._hoveringObject;
    if l__hoveringObject_0 then
        l_ObjectHighlight_0.Adornee = l__hoveringObject_0;
        return;
    else
        l_ObjectHighlight_0.Adornee = nil;
        return;
    end;
end;
v14._updateHoveringObject = function() --[[ Line: 61 ]] --[[ Name: _updateHoveringObject ]]
    -- upvalues: v13 (copy), v5 (copy), v6 (copy), v4 (copy), v14 (copy)
    local v16 = v13();
    local v17 = nil;
    if v16 and v16.Instance then
        local v18 = v5(v16.Instance, "Model", v6.InteractableObject);
        if v18 and v4.isObject(v18) then
            v17 = v18;
        end;
    end;
    if v14._hoveringObject ~= v17 then
        v14._hoveringObject = v17;
        v14.OnHoveringObjectChanged:Fire(v17);
    end;
end;
return v14;