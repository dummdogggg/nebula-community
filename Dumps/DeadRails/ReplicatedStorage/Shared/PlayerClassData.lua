--[[
    Script: ReplicatedStorage.Shared.PlayerClassData
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = {
        _classId = v1, 
        _classData = v2, 
        _destroyed = false, 
        _connections = {}
    };
    setmetatable(v3, v0);
    return v3;
end;
v0.getStartingToolsData = function(v4) --[[ Line: 64 ]] --[[ Name: getStartingToolsData ]]
    return v4._classData.startingTools;
end;
v0.getStartingEquippables = function(v5) --[[ Line: 68 ]] --[[ Name: getStartingEquippables ]]
    return v5._classData.startingEquippables;
end;
v0.getStartingObjects = function(v6) --[[ Line: 72 ]] --[[ Name: getStartingObjects ]]
    return v6._classData.startingObjects;
end;
v0.getStartingEntities = function(v7) --[[ Line: 76 ]] --[[ Name: getStartingEntities ]]
    return v7._classData.startingEntities;
end;
v0.hasTag = function(v8, v9) --[[ Line: 80 ]] --[[ Name: hasTag ]]
    if not v8._classData.tags then
        return false;
    else
        return table.find(v8._classData.tags, v9) ~= nil;
    end;
end;
v0.getValueForModifier = function(v10, v11) --[[ Line: 88 ]] --[[ Name: getValueForModifier ]]
    if not v10._classData.modifiers then
        return 1;
    else
        return v10._classData.modifiers[v11] or 1;
    end;
end;
v0.destroy = function(v12) --[[ Line: 97 ]] --[[ Name: destroy ]]
    v12._destroyed = true;
    for _, v14 in pairs(v12._connections) do
        v14:Disconnect();
    end;
end;
return v0;