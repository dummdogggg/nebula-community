--[[
    Script: ReplicatedStorage.Shared.ValueManager
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Freeze);
local v2 = require(l_ReplicatedStorage_0.Packages.Signal);
local v3 = require(l_ReplicatedStorage_0.Shared.SharedConstants.OperationOrder);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    if v6 then
        assert(v3[v6], string.format("Invalid operation order: %s", v6));
    end;
    local v7 = {
        _originalBaseValue = v5, 
        _baseValue = v5, 
        _lastValue = v5, 
        _operationOrder = v6 or v3.OffsetThenMultiply, 
        _instance = nil, 
        _property = nil, 
        _multipliers = {}, 
        _offsets = {}, 
        changed = v2.new()
    };
    setmetatable(v7, v4);
    return v7;
end;
v4.getValue = function(v8) --[[ Line: 56 ]] --[[ Name: getValue ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v9 = v1.Dictionary.values(v8._multipliers);
    local v10 = v1.Dictionary.values(v8._offsets);
    local v13 = v1.List.reduce(v9, function(v11, v12) --[[ Line: 60 ]]
        return v11 * v12;
    end, 1);
    local v16 = v1.List.reduce(v10, function(v14, v15) --[[ Line: 64 ]]
        return v14 + v15;
    end, 0);
    local v17 = nil;
    if v8._operationOrder == v3.OffsetThenMultiply then
        return (v8._baseValue + v16) * v13;
    else
        if v8._operationOrder == v3.MultiplyThenOffset then
            v17 = v8._baseValue * v13 + v16;
        end;
        return v17;
    end;
end;
v4.reset = function(v18) --[[ Line: 79 ]] --[[ Name: reset ]]
    v18._multipliers = {};
    v18._offsets = {};
    v18._baseValue = v18._originalBaseValue;
end;
v4.setAttachedInstance = function(v19, v20, v21) --[[ Line: 85 ]] --[[ Name: setAttachedInstance ]]
    v19._instance = v20;
    v19._property = v21;
    v19:_onChanged();
end;
v4.detachFromInstance = function(v22) --[[ Line: 92 ]] --[[ Name: detachFromInstance ]]
    v22._instance = nil;
    v22._property = nil;
end;
v4.getMultiplier = function(v23, v24) --[[ Line: 97 ]] --[[ Name: getMultiplier ]]
    return v23._multipliers[v24];
end;
v4.setMultiplier = function(v25, v26, v27) --[[ Line: 101 ]] --[[ Name: setMultiplier ]]
    v25._multipliers[v26] = v27;
    v25:_onChanged();
end;
v4.removeMultiplier = function(v28, v29) --[[ Line: 106 ]] --[[ Name: removeMultiplier ]]
    v28._multipliers[v29] = nil;
    v28:_onChanged();
end;
v4.setOffset = function(v30, v31, v32) --[[ Line: 111 ]] --[[ Name: setOffset ]]
    v30._offsets[v31] = v32;
    v30:_onChanged();
end;
v4.removeOffset = function(v33, v34) --[[ Line: 116 ]] --[[ Name: removeOffset ]]
    v33._offsets[v34] = nil;
    v33:_onChanged();
end;
v4.setBaseValue = function(v35, v36) --[[ Line: 121 ]] --[[ Name: setBaseValue ]]
    v35._baseValue = v36;
    v35:_onChanged();
end;
v4.setOperationOrder = function(v37, v38) --[[ Line: 126 ]] --[[ Name: setOperationOrder ]]
    -- upvalues: v3 (copy)
    assert(v3[v38], string.format("Invalid operation order: %s", v38));
    v37._operationOrder = v38;
    v37:_onChanged();
end;
v4._onChanged = function(v39) --[[ Line: 132 ]] --[[ Name: _onChanged ]]
    local v40 = v39:getValue();
    local l__instance_0 = v39._instance;
    if l__instance_0 then
        l__instance_0[v39._property] = v40;
    end;
    if v40 ~= v39._lastValue then
        v39._lastValue = v40;
        v39.changed:Fire(v40);
    end;
end;
v4.destroy = function(v42) --[[ Line: 146 ]] --[[ Name: destroy ]]
    v42.changed:DisconnectAll();
    v42:detachFromInstance();
end;
return v4;