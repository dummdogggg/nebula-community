--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.arguments
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Players_0 = game:GetService("Players");
local v1 = require("./console");
local v2 = require("./context");
local _ = require("./types");
local function v5(v4) --[[ Line: 7 ]] --[[ Name: noop ]]
    return v4;
end;
local function v7(v6) --[[ Line: 9 ]] --[[ Name: wrap_if_not ]]
    if type(v6) == "table" then
        return v6;
    else
        return {
            v6
        };
    end;
end;
local v8 = {
    convert = v5, 
    analysis = {
        kind = "argument", 
        name = "any", 
        type = "any"
    }
};
local v9 = {
    convert = tostring, 
    analysis = {
        kind = "argument", 
        name = "string", 
        type = "string"
    }
};
local v14 = {
    convert = function(v10) --[[ Line: 34 ]] --[[ Name: convert ]]
        if typeof(v10) == "table" then
            local v11 = table.clone(v10);
            for v12, v13 in v11 do
                v11[v12] = tostring(v13);
            end;
            return v11;
        else
            return {
                (tostring(v10))
            };
        end;
    end, 
    analysis = {
        kind = "argument", 
        name = "strings", 
        type = "{ string }"
    }
};
local v15 = {
    convert = v5, 
    analysis = {
        kind = "argument", 
        name = "number", 
        type = "number"
    }
};
local v16 = {
    convert = v7, 
    analysis = {
        kind = "argument", 
        name = "numbers", 
        type = "{ number }"
    }
};
local v20 = {
    convert = function(v17) --[[ Line: 74 ]] --[[ Name: convert ]]
        if typeof(v17) == "boolean" then
            return v17;
        elseif typeof(v17) == "number" and v17 > 0 then
            return true;
        elseif typeof(v17) == "number" and v17 <= 0 then
            return false;
        else
            error((("%* is not a valid boolean"):format((typeof(v17)))));
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        name = "boolean", 
        type = "boolean", 
        suggestion_generator = function(v18) --[[ Line: 91 ]] --[[ Name: suggestion_generator ]]
            local v19 = {};
            if string.sub("true", 1, #v18) == v18 then
                table.insert(v19, "true");
            end;
            if string.sub("false", 1, #v18) == v18 then
                table.insert(v19, "false");
            end;
            return v19;
        end
    }
};
local v27 = {
    convert = function(v21) --[[ Line: 108 ]] --[[ Name: convert ]]
        if typeof(v21) == "table" then
            local v22 = table.clone(v21);
            for v23, v24 in v22 do
                if typeof(v24) == "boolean" then
                    v22[v23] = v24;
                elseif typeof(v24) == "number" and v24 > 0 then
                    v22[v23] = true;
                elseif typeof(v24) == "number" and v24 <= 0 then
                    v22[v23] = false;
                else
                    error((("type %* of %* is not a valid boolean"):format(typeof(v24), v23)));
                end;
            end;
            return v22;
        elseif typeof(v21) == "boolean" then
            return {
                v21
            };
        elseif typeof(v21) == "number" and v21 > 0 then
            return {
                true
            };
        elseif typeof(v21) == "number" and v21 <= 0 then
            return {
                false
            };
        else
            error((("%* is not a valid boolean"):format((typeof(v21)))));
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        name = "boolean", 
        type = "boolean", 
        suggestion_generator = function(v25) --[[ Line: 139 ]] --[[ Name: suggestion_generator ]]
            local v26 = {};
            if string.sub("true", 1, #v25) == v25 then
                table.insert(v26, "true");
            end;
            if string.sub("false", 1, #v25) == v25 then
                table.insert(v26, "false");
            end;
            return v26;
        end
    }
};
local v28 = {
    convert = v5, 
    analysis = {
        kind = "argument", 
        name = "table", 
        type = "table"
    }
};
local v30 = {
    convert = function(v29) --[[ Line: 165 ]] --[[ Name: into_vector ]]
        if type(v29) == "vector" then
            return v29;
        elseif typeof(v29) == "table" then
            return (vector.create(v29[1] or 0, v29[2] or 0, v29[3] or 0));
        else
            error(("%* is not valid"):format(v29), 0);
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        name = "vector", 
        type = "vector"
    }
};
local v36 = {
    convert = function(v31) --[[ Line: 185 ]] --[[ Name: convert ]]
        if type(v31) == "vector" then
            return {
                v31
            };
        elseif typeof(v31) == "table" then
            local v32 = {};
            for v33, v34 in v31 do
                local v35;
                if type(v34) == "vector" then
                    v35 = v34;
                elseif typeof(v34) == "table" then
                    v35 = vector.create(v34[1] or 0, v34[2] or 0, v34[3] or 0);
                else
                    error(("%* is not valid"):format(v34), 0);
                    v35 = nil;
                end;
                v32[v33] = v35;
            end;
            return v32;
        else
            error(("%* is not valid"):format(v31), 0);
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        name = "vector", 
        type = "vector"
    }
};
local function v45(v37, v38, v39) --[[ Line: 211 ]] --[[ Name: enum_map ]]
    return {
        convert = function(v40) --[[ Line: 217 ]] --[[ Name: convert ]]
            -- upvalues: v37 (copy)
            local v41 = tostring(v40);
            if v37[v41] == nil then
                error(("%* is not valid"):format(v41), 0);
            end;
            return v37[v41];
        end, 
        analysis = {
            kind = "argument", 
            name = v38 or "enum", 
            description = v39, 
            type = v38 or "enum", 
            suggestion_generator = function(v42) --[[ Line: 228 ]] --[[ Name: suggestion_generator ]]
                -- upvalues: v37 (copy)
                v42 = v42:lower();
                local v43 = {};
                for v44 in v37 do
                    if string.sub(v44:lower(), 1, #v42) == v42 then
                        table.insert(v43, v44);
                    end;
                end;
                return v43;
            end
        }
    };
end;
local function v52(v46, v47, v48) --[[ Line: 246 ]] --[[ Name: enum_new ]]
    -- upvalues: v45 (copy)
    local v49 = {};
    for _, v51 in v46 do
        v49[tostring(v51)] = v51;
    end;
    return (v45(v49, v47, v48));
end;
local function v55(v53) --[[ Line: 256 ]] --[[ Name: convert_arg_to_player ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    local v54 = v2.get_command_context();
    if v53 == "@s" then
        return v54 and v54.executor.player or error("not executed by a player");
    elseif typeof(v53) == "number" then
        return (assert(l_Players_0:GetPlayerByUserId(v53), (("player with id %* is not in this server"):format(v53))));
    elseif typeof(v53) == "string" then
        return (assert(l_Players_0:FindFirstChild(v53), (("player \"%*\" is not valid"):format(v53))));
    else
        error((("unknown arg %*"):format(v53)));
        return;
    end;
end;
local function v60(v56) --[[ Line: 277 ]] --[[ Name: convert_arg_to_players ]]
    -- upvalues: l_Players_0 (copy), v55 (copy)
    if v56 == "@a" then
        return l_Players_0:GetPlayers();
    elseif typeof(v56) == "table" then
        local v57 = table.clone(v56);
        for v58, v59 in v57 do
            v57[v58] = v55(v59);
        end;
        return v57;
    else
        return {
            v55(v56)
        };
    end;
end;
local v66 = {
    convert = function(v61) --[[ Line: 296 ]] --[[ Name: convert ]]
        -- upvalues: v55 (copy)
        return v55(v61);
    end, 
    analysis = {
        kind = "argument", 
        name = "player", 
        type = "Player", 
        suggestion_generator = function(v62) --[[ Line: 302 ]] --[[ Name: suggestion_generator ]]
            -- upvalues: l_Players_0 (copy)
            v62 = v62:lower();
            local v63 = {};
            if string.sub("@s", 1, #v62) == v62 then
                table.insert(v63, "@s");
            end;
            for _, v65 in l_Players_0:GetPlayers() do
                if string.sub(v65.Name:lower(), 1, #v62) == v62 or string.sub(v65.DisplayName:lower(), 1, #v62) == v62 then
                    table.insert(v63, v65.Name);
                end;
            end;
            return v63;
        end
    }
};
local v72 = {
    kind = "any", 
    convert = function(v67) --[[ Line: 327 ]] --[[ Name: convert ]]
        -- upvalues: v60 (copy)
        return v60(v67);
    end, 
    analysis = {
        kind = "argument", 
        name = "players", 
        type = "{ Player }", 
        suggestion_generator = function(v68) --[[ Line: 333 ]] --[[ Name: suggestion_generator ]]
            -- upvalues: l_Players_0 (copy)
            v68 = v68:lower();
            local v69 = {};
            if string.sub("@s", 1, #v68) == v68 then
                table.insert(v69, "@s");
            end;
            if string.sub("@a", 1, #v68) == v68 then
                table.insert(v69, "@a");
            end;
            for _, v71 in l_Players_0:GetPlayers() do
                if string.sub(v71.Name:lower(), 1, #v68) == v68 or string.sub(v71.DisplayName:lower(), 1, #v68) == v68 then
                    table.insert(v69, v71.Name);
                end;
            end;
            return v69;
        end
    }
};
return {
    any = v1.register_type("any", v8), 
    string = v1.register_type("string", v9), 
    strings = v1.register_type("strings", v14), 
    number = v1.register_type("number", v15), 
    numbers = v1.register_type("numbers", v16), 
    boolean = v1.register_type("boolean", v20), 
    booleans = v1.register_type("booleans", v27), 
    table = v1.register_type("table", v28), 
    vector = v1.register_type("vector", v30), 
    vectors = v1.register_type("vectors", v36), 
    player = v1.register_type("player", v66), 
    players = v1.register_type("players", v72), 
    userinput = v1.register_type("userinput", ((function(v73) --[[ Line: 359 ]] --[[ Name: generate_names_for_enum ]]
        -- upvalues: v45 (copy)
        local v74 = {};
        for _, v76 in v73:GetEnumItems() do
            v74[v76.Name] = v76;
        end;
        return (v45(v74, (tostring(v73))));
    end)(Enum.UserInputType))), 
    variadic = function(v77) --[[ Line: 371 ]] --[[ Name: variadic ]]
        v77.kind = "varargs";
        return v77;
    end, 
    enum_new = v52, 
    enum_map = v45
};