--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_compiler.0.2.1.conch_compiler.src.lib
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = require("../roblox_packages/types");
local function _(v1, v2) --[[ Line: 11 ]] --[[ Name: DEFINE_LOCAL ]]
    table.insert(v1.locals, v2);
end;
local function v4(v5, v6) --[[ Line: 29 ]] --[[ Name: compile ]]
    -- upvalues: v4 (copy)
    local l_instructions_0 = v6.instructions;
    local v8 = #l_instructions_0 + 1;
    local v9 = false;
    local function _(v10) --[[ Line: 37 ]] --[[ Name: INSERT ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref)
        l_instructions_0[v8] = v10;
        v8 = v8 + 1;
    end;
    local function v16(v12) --[[ Line: 42 ]] --[[ Name: GET_VALUE ]]
        -- upvalues: v6 (copy), l_instructions_0 (copy), v8 (ref)
        local v13 = table.find(v6.locals, v12);
        if v13 then
            local v14 = {
                kind = "push_local", 
                index = v13
            };
            l_instructions_0[v8] = v14;
            v8 = v8 + 1;
            return;
        else
            local v15 = {
                kind = "push_global", 
                name = v12
            };
            l_instructions_0[v8] = v15;
            v8 = v8 + 1;
            return;
        end;
    end;
    local function v21(v17) --[[ Line: 51 ]] --[[ Name: SET_VALUE ]]
        -- upvalues: v6 (copy), l_instructions_0 (copy), v8 (ref)
        local v18 = table.find(v6.locals, v17);
        if v18 then
            local v19 = {
                kind = "set_local", 
                index = v18
            };
            l_instructions_0[v8] = v19;
            v8 = v8 + 1;
            return;
        else
            local v20 = {
                kind = "set_global", 
                name = v17
            };
            l_instructions_0[v8] = v20;
            v8 = v8 + 1;
            return;
        end;
    end;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    v22 = function(v34) --[[ Line: 73 ]] --[[ Name: compile_expression ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref), v24 (ref), v22 (ref), v25 (ref), v23 (ref), v26 (ref), v33 (ref)
        if v34.kind == "boolean" then
            local v35 = {
                kind = "push_boolean", 
                b = v34.token.kind == "true"
            };
            l_instructions_0[v8] = v35;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "number" then
            local v36 = {
                kind = "push_number", 
                n = assert((tonumber(v34.token.text)))
            };
            l_instructions_0[v8] = v36;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "evaluate" then
            if v34.body.kind == "command" then
                v24(v34.body, 1);
                return;
            else
                v22(v34.body);
                return;
            end;
        elseif v34.kind == "lambda" then
            v25(v34.body);
            return;
        elseif v34.kind == "nil" then
            local v37 = {
                kind = "push_nil"
            };
            l_instructions_0[v8] = v37;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "string" then
            local v38 = {
                kind = "push_string", 
                s = string.sub(v34.token.text, 2, -2)
            };
            l_instructions_0[v8] = v38;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "table" then
            v23(v34.table);
            return;
        elseif v34.kind == "var" then
            v26(v34.var);
            return;
        else
            if v34.kind == "vector" then
                v33(v34);
            end;
            return;
        end;
    end;
    v33 = function(v39) --[[ Line: 111 ]] --[[ Name: compile_vector ]]
        -- upvalues: v22 (ref), l_instructions_0 (copy), v8 (ref)
        local v40 = v39.contents[1];
        local v41 = v39.contents[2];
        local v42 = v39.contents[3];
        if v40 then
            v22(v40);
        else
            local v43 = {
                kind = "push_number", 
                n = 0
            };
            l_instructions_0[v8] = v43;
            v8 = v8 + 1;
        end;
        if v41 then
            v22(v41);
        else
            local v44 = {
                kind = "push_number", 
                n = 0
            };
            l_instructions_0[v8] = v44;
            v8 = v8 + 1;
        end;
        if v42 then
            v22(v42);
        else
            local v45 = {
                kind = "push_number", 
                n = 0
            };
            l_instructions_0[v8] = v45;
            v8 = v8 + 1;
        end;
        local v46 = {
            kind = "push_vector"
        };
        l_instructions_0[v8] = v46;
        v8 = v8 + 1;
    end;
    v23 = function(v47) --[[ Line: 137 ]] --[[ Name: compile_table ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref), v22 (ref)
        local v48 = {
            kind = "push_table", 
            alloc = 1
        };
        l_instructions_0[v8] = v48;
        v8 = v8 + 1;
        v48 = 1;
        for _, v50 in v47.fields do
            if v50.kind == "exprkey" then
                v22(v50.key);
                v22(v50.value);
                local v51 = {
                    kind = "set_table"
                };
                l_instructions_0[v8] = v51;
                v8 = v8 + 1;
            elseif v50.kind == "namekey" then
                local v52 = {
                    kind = "push_string", 
                    s = v50.name.text
                };
                l_instructions_0[v8] = v52;
                v8 = v8 + 1;
                v22(v50.value);
                v52 = {
                    kind = "set_table"
                };
                l_instructions_0[v8] = v52;
                v8 = v8 + 1;
            elseif v50.kind == "nokey" then
                local v53 = {
                    kind = "push_number", 
                    n = v48
                };
                l_instructions_0[v8] = v53;
                v8 = v8 + 1;
                v22(v50.value);
                v53 = {
                    kind = "set_table"
                };
                l_instructions_0[v8] = v53;
                v8 = v8 + 1;
                v48 = v48 + 1;
            end;
        end;
    end;
    v24 = function(v54, v55) --[[ Line: 159 ]] --[[ Name: compile_command ]]
        -- upvalues: v26 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref)
        v26(v54.prefix);
        for _, v57 in v54.arguments do
            v22(v57);
        end;
        local v58 = {
            kind = "call", 
            arguments = #v54.arguments, 
            results = v55 or 1e999
        };
        l_instructions_0[v8] = v58;
        v8 = v8 + 1;
    end;
    v25 = function(v59) --[[ Line: 172 ]] --[[ Name: compile_lambda ]]
        -- upvalues: v6 (copy), v4 (ref), l_instructions_0 (copy), v8 (ref)
        local v60 = {
            locals = {}, 
            upvalues = {}, 
            instructions = {}, 
            up = v6
        };
        for v61, v62 in v59.arguments do
            local l_text_0 = v62.text;
            table.insert(v60.locals, l_text_0);
            table.insert(v60.instructions, {
                kind = "set_local", 
                index = v61
            });
        end;
        v4(v59.block, v60);
        local v64 = {
            kind = "push_function", 
            body = v60.instructions, 
            arguments = #v59.arguments
        };
        l_instructions_0[v8] = v64;
        v8 = v8 + 1;
    end;
    v26 = function(v65) --[[ Line: 193 ]] --[[ Name: compile_var ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref), v16 (copy), v24 (ref), v22 (ref)
        local l_prefix_0 = v65.prefix;
        if l_prefix_0.kind == "global" then
            local v67 = {
                kind = "push_cmd", 
                name = l_prefix_0.token.text
            };
            l_instructions_0[v8] = v67;
            v8 = v8 + 1;
        elseif l_prefix_0.kind == "name" then
            v16(l_prefix_0.name.text);
        elseif l_prefix_0.kind == "paren" then
            if l_prefix_0.expr.kind == "command" then
                v24(l_prefix_0.expr);
            else
                v22(l_prefix_0.expr);
            end;
        end;
        for _, v69 in v65.suffixes do
            if v69.kind == "exprindex" then
                if v69.expr.kind == "command" then
                    v24(v69.expr, 1);
                else
                    v22(v69.expr);
                end;
                local v70 = {
                    kind = "index"
                };
                l_instructions_0[v8] = v70;
                v8 = v8 + 1;
            elseif v69.kind == "nameindex" then
                local v71 = {
                    kind = "push_string", 
                    s = v69.name.text
                };
                l_instructions_0[v8] = v71;
                v8 = v8 + 1;
                v71 = {
                    kind = "index"
                };
                l_instructions_0[v8] = v71;
                v8 = v8 + 1;
            end;
        end;
    end;
    v27 = function(v72) --[[ Line: 223 ]] --[[ Name: compile_assignment ]]
        -- upvalues: v24 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref)
        local l_text_1 = v72.left.text;
        local l_right_0 = v72.right;
        if l_right_0.kind == "command" then
            v24(l_right_0);
        else
            v22(l_right_0);
        end;
        local v75 = {
            kind = "set_global", 
            name = l_text_1
        };
        l_instructions_0[v8] = v75;
        v8 = v8 + 1;
    end;
    v28 = function(v76) --[[ Line: 235 ]] --[[ Name: compile_last ]]
        -- upvalues: v24 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref), v9 (ref)
        if v76.kind == "return" then
            for _, v78 in v76.values do
                if v78.kind == "command" then
                    v24(v78);
                else
                    v22(v78);
                end;
            end;
            local v79 = {
                kind = "return"
            };
            l_instructions_0[v8] = v79;
            v8 = v8 + 1;
            return;
        elseif v76.kind == "break" then
            assert(v9, "cannot use continue outside a loop");
            local v80 = {
                kind = "goto-pending", 
                type = "break"
            };
            l_instructions_0[v8] = v80;
            v8 = v8 + 1;
            return;
        elseif v76.kind == "continue" then
            assert(v9, "cannot use continue outside a loop");
            local v81 = {
                kind = "goto", 
                to = v9
            };
            l_instructions_0[v8] = v81;
            v8 = v8 + 1;
            return;
        else
            error((("unimplemented %*"):format(v76.kind)));
            return;
        end;
    end;
    v29 = function(v82) --[[ Line: 258 ]] --[[ Name: compile_if ]]
        -- upvalues: v8 (ref), v24 (ref), v22 (ref), l_instructions_0 (copy), v32 (ref)
        local l_v8_0 = v8;
        for _, v85 in v82.ifs do
            local l_v8_1 = v8;
            if v85.condition.kind == "command" then
                v24(v85.condition, 1);
            else
                v22(v85.condition);
            end;
            local v87 = {
                kind = "goto-pending", 
                type = "next-if"
            };
            l_instructions_0[v8] = v87;
            v8 = v8 + 1;
            v32(v85.block);
            v87 = {
                kind = "goto-pending", 
                type = "if-end"
            };
            l_instructions_0[v8] = v87;
            v8 = v8 + 1;
            for v88 = v8 - 1, l_v8_1, -1 do
                local v89 = l_instructions_0[v88];
                if v89.kind == "goto-pending" and v89.type == "next-if" then
                    l_instructions_0[v88] = {
                        kind = "jump_if", 
                        to = v8
                    };
                end;
            end;
        end;
        if v82.fallback then
            v32(v82.fallback);
        end;
        for v90 = v8 - 1, l_v8_0, -1 do
            local v91 = l_instructions_0[v90];
            if v91.kind == "goto-pending" and v91.type == "if-end" then
                l_instructions_0[v90] = {
                    kind = "goto", 
                    to = v8
                };
            end;
        end;
    end;
    v30 = function(v92) --[[ Line: 301 ]] --[[ Name: compile_for ]]
        -- upvalues: v9 (ref), v24 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref), v21 (copy), v16 (copy), v32 (ref)
        local v93 = #v92.call.arguments;
        local l_v9_0 = v9;
        if v92.expression.kind == "command" then
            v24(v92.expression, 1);
        else
            v22(v92.expression);
        end;
        local v95 = {
            kind = "turn-into-iterator"
        };
        l_instructions_0[v8] = v95;
        v8 = v8 + 1;
        v21("--iterator");
        v95 = v8;
        v9 = v95;
        v16("--iterator");
        local v96 = {
            kind = "call", 
            arguments = 0, 
            results = math.max(1, v93)
        };
        l_instructions_0[v8] = v96;
        v8 = v8 + 1;
        v96 = {
            kind = "jump_if_not_nil", 
            index = 1, 
            to = 0
        };
        l_instructions_0[v8] = v96;
        v8 = v8 + 1;
        local l_v8_2 = v8;
        for v98 = #v92.call.arguments, 1, -1 do
            local v99 = v92.call.arguments[v98];
            v21(v99.text);
        end;
        local v100 = {
            kind = "reset"
        };
        l_instructions_0[v8] = v100;
        v8 = v8 + 1;
        v32(v92.call.block);
        v100 = {
            kind = "goto", 
            to = v95
        };
        l_instructions_0[v8] = v100;
        v8 = v8 + 1;
        v96.to = v8;
        for v101 = v8 - 1, l_v8_2, -1 do
            local v102 = l_instructions_0[v101];
            if v102.kind == "goto-pending" and v102.type == "break" then
                l_instructions_0[v101] = {
                    kind = "goto", 
                    to = v8
                };
            end;
        end;
        v9 = l_v9_0;
    end;
    v31 = function(v103) --[[ Line: 349 ]] --[[ Name: compile_while ]]
        -- upvalues: v8 (ref), v9 (ref), v24 (ref), v22 (ref), l_instructions_0 (copy), v32 (ref)
        local l_v8_3 = v8;
        local l_v9_1 = v9;
        v9 = l_v8_3;
        if v103.expression.kind == "command" then
            v24(v103.expression, 0);
        else
            v22(v103.expression);
        end;
        local v106 = {
            kind = "jump_if", 
            index = 1, 
            to = 0
        };
        l_instructions_0[v8] = v106;
        v8 = v8 + 1;
        local l_v8_4 = v8;
        v32(v103.block);
        local v108 = {
            kind = "goto", 
            to = l_v8_3
        };
        l_instructions_0[v8] = v108;
        v8 = v8 + 1;
        v106.to = v8;
        for v109 = v8 - 1, l_v8_4, -1 do
            local v110 = l_instructions_0[v109];
            if v110.kind == "goto-pending" and v110.type == "break" then
                l_instructions_0[v109] = {
                    kind = "goto", 
                    to = v8
                };
            end;
        end;
        v9 = l_v9_1;
    end;
    v32 = function(v111) --[[ Line: 383 ]] --[[ Name: compile_block ]]
        -- upvalues: v27 (ref), v6 (copy), v24 (ref), v30 (ref), v29 (ref), v31 (ref), v28 (ref)
        for _, v113 in v111.body do
            if v113.kind == "assign" then
                v27(v113, v6);
            elseif v113.kind == "command" then
                v24(v113, 0);
            elseif v113.kind == "for" then
                v30(v113);
            elseif v113.kind == "if" then
                v29(v113);
            elseif v113.kind == "while" then
                v31(v113);
            else
                error((("not implemented %*"):format(v113.kind)));
            end;
        end;
        if v111.last_statement then
            v28(v111.last_statement);
        end;
    end;
    v32(v5);
    return v6.instructions;
end;
return v4;