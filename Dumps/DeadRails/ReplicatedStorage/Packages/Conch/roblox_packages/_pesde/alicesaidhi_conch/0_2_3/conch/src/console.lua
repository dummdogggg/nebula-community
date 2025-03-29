--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch.0.2.3.conch.src.console
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require("../roblox_packages/ast");
local v3 = require("../roblox_packages/compiler");
local v4 = require("../roblox_packages/vm");
local _ = require("../roblox_packages/types");
local v6 = require("../roblox_packages/intel");
local v7 = require("./net");
local v8 = require("./signal");
local v9 = require("./state");
local _ = require("./types");
local v11 = require("./user");
local v12 = l_RunService_0:IsServer();
local v13 = {
    locals = {}, 
    upvalues = {}, 
    instructions = {}
};
local v14 = v4();
local v15 = {};
local v16 = v8();
local v17 = {
    vm = v14, 
    commands = v15, 
    output = print
};
local v18 = {};
local function v23(v19, v20) --[[ Line: 30 ]] --[[ Name: register_type ]]
    -- upvalues: v18 (copy)
    v18[v19] = v20;
    return function(v21, v22) --[[ Line: 40 ]]
        -- upvalues: v19 (copy)
        return {
            name = v21, 
            description = v22, 
            kind = "arg", 
            type = v19
        };
    end;
end;
local function v26(v24, v25) --[[ Line: 50 ]] --[[ Name: write_global ]]
    -- upvalues: v9 (copy), v14 (copy)
    assert(v9.local_user, "cannot set global on server");
    assert(string.match(v24, "^[A-z%-@_]*$"), (("%* is not a valid name"):format(v24)));
    v14.globals[v24] = v25;
end;
local function v28(v27) --[[ Line: 56 ]] --[[ Name: get_type ]]
    -- upvalues: v18 (copy)
    return v18[v27];
end;
local function v33(v29, v30) --[[ Line: 58 ]] --[[ Name: replicate_to_player ]]
    -- upvalues: v11 (copy), v9 (copy), v7 (copy)
    local v31 = v11.obtain_user_key(v29);
    local v32 = v9.users[v31];
    if not v32 then
        return;
    elseif not v11.has_permissions(v32, unpack(v30.permissions)) then
        return;
    else
        v7.server.fire_register_command(v29, {
            name = v30.name, 
            description = v30.description, 
            permissions = v30.permissions, 
            arguments = v30.arguments
        });
        return;
    end;
end;
local v34 = false;
local function v40(v35) --[[ Line: 85 ]] --[[ Name: execute ]]
    -- upvalues: v2 (copy), v34 (ref), v17 (copy), v3 (copy), v13 (copy), v14 (copy)
    local v36 = v2(v35, false);
    assert(v36.status ~= "pending", "unfinished block");
    assert(not v34, "already executing!");
    v17.output({
        kind = "info", 
        text = ("> %*"):format(v36.src)
    });
    if v36.status == "error" then
        return v17.output({
            kind = "error", 
            text = v36.why
        });
    else
        v34 = true;
        local v37 = v3(v36.value, v13);
        v13.instructions = {};
        (function(v38, v39, ...) --[[ Line: 100 ]] --[[ Name: on_complete ]]
            -- upvalues: v17 (ref)
            if not v38 then
                v17.output({
                    kind = "error", 
                    text = tostring(v39)
                });
            end;
        end)(pcall(v14.run, v37));
        v34 = false;
        return;
    end;
end;
local function v65(v41, v42) --[[ Line: 114 ]] --[[ Name: register_command ]]
    -- upvalues: v18 (copy), v15 (copy), v14 (copy), v9 (copy), v16 (copy), v12 (copy), l_Players_0 (copy), v33 (copy)
    local v43 = {
        v42.arguments()
    } or {
        {
            kind = "varargs", 
            type = "any", 
            name = "...", 
            description = "unspecified"
        }
    };
    local v44 = {};
    local v45 = {};
    for v46, v47 in v43 do
        local v48 = v18[v47.type] or warn((("no argument of type \"%*\" is registered"):format(v47.type))) or v18.any;
        local v49 = table.clone(v48.analysis);
        v45[v46] = v48.convert;
        v44[v46] = {
            kind = v47.kind == "varargs" and "variadic" or "argument", 
            name = v47.name or v49.name, 
            description = v47.description, 
            type = v49.type, 
            suggestion_generator = v49.suggestion_generator
        };
    end;
    local v50 = {
        name = v41, 
        description = v42.description, 
        permissions = v42.permissions, 
        arguments = v43, 
        type_info = {
            kind = "command", 
            name = v41, 
            description = v42.description, 
            arguments = v44
        }, 
        callback = v42.callback, 
        dirty_replicate = true
    };
    v15[v41] = v50;
    v14.commands[v41] = function(...) --[[ Line: 174 ]]
        -- upvalues: v43 (copy), v45 (copy), v42 (copy), v9 (ref), v16 (ref), v41 (copy)
        local v51 = {
            ...
        };
        local function _(v52, ...) --[[ Line: 177 ]] --[[ Name: move ]]
            -- upvalues: v51 (copy)
            for v53 = 0, select("#", ...) - 1 do
                v51[v53 + v52] = select(v53 + 1, ...);
            end;
        end;
        local v55 = nil;
        local v56 = nil;
        for v57, v58 in v43 do
            if v58.variadic then
                v55 = v45[v57];
                v56 = v57;
                break;
            else
                v51[v57] = v45[v57]((select(v57, ...)));
            end;
        end;
        if v55 and v56 then
            for v59 = v56 + 1, select("#", ...) do
                v51[v59] = v55((select(v59, ...)));
            end;
        end;
        local v60 = {
            pcall(v42.callback, unpack(v51))
        };
        local v61 = table.remove(v60, 1);
        local v62 = v9.command_context[coroutine.running()];
        v16:fire({
            ok = v61, 
            who = v62 and v62.executor, 
            command = v41, 
            arguments = v51, 
            result = v60
        });
        if not v61 then
            error(v60[2]);
        end;
        return unpack(v60);
    end;
    if v12 then
        for _, v64 in l_Players_0:GetPlayers() do
            v33(v64, v50);
        end;
    end;
    return v50;
end;
return {
    console = v17, 
    register_quick = function(v66, v67, ...) --[[ Line: 228 ]] --[[ Name: register ]]
        -- upvalues: v65 (copy)
        v65(v66, {
            name = v66, 
            callback = v67, 
            arguments = function() --[[ Line: 232 ]]

            end, 
            permissions = {
                ...
            }
        });
    end, 
    register_command = v65, 
    replicate_to_player = v33, 
    execute = v40, 
    analyze = function(v68, v69) --[[ Line: 237 ]] --[[ Name: analyze ]]
        -- upvalues: v15 (copy), v14 (copy), v13 (copy), v6 (copy)
        local v70 = {};
        local v71 = {};
        local v72 = 1;
        for _, v74 in v15 do
            v71[v72] = v74.type_info;
            v72 = v72 + 1;
        end;
        for v75, v76 in v14.globals do
            v70[v75] = v76;
        end;
        for v77, v78 in v13.locals do
            v70[v78] = v14.locals[v77];
        end;
        return v6.generate_analysis_info({
            code = v68, 
            where = v69, 
            variables = v70, 
            commands = v71
        });
    end, 
    write_global = v26, 
    after_command_run = v16, 
    register_type = v23, 
    get_type = v28, 
    ast = v2
};