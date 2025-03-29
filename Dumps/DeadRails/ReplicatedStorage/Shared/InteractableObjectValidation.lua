--[[
    Script: ReplicatedStorage.Shared.InteractableObjectValidation
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("ServerScriptService");
local v3 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Attribute);
local v4 = require(l_ReplicatedStorage_0.Shared.SharedConstants.CollectionServiceTag.InteractableObjectTags);
local v6 = {
    isObject = function(v5) --[[ Line: 19 ]] --[[ Name: isObject ]]
        -- upvalues: v4 (copy)
        if not v5 or typeof(v5) ~= "Instance" or not v5:IsA("Model") or not v5:HasTag(v4.InteractableObject) or not v5.PrimaryPart then
            return false;
        else
            return true;
        end;
    end
};
v6.isBeingDragged = function(v7) --[[ Line: 32 ]] --[[ Name: isBeingDragged ]]
    -- upvalues: v6 (copy), v4 (copy)
    assert(v6.isObject(v7), "Invalid object");
    return v7:HasTag(v4.IsBeingDragged);
end;
v6.isWelded = function(v8) --[[ Line: 38 ]] --[[ Name: isWelded ]]
    -- upvalues: v6 (copy), v4 (copy)
    assert(v6.isObject(v8), "Invalid object");
    return v8:HasTag(v4.Welded);
end;
v6.canWeldTo = function(v9) --[[ Line: 44 ]] --[[ Name: canWeldTo ]]
    -- upvalues: v4 (copy)
    if not v9 or typeof(v9) ~= "Instance" or not v9:HasTag(v4.CanWeldTo) then
        return false;
    else
        return true;
    end;
end;
v6.isPlayerOwner = function(v10, v11) --[[ Line: 58 ]] --[[ Name: isPlayerOwner ]]
    -- upvalues: v6 (copy), v3 (copy)
    assert(typeof(v10) == "Player", "First argument must be a player");
    assert(v6.isObject(v11), "Invalid object");
    local l_v11_Attribute_0 = v11:GetAttribute(v3.OwnerId);
    return not l_v11_Attribute_0 or l_v11_Attribute_0 == v10.UserId;
end;
return v6;