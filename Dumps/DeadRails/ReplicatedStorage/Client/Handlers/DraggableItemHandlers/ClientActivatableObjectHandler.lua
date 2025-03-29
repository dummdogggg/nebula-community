--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientActivatableObjectHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v3 = require(l_Packages_0.RemotePromise);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v6 = require(l_Shared_0.Utils.DraggableObjectUtil);
local l_isValidDraggableObject_0 = v6.isValidDraggableObject;
local _ = v6.isDraggableObjectWelded;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Client");
local l_FirstChild_0 = l_script_FirstAncestor_0.Handlers:FindFirstChild("ClientDraggableObjectHandler", true);
local l_HoveringObject_0 = l_FirstChild_0.HoveringObject;
local _ = l_FirstChild_0.DraggingObject;
local v13 = require(l_script_FirstAncestor_0.Controllers.ActionController);
local v14 = require(l_script_FirstAncestor_0.DataBanks.ClientActivatableObjectCallbacks);
local v15 = v3.new("ActivateObject");
local v16 = {
    description = "Activate an object", 
    showAction = true, 
    buttonText = "Activate", 
    buttonSize = UDim2.fromOffset(48, 48), 
    buttonPosition = UDim2.fromScale(0.92, 0.3)
};
local v17 = nil;
local v18 = false;
local function v24(_, v20) --[[ Line: 43 ]] --[[ Name: activateObjectActionCallback ]]
    -- upvalues: v17 (ref), v15 (copy), v14 (copy), v3 (copy)
    if v20 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        if v17 then
            v15:InvokeServer(v17):andThen(function(v21, ...) --[[ Line: 49 ]]
                -- upvalues: v14 (ref), v17 (ref)
                if v21 then
                    local v22 = v14[v17.Name];
                    if v22 then
                        v22(v17, ...);
                    end;
                end;
            end):timeout(10):catch(function(v23) --[[ Line: 57 ]]
                -- upvalues: v3 (ref)
                if v3.Error.isKind(v23, v3.Error.Kind.TimedOut) then
                    return;
                else
                    return;
                end;
            end);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v27(v25) --[[ Line: 69 ]] --[[ Name: updateBind ]]
    -- upvalues: v18 (ref), v13 (copy), v24 (copy), v16 (copy), v17 (ref)
    if v25 and not v18 then
        v13.bindAction("ActivateObjectAction", v24, v16, Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3);
        v18 = true;
    elseif not v25 and v18 then
        v13.unbindAction("ActivateObjectAction");
        v18 = false;
    end;
    if v18 and v17 then
        local l_v17_Attribute_0 = v17:GetAttribute("ActivateText");
        v13.setButtonText("ActivateObjectAction", l_v17_Attribute_0 or "Activate");
    end;
end;
local function v29() --[[ Line: 92 ]] --[[ Name: update ]]
    -- upvalues: l_LocalPlayer_0 (copy), v27 (copy), l_HoveringObject_0 (copy), l_isValidDraggableObject_0 (copy), v17 (ref)
    if not l_LocalPlayer_0.Character then
        v27(false);
        return;
    else
        local l_Value_0 = l_HoveringObject_0.Value;
        if l_Value_0 and l_isValidDraggableObject_0(l_Value_0) and l_Value_0:HasTag("Activatable") and (not l_Value_0:GetAttribute("OwnerId") or l_Value_0:GetAttribute("OwnerId") == l_LocalPlayer_0.UserId) then
            v17 = l_Value_0;
        else
            v17 = nil;
        end;
        v27(v17 ~= nil);
        return;
    end;
end;
local function v34(v30) --[[ Line: 116 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v29 (copy), v27 (copy)
    local function v31() --[[ Line: 117 ]] --[[ Name: handleChildChanged ]]
        -- upvalues: v29 (ref)
        v29();
    end;
    local v32 = v30.ChildAdded:Connect(v31);
    local v33 = v30.ChildRemoved:Connect(v31);
    v30.Destroying:Once(function() --[[ Line: 124 ]]
        -- upvalues: v32 (copy), v33 (copy), v27 (ref)
        v32:Disconnect();
        v33:Disconnect();
        v27(false);
    end);
    v29();
end;
if l_LocalPlayer_0.Character then
    v34(l_LocalPlayer_0.Character);
end;
l_HoveringObject_0.Changed:Connect(v29);
l_LocalPlayer_0.CharacterAdded:Connect(v34);