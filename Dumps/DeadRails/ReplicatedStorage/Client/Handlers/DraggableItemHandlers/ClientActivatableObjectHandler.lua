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
local v9 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local _ = require(l_ReplicatedStorage_0.Shared.SharedConstants.Attribute);
local v11 = require(l_ReplicatedStorage_0.Client.DataBanks.ActionData);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Client");
local l_FirstChild_0 = l_script_FirstAncestor_0.Handlers:FindFirstChild("ClientDraggableObjectHandler", true);
local l_HoveringObject_0 = l_FirstChild_0.HoveringObject;
local _ = l_FirstChild_0.DraggingObject;
local v16 = require(l_script_FirstAncestor_0.Controllers.ActionController);
local v17 = require(l_script_FirstAncestor_0.DataBanks.ClientActivatableObjectCallbacks);
local v18 = v3.new("ActivateObject");
local v19 = nil;
local v20 = false;
local function v26(_, v22) --[[ Line: 35 ]] --[[ Name: activateObjectActionCallback ]]
    -- upvalues: v19 (ref), v18 (copy), v17 (copy), v3 (copy)
    if v22 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        if v19 then
            v18:InvokeServer(v19):andThen(function(v23, ...) --[[ Line: 41 ]]
                -- upvalues: v17 (ref), v19 (ref)
                if v23 then
                    local v24 = v17[v19.Name];
                    if v24 then
                        v24(v19, ...);
                    end;
                end;
            end):timeout(10):catch(function(v25) --[[ Line: 49 ]]
                -- upvalues: v3 (ref)
                if v3.Error.isKind(v25, v3.Error.Kind.TimedOut) then
                    return;
                else
                    return;
                end;
            end);
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local function v29(v27) --[[ Line: 61 ]] --[[ Name: updateBind ]]
    -- upvalues: v20 (ref), v16 (copy), v11 (copy), v26 (copy), v19 (ref)
    if v27 and not v20 then
        v16.bindAction(v11.Action.ActivateObject, v26, v11.ActionContext[v11.Action.ActivateObject], Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3);
        v20 = true;
    elseif not v27 and v20 then
        v16.unbindAction(v11.Action.ActivateObject);
        v20 = false;
    end;
    if v20 and v19 then
        local l_v19_Attribute_0 = v19:GetAttribute("ActivateText");
        v16.setButtonText(v11.Action.ActivateObject, l_v19_Attribute_0 or "Activate");
    end;
end;
local function v31() --[[ Line: 84 ]] --[[ Name: update ]]
    -- upvalues: l_LocalPlayer_0 (copy), v29 (copy), l_HoveringObject_0 (copy), l_isValidDraggableObject_0 (copy), v9 (copy), v19 (ref)
    if not l_LocalPlayer_0.Character then
        v29(false);
        return;
    else
        local l_Value_0 = l_HoveringObject_0.Value;
        if l_Value_0 and l_isValidDraggableObject_0(l_Value_0) and l_Value_0:HasTag(v9.Activatable) and (not l_Value_0:GetAttribute("OwnerId") or l_Value_0:GetAttribute("OwnerId") == l_LocalPlayer_0.UserId) then
            v19 = l_Value_0;
        else
            v19 = nil;
        end;
        v29(v19 ~= nil);
        return;
    end;
end;
local function v36(v32) --[[ Line: 108 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v31 (copy), v29 (copy)
    local function v33() --[[ Line: 109 ]] --[[ Name: handleChildChanged ]]
        -- upvalues: v31 (ref)
        v31();
    end;
    local v34 = v32.ChildAdded:Connect(v33);
    local v35 = v32.ChildRemoved:Connect(v33);
    v32.Destroying:Once(function() --[[ Line: 116 ]]
        -- upvalues: v34 (copy), v35 (copy), v29 (ref)
        v34:Disconnect();
        v35:Disconnect();
        v29(false);
    end);
    v31();
end;
if l_LocalPlayer_0.Character then
    v36(l_LocalPlayer_0.Character);
end;
l_HoveringObject_0.Changed:Connect(v31);
l_LocalPlayer_0.CharacterAdded:Connect(v36);