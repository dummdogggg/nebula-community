--[[
    Script: ReplicatedStorage.Packages.t.ts
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v5 = {
    type = function(v0) --[[ Line: 5 ]] --[[ Name: type ]]
        return function(v1) --[[ Line: 6 ]]
            -- upvalues: v0 (copy)
            if type(v1) == v0 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    typeof = function(v2) --[[ Line: 16 ]] --[[ Name: typeof ]]
        return function(v3) --[[ Line: 17 ]]
            -- upvalues: v2 (copy)
            if typeof(v3) == v2 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    any = function(v4) --[[ Line: 34 ]] --[[ Name: any ]]
        if v4 ~= nil then
            return true;
        else
            return false;
        end;
    end
};
v5.boolean = v5.typeof("boolean");
v5.thread = v5.typeof("thread");
v5.callback = v5.typeof("function");
v5["function"] = v5.callback;
v5.none = v5.typeof("nil");
v5["nil"] = v5.none;
v5.string = v5.typeof("string");
v5.table = v5.typeof("table");
v5.userdata = v5.type("userdata");
v5.number = function(v6) --[[ Line: 116 ]] --[[ Name: number ]]
    if typeof(v6) == "number" then
        if v6 == v6 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v5.nan = function(v7) --[[ Line: 136 ]] --[[ Name: nan ]]
    if typeof(v7) == "number" then
        if v7 ~= v7 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v5.Axes = v5.typeof("Axes");
v5.BrickColor = v5.typeof("BrickColor");
v5.CatalogSearchParams = v5.typeof("CatalogSearchParams");
v5.CFrame = v5.typeof("CFrame");
v5.Color3 = v5.typeof("Color3");
v5.ColorSequence = v5.typeof("ColorSequence");
v5.ColorSequenceKeypoint = v5.typeof("ColorSequenceKeypoint");
v5.DateTime = v5.typeof("DateTime");
v5.DockWidgetPluginGuiInfo = v5.typeof("DockWidgetPluginGuiInfo");
v5.Enum = v5.typeof("Enum");
v5.EnumItem = v5.typeof("EnumItem");
v5.Enums = v5.typeof("Enums");
v5.Faces = v5.typeof("Faces");
v5.FloatCurveKey = v5.typeof("FloatCurveKey");
v5.Font = v5.typeof("Font");
v5.Instance = v5.typeof("Instance");
v5.NumberRange = v5.typeof("NumberRange");
v5.NumberSequence = v5.typeof("NumberSequence");
v5.NumberSequenceKeypoint = v5.typeof("NumberSequenceKeypoint");
v5.OverlapParams = v5.typeof("OverlapParams");
v5.PathWaypoint = v5.typeof("PathWaypoint");
v5.PhysicalProperties = v5.typeof("PhysicalProperties");
v5.Random = v5.typeof("Random");
v5.Ray = v5.typeof("Ray");
v5.RaycastParams = v5.typeof("RaycastParams");
v5.RaycastResult = v5.typeof("RaycastResult");
v5.RBXScriptConnection = v5.typeof("RBXScriptConnection");
v5.RBXScriptSignal = v5.typeof("RBXScriptSignal");
v5.Rect = v5.typeof("Rect");
v5.Region3 = v5.typeof("Region3");
v5.Region3int16 = v5.typeof("Region3int16");
v5.TweenInfo = v5.typeof("TweenInfo");
v5.UDim = v5.typeof("UDim");
v5.UDim2 = v5.typeof("UDim2");
v5.Vector2 = v5.typeof("Vector2");
v5.Vector2int16 = v5.typeof("Vector2int16");
v5.Vector3 = v5.typeof("Vector3");
v5.Vector3int16 = v5.typeof("Vector3int16");
v5.literal = function(...) --[[ Line: 500 ]] --[[ Name: literal ]]
    -- upvalues: v5 (copy)
    local v8 = select("#", ...);
    if v8 == 1 then
        local v9 = ...;
        return function(v10) --[[ Line: 504 ]]
            -- upvalues: v9 (copy)
            if v10 ~= v9 then
                return false;
            else
                return true;
            end;
        end;
    else
        local v11 = {};
        for v12 = 1, v8 do
            local v13 = select(v12, ...);
            v11[v12] = v5.literal(v13);
        end;
        return v5.union(table.unpack(v11, 1, v8));
    end;
end;
v5.exactly = v5.literal;
v5.keyOf = function(v14) --[[ Line: 535 ]] --[[ Name: keyOf ]]
    -- upvalues: v5 (copy)
    local v15 = {};
    local v16 = 0;
    for v17 in pairs(v14) do
        v16 = v16 + 1;
        v15[v16] = v17;
    end;
    return v5.literal(table.unpack(v15, 1, v16));
end;
v5.valueOf = function(v18) --[[ Line: 553 ]] --[[ Name: valueOf ]]
    -- upvalues: v5 (copy)
    local v19 = {};
    local v20 = 0;
    for _, v22 in pairs(v18) do
        v20 = v20 + 1;
        v19[v20] = v22;
    end;
    return v5.literal(table.unpack(v19, 1, v20));
end;
v5.integer = function(v23) --[[ Line: 571 ]] --[[ Name: integer ]]
    -- upvalues: v5 (copy)
    if not v5.number(v23) then
        return false;
    elseif v23 % 1 == 0 then
        return true;
    else
        return false;
    end;
end;
v5.numberMin = function(v24) --[[ Line: 591 ]] --[[ Name: numberMin ]]
    -- upvalues: v5 (copy)
    return function(v25) --[[ Line: 592 ]]
        -- upvalues: v5 (ref), v24 (copy)
        if not v5.number(v25) then
            return false;
        elseif v24 <= v25 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMax = function(v26) --[[ Line: 613 ]] --[[ Name: numberMax ]]
    -- upvalues: v5 (copy)
    return function(v27) --[[ Line: 614 ]]
        -- upvalues: v5 (ref), v26 (copy)
        if not v5.number(v27) then
            return false;
        elseif v27 <= v26 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMinExclusive = function(v28) --[[ Line: 635 ]] --[[ Name: numberMinExclusive ]]
    -- upvalues: v5 (copy)
    return function(v29) --[[ Line: 636 ]]
        -- upvalues: v5 (ref), v28 (copy)
        if not v5.number(v29) then
            return false;
        elseif v28 < v29 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMaxExclusive = function(v30) --[[ Line: 657 ]] --[[ Name: numberMaxExclusive ]]
    -- upvalues: v5 (copy)
    return function(v31) --[[ Line: 658 ]]
        -- upvalues: v5 (ref), v30 (copy)
        if not v5.number(v31) then
            return false;
        elseif v31 < v30 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberPositive = v5.numberMinExclusive(0);
v5.numberNegative = v5.numberMaxExclusive(0);
v5.numberConstrained = function(v32, v33) --[[ Line: 694 ]] --[[ Name: numberConstrained ]]
    -- upvalues: v5 (copy)
    assert(v5.number(v32));
    assert(v5.number(v33));
    local v34 = v5.numberMin(v32);
    local v35 = v5.numberMax(v33);
    return function(v36) --[[ Line: 700 ]]
        -- upvalues: v34 (copy), v35 (copy)
        if not v34(v36) then
            return false;
        elseif not v35(v36) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.numberConstrainedExclusive = function(v37, v38) --[[ Line: 723 ]] --[[ Name: numberConstrainedExclusive ]]
    -- upvalues: v5 (copy)
    assert(v5.number(v37));
    assert(v5.number(v38));
    local v39 = v5.numberMinExclusive(v37);
    local v40 = v5.numberMaxExclusive(v38);
    return function(v41) --[[ Line: 729 ]]
        -- upvalues: v39 (copy), v40 (copy)
        if not v39(v41) then
            return false;
        elseif not v40(v41) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.match = function(v42) --[[ Line: 751 ]] --[[ Name: match ]]
    -- upvalues: v5 (copy)
    assert(v5.string(v42));
    return function(v43) --[[ Line: 753 ]]
        -- upvalues: v5 (ref), v42 (copy)
        if not v5.string(v43) then
            return false;
        elseif string.match(v43, v42) == nil then
            return false;
        else
            return true;
        end;
    end;
end;
v5.optional = function(v44) --[[ Line: 774 ]] --[[ Name: optional ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v44));
    return function(v45) --[[ Line: 776 ]]
        -- upvalues: v44 (copy)
        if v45 == nil then
            return true;
        elseif v44(v45) then
            return true;
        else
            return false;
        end;
    end;
end;
v5.tuple = function(...) --[[ Line: 797 ]] --[[ Name: tuple ]]
    local v46 = {
        ...
    };
    return function(...) --[[ Line: 799 ]]
        -- upvalues: v46 (copy)
        local v47 = {
            ...
        };
        for v48, v49 in ipairs(v46) do
            if v49(v47[v48]) == false then
                return false;
            end;
        end;
        return true;
    end;
end;
v5.keys = function(v50) --[[ Line: 819 ]] --[[ Name: keys ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v50));
    return function(v51) --[[ Line: 821 ]]
        -- upvalues: v5 (ref), v50 (copy)
        if v5.table(v51) == false then
            return false;
        else
            for v52 in pairs(v51) do
                if v50(v52) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.values = function(v53) --[[ Line: 845 ]] --[[ Name: values ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v53));
    return function(v54) --[[ Line: 847 ]]
        -- upvalues: v5 (ref), v53 (copy)
        if v5.table(v54) == false then
            return false;
        else
            for _, v56 in pairs(v54) do
                if v53(v56) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.map = function(v57, v58) --[[ Line: 872 ]] --[[ Name: map ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v57));
    assert(v5.callback(v58));
    local v59 = v5.keys(v57);
    local v60 = v5.values(v58);
    return function(v61) --[[ Line: 878 ]]
        -- upvalues: v59 (copy), v60 (copy)
        if not v59(v61) then
            return false;
        elseif not v60(v61) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.set = function(v62) --[[ Line: 900 ]] --[[ Name: set ]]
    -- upvalues: v5 (copy)
    return v5.map(v62, v5.literal(true));
end;
local v63 = v5.keys(v5.integer);
local l_v63_0 = v63 --[[ copy: 1 -> 2 ]];
v5.array = function(v65) --[[ Line: 913 ]] --[[ Name: array ]]
    -- upvalues: v5 (copy), l_v63_0 (copy)
    assert(v5.callback(v65));
    local v66 = v5.values(v65);
    return function(v67) --[[ Line: 917 ]]
        -- upvalues: l_v63_0 (ref), v66 (copy)
        if l_v63_0(v67) == false then
            return false;
        else
            local v68 = 0;
            for _ in ipairs(v67) do
                v68 = v68 + 1;
            end;
            for v70 in pairs(v67) do
                if v70 < 1 or v68 < v70 then
                    return false;
                end;
            end;
            if not v66(v67) then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v5.strictArray = function(...) --[[ Line: 953 ]] --[[ Name: strictArray ]]
    -- upvalues: v5 (copy), l_v63_0 (copy)
    local v71 = {
        ...
    };
    assert(v5.array(v5.callback)(v71));
    return function(v72) --[[ Line: 957 ]]
        -- upvalues: l_v63_0 (ref), v71 (copy)
        if l_v63_0(v72) == false then
            return false;
        elseif #v71 < #v72 then
            return false;
        else
            for v73, v74 in pairs(v71) do
                if not v74(v72[v73]) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v63 = v5.array(v5.callback);
local l_v63_1 = v63 --[[ copy: 1 -> 3 ]];
v5.union = function(...) --[[ Line: 989 ]] --[[ Name: union ]]
    -- upvalues: l_v63_1 (copy)
    local v76 = {
        ...
    };
    assert(l_v63_1(v76));
    return function(v77) --[[ Line: 993 ]]
        -- upvalues: v76 (copy)
        for _, v79 in ipairs(v76) do
            if v79(v77) then
                return true;
            end;
        end;
        return false;
    end;
end;
v5.some = v5.union;
v5.intersection = function(...) --[[ Line: 1016 ]] --[[ Name: intersection ]]
    -- upvalues: l_v63_1 (copy)
    local v80 = {
        ...
    };
    assert(l_v63_1(v80));
    return function(v81) --[[ Line: 1020 ]]
        -- upvalues: v80 (copy)
        for _, v83 in ipairs(v80) do
            if not v83(v81) then
                return false;
            end;
        end;
        return true;
    end;
end;
v5.every = v5.intersection;
v63 = v5.map(v5.any, v5.callback);
local l_v63_2 = v63 --[[ copy: 1 -> 4 ]];
v5.interface = function(v85) --[[ Line: 1047 ]] --[[ Name: interface ]]
    -- upvalues: l_v63_2 (copy), v5 (copy)
    assert(l_v63_2(v85));
    return function(v86) --[[ Line: 1049 ]]
        -- upvalues: v5 (ref), v85 (copy)
        if v5.table(v86) == false then
            return false;
        else
            for v87, v88 in pairs(v85) do
                if v88(v86[v87]) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.strictInterface = function(v89) --[[ Line: 1073 ]] --[[ Name: strictInterface ]]
    -- upvalues: l_v63_2 (copy), v5 (copy)
    assert(l_v63_2(v89));
    return function(v90) --[[ Line: 1075 ]]
        -- upvalues: v5 (ref), v89 (copy)
        if v5.table(v90) == false then
            return false;
        else
            for v91, v92 in pairs(v89) do
                if v92(v90[v91]) == false then
                    return false;
                end;
            end;
            for v93 in pairs(v90) do
                if not v89[v93] then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.instanceOf = function(v94, v95) --[[ Line: 1106 ]] --[[ Name: instanceOf ]]
    -- upvalues: v5 (copy)
    assert(v5.string(v94));
    local v96 = nil;
    if v95 ~= nil then
        v96 = v5.children(v95);
    end;
    return function(v97) --[[ Line: 1114 ]]
        -- upvalues: v5 (ref), v94 (copy), v96 (ref)
        if not v5.Instance(v97) then
            return false;
        elseif v97.ClassName ~= v94 then
            return false;
        elseif v96 and not v96(v97) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.instance = v5.instanceOf;
v5.instanceIsA = function(v98, v99) --[[ Line: 1144 ]] --[[ Name: instanceIsA ]]
    -- upvalues: v5 (copy)
    assert(v5.string(v98));
    local v100 = nil;
    if v99 ~= nil then
        v100 = v5.children(v99);
    end;
    return function(v101) --[[ Line: 1152 ]]
        -- upvalues: v5 (ref), v98 (copy), v100 (ref)
        if not v5.Instance(v101) then
            return false;
        elseif not v101:IsA(v98) then
            return false;
        elseif v100 and not v100(v101) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.enum = function(v102) --[[ Line: 1180 ]] --[[ Name: enum ]]
    -- upvalues: v5 (copy)
    assert(v5.Enum(v102));
    return function(v103) --[[ Line: 1182 ]]
        -- upvalues: v5 (ref), v102 (copy)
        if not v5.EnumItem(v103) then
            return false;
        elseif v103.EnumType == v102 then
            return true;
        else
            return false;
        end;
    end;
end;
v63 = v5.tuple(v5.callback, v5.callback);
local l_v63_3 = v63 --[[ copy: 1 -> 5 ]];
v5.wrap = function(v105, v106) --[[ Line: 1207 ]] --[[ Name: wrap ]]
    -- upvalues: l_v63_3 (copy)
    assert(l_v63_3(v105, v106));
    return function(...) --[[ Line: 1209 ]]
        -- upvalues: v106 (copy), v105 (copy)
        assert(v106(...));
        return v105(...);
    end;
end;
v5.strict = function(v107) --[[ Line: 1223 ]] --[[ Name: strict ]]
    return function(...) --[[ Line: 1224 ]]
        -- upvalues: v107 (copy)
        assert(v107(...));
    end;
end;
v63 = v5.map(v5.string, v5.callback);
v5.children = function(v108) --[[ Line: 1243 ]] --[[ Name: children ]]
    -- upvalues: v63 (copy), v5 (copy)
    assert(v63(v108));
    return function(v109) --[[ Line: 1246 ]]
        -- upvalues: v5 (ref), v108 (copy)
        if not v5.Instance(v109) then
            return false;
        else
            local v110 = {};
            for _, v112 in ipairs(v109:GetChildren()) do
                local l_Name_0 = v112.Name;
                if v108[l_Name_0] then
                    if v110[l_Name_0] then
                        return false;
                    else
                        v110[l_Name_0] = v112;
                    end;
                end;
            end;
            for v114, v115 in pairs(v108) do
                if not v115(v110[v114]) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
return {
    t = v5
};