--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_analysis.0.2.0.conch_analysis.src.optional_ast
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local function _(v0) --[[ Line: 289 ]] --[[ Name: char ]]
    return (string.byte(v0));
end;
local function v573(v2, v3) --[[ Line: 294 ]] --[[ Name: parse ]]
    local v4 = 0;
    local v5 = 0;
    local v6 = buffer.len(v2);
    local function _() --[[ Line: 299 ]] --[[ Name: peek ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy)
        if v4 == v6 then
            return 0;
        else
            return (buffer.readu8(v2, v4));
        end;
    end;
    local function _() --[[ Line: 304 ]] --[[ Name: bump ]]
        -- upvalues: v4 (ref), v6 (copy)
        v4 = math.min(v4 + 1, v6);
    end;
    local function _() --[[ Line: 306 ]] --[[ Name: bump_any ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v5 (ref)
        if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
            v5 = v5 + 1;
        end;
        v4 = math.min(v4 + 1, v6);
        if v4 == v6 then
            return 0;
        else
            return (buffer.readu8(v2, v4));
        end;
    end;
    local function _(v10) --[[ Line: 315 ]] --[[ Name: eof ]]
        -- upvalues: v4 (ref), v6 (copy)
        if v6 <= v4 then
            error(v10, 0);
        end;
        return false;
    end;
    local function _() --[[ Line: 320 ]] --[[ Name: bump_peek ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy)
        v4 = math.min(v4 + 1, v6);
        if v4 == v6 then
            return 0;
        else
            return (buffer.readu8(v2, v4));
        end;
    end;
    local function _(v13) --[[ Line: 325 ]] --[[ Name: is_whitespace ]]
        local v14 = true;
        if v13 ~= 32 then
            v14 = true;
            if v13 ~= 9 then
                v14 = v13 == 13;
            end;
        end;
        return v14;
    end;
    local function _(v16) --[[ Line: 329 ]] --[[ Name: is_digit ]]
        local v17 = false;
        if v16 >= 48 then
            v17 = v16 <= 57;
        end;
        return v17;
    end;
    local function v20(v19) --[[ Line: 333 ]] --[[ Name: is_alpha ]]
        return v19 >= 97 and v19 <= 122 or v19 >= 65 and v19 <= 90 or v19 == 95 or v19 == 64;
    end;
    local function v26() --[[ Line: 340 ]] --[[ Name: string_backslash ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v5 (ref)
        local v21 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        if v21 == 13 then
            v4 = math.min(v4 + 1, v6);
            if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                v4 = math.min(v4 + 1, v6);
                v5 = v5 + 1;
                return;
            end;
        elseif v21 == 122 then
            v4 = math.min(v4 + 1, v6);
            while true do
                local v22 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                local v23 = true;
                if v22 ~= 32 then
                    v23 = true;
                    if v22 ~= 9 then
                        v23 = v22 == 13;
                    end;
                end;
                if v23 then
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                        v5 = v5 + 1;
                    end;
                    v4 = math.min(v4 + 1, v6);
                    if v4 == v6 then
                        v23 = 0;
                    else
                        v23 = buffer.readu8(v2, v4);
                    end;
                else
                    break;
                end;
            end;
        else
            if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                v5 = v5 + 1;
            end;
            v4 = math.min(v4 + 1, v6);
            if v4 == v6 then
                local _ = 0;
                return;
            else
                local _ = buffer.readu8(v2, v4);
            end;
        end;
    end;
    local function v29() --[[ Line: 361 ]] --[[ Name: quoted_string ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v26 (copy)
        local v27 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        v4 = math.min(v4 + 1, v6);
        local v28 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        while v28 ~= v27 do
            if v6 <= v4 then
                error("expected string to be finished at", 0);
            end;
            if not false then
                if v28 == 0 or v28 == 10 or v28 == 13 then
                    return "error";
                else
                    if v28 == 92 then
                        v4 = math.min(v4 + 1, v6);
                        v26();
                    else
                        v4 = math.min(v4 + 1, v6);
                    end;
                    if v4 == v6 then
                        v28 = 0;
                    else
                        v28 = buffer.readu8(v2, v4);
                    end;
                end;
            else
                break;
            end;
        end;
        v4 = math.min(v4 + 1, v6);
        return "string";
    end;
    local function v38() --[[ Line: 384 ]] --[[ Name: number ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v20 (copy)
        local l_v4_0 = v4;
        local v31 = 10;
        local v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        if v32 == 48 then
            v4 = math.min(v4 + 1, v6);
            v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
            if v32 == 120 or v32 == 88 then
                v4 = math.min(v4 + 1, v6);
                v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                v31 = 16;
            elseif v32 == 98 or v32 == 66 then
                v4 = math.min(v4 + 1, v6);
                v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                v31 = 2;
            end;
        end;
        while true do
            local l_v32_0 = v32;
            local v34 = false;
            if l_v32_0 >= 48 then
                v34 = l_v32_0 <= 57;
            end;
            if v34 or v32 == 46 or v32 == 95 then
                v4 = math.min(v4 + 1, v6);
                if v4 == v6 then
                    v32 = 0;
                else
                    v32 = buffer.readu8(v2, v4);
                end;
            else
                break;
            end;
        end;
        if v32 == 101 or v32 == 69 then
            v4 = math.min(v4 + 1, v6);
            v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
            if v32 == 43 or v32 == 45 then
                v4 = math.min(v4 + 1, v6);
                v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
            end;
        end;
        while true do
            local l_v32_1 = v32;
            local v36 = false;
            if l_v32_1 >= 48 then
                v36 = l_v32_1 <= 57;
            end;
            if v36 or v20(v32) or v32 == 95 then
                v4 = math.min(v4 + 1, v6);
                if v4 == v6 then
                    v32 = 0;
                else
                    v32 = buffer.readu8(v2, v4);
                end;
            else
                break;
            end;
        end;
        local v37 = nil;
        v37 = if v31 == 10 then buffer.readstring(v2, l_v4_0, v4 - l_v4_0) else buffer.readstring(v2, l_v4_0 + 2, v4 - l_v4_0 - 2);
        if tonumber(string.gsub(v37, "_", ""), v31) then
            return "number";
        else
            return "error";
        end;
    end;
    local function v39() --[[ Line: 433 ]] --[[ Name: read_kind ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v5 (ref), v20 (copy), v38 (copy), v29 (copy), v39 (copy)
        local v40 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        if v40 == 0 then
            return "eof";
        elseif v40 == 35 then
            while v40 ~= 10 and v40 ~= 0 do
                if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                    v5 = v5 + 1;
                end;
                v4 = math.min(v4 + 1, v6);
                if v4 == v6 then
                    local _ = 0;
                else
                    local _ = buffer.readu8(v2, v4);
                end;
            end;
            return "comment";
        else
            local l_v40_0 = v40;
            local v44 = true;
            if l_v40_0 ~= 32 then
                v44 = true;
                if l_v40_0 ~= 9 then
                    v44 = l_v40_0 == 13;
                end;
            end;
            if v44 then
                v4 = math.min(v4 + 1, v6);
                return "whitespace";
            elseif v20(v40) then
                v44 = v4;
                while true do
                    v4 = math.min(v4 + 1, v6);
                    v40 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                    if v20(v40) then
                        continue;
                    end;
                    local l_v40_1 = v40;
                    l_v40_0 = false;
                    if l_v40_1 >= 48 then
                        l_v40_0 = l_v40_1 <= 57;
                    end;
                    if not l_v40_0 and v40 ~= 45 then
                        break;
                    end;
                end;
                l_v40_0 = buffer.readstring(v2, v44, v4 - v44);
                if l_v40_0 == "true" then
                    return "true";
                elseif l_v40_0 == "false" then
                    return "false";
                elseif l_v40_0 == "nil" then
                    return "nil";
                elseif l_v40_0 == "return" then
                    return "return";
                elseif l_v40_0 == "for" then
                    return "for";
                elseif l_v40_0 == "while" then
                    return "while";
                elseif l_v40_0 == "if" then
                    return "if";
                elseif l_v40_0 == "else" then
                    return "else";
                elseif l_v40_0 == "break" then
                    return "break";
                elseif l_v40_0 == "continue" then
                    return "continue";
                else
                    return "identifier";
                end;
            else
                l_v40_0 = v40;
                v44 = false;
                if l_v40_0 >= 48 then
                    v44 = l_v40_0 <= 57;
                end;
                if v44 then
                    return (v38());
                elseif v40 == 34 then
                    return (v29());
                elseif v40 == 39 then
                    return (v29());
                elseif v40 == 46 then
                    l_v40_0 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                    v44 = false;
                    if l_v40_0 >= 48 then
                        v44 = l_v40_0 <= 57;
                    end;
                    if v44 then
                        v4 = v4 - 1;
                        return (v38());
                    else
                        v4 = math.min(v4 + 1, v6);
                        return ".";
                    end;
                elseif v40 == 61 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return "==";
                    else
                        return "=";
                    end;
                elseif v40 == 126 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return "~=";
                    else
                        has_error = true;
                        return "error";
                    end;
                elseif v40 == 62 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return ">=";
                    else
                        return ">";
                    end;
                elseif v40 == 60 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return "<=";
                    else
                        return "<";
                    end;
                elseif v40 == 36 then
                    v4 = math.min(v4 + 1, v6);
                    return "$";
                elseif v40 == 40 then
                    v4 = math.min(v4 + 1, v6);
                    return "(";
                elseif v40 == 41 then
                    v4 = math.min(v4 + 1, v6);
                    return ")";
                elseif v40 == 123 then
                    v4 = math.min(v4 + 1, v6);
                    return "{";
                elseif v40 == 125 then
                    v4 = math.min(v4 + 1, v6);
                    return "}";
                elseif v40 == 91 then
                    v4 = math.min(v4 + 1, v6);
                    return "[";
                elseif v40 == 93 then
                    v4 = math.min(v4 + 1, v6);
                    return "]";
                elseif v40 == 124 then
                    v4 = math.min(v4 + 1, v6);
                    return "|";
                elseif v40 == 10 then
                    v4 = math.min(v4 + 1, v6);
                    return "\n";
                elseif v40 == 59 then
                    v4 = math.min(v4 + 1, v6);
                    return ";";
                elseif v40 == 44 then
                    v4 = math.min(v4 + 1, v6);
                    return ",";
                else
                    l_v40_0 = v40;
                    v44 = true;
                    if l_v40_0 ~= 32 then
                        v44 = true;
                        if l_v40_0 ~= 9 then
                            v44 = l_v40_0 == 13;
                        end;
                    end;
                    if v44 then
                        v4 = math.min(v4 + 1, v6);
                        return v39();
                    else
                        error(("no symbol matching %*"):format((string.char(v40))), 0);
                        return "error";
                    end;
                end;
            end;
        end;
    end;
    local function v48() --[[ Line: 573 ]] --[[ Name: next_token ]]
        -- upvalues: v4 (ref), v39 (copy), v2 (copy)
        local l_v4_1 = v4;
        local v47 = v39();
        while v47 == "whitespace" or v47 == "comment" do
            l_v4_1 = v4;
            v47 = v39();
        end;
        return {
            kind = v47, 
            text = buffer.readstring(v2, l_v4_1, v4 - l_v4_1), 
            span = vector.create(l_v4_1, v4, 0)
        };
    end;
    local v49 = v48();
    local l_kind_0 = v49.kind;
    local l_x_0 = v49.span.x;
    local v52 = v48();
    local l_kind_1 = v52.kind;
    local l_x_1 = v52.span.x;
    local function _() --[[ Line: 596 ]] --[[ Name: consume ]]
        -- upvalues: v49 (ref), l_kind_0 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy)
        local l_v49_0 = v49;
        local l_l_kind_0_0 = l_kind_0;
        local l_v52_0 = v52;
        local l_l_kind_1_0 = l_kind_1;
        v49 = l_v52_0;
        l_kind_0 = l_l_kind_1_0;
        l_x_0 = l_x_1;
        v52 = v48();
        l_kind_1 = v52.kind;
        l_x_1 = v52.span.x;
        return l_v49_0, l_l_kind_0_0;
    end;
    local _ = function(v60) --[[ Line: 606 ]] --[[ Name: current_is ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_1 = v52;
            local l_l_kind_1_1 = l_kind_1;
            v49 = l_v52_1;
            l_kind_0 = l_l_kind_1_1;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        return l_kind_0 == v60;
    end;
    local function _(v66) --[[ Line: 614 ]] --[[ Name: lookahead_is ]]
        -- upvalues: l_kind_1 (ref), v52 (ref), v48 (copy)
        while l_kind_1 == "\n" do
            v52 = v48();
            l_kind_1 = v52.kind;
        end;
        return l_kind_1 == v66;
    end;
    local function _(v68) --[[ Line: 623 ]] --[[ Name: display ]]
        local l_kind_2 = v68.kind;
        if l_kind_2 == "identifier" or l_kind_2 == "number" or l_kind_2 == "string" then
            return l_kind_2;
        elseif v68.kind == "error" then
            return "error '" .. v68.text .. "'";
        else
            return "'" .. l_kind_2 .. "'";
        end;
    end;
    local function v74(v71, v72) --[[ Line: 635 ]] --[[ Name: report ]]
        -- upvalues: v49 (ref)
        local v73 = {
            message = v71, 
            span = v72 or v49.span
        };
        error(("%* from %* to %*"):format(v73.message, v73.span.x, v73.span.y), 0);
    end;
    local function v82(v75) --[[ Line: 644 ]] --[[ Name: expect_failure ]]
        -- upvalues: v74 (copy), v49 (ref), l_kind_0 (ref)
        local l_v74_0 = v74;
        local v77 = "expected %*, but got %* of %* instead";
        local v78 = {
            kind = v75
        };
        local l_kind_3 = v78.kind;
        local v80 = if not (l_kind_3 ~= "identifier" and l_kind_3 ~= "number") or l_kind_3 == "string" then l_kind_3 else if v78.kind == "error" then "error '" .. v78.text .. "'" else "'" .. l_kind_3 .. "'";
        l_kind_3 = v49;
        local l_kind_4 = l_kind_3.kind;
        return l_v74_0((v77:format(v80, if not (l_kind_4 ~= "identifier" and l_kind_4 ~= "number") or l_kind_4 == "string" then l_kind_4 else if l_kind_3.kind == "error" then "error '" .. l_kind_3.text .. "'" else "'" .. l_kind_4 .. "'", l_kind_0)));
    end;
    local function v105(v83) --[[ Line: 654 ]] --[[ Name: expect ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v3 (copy), v82 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_2 = v52;
            local l_l_kind_1_2 = l_kind_1;
            v49 = l_v52_2;
            l_kind_0 = l_l_kind_1_2;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == v83 then
            local l_v49_3 = v49;
            local _ = l_kind_0;
            local l_v52_3 = v52;
            local l_l_kind_1_3 = l_kind_1;
            v49 = l_v52_3;
            l_kind_0 = l_l_kind_1_3;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
            return l_v49_3;
        elseif l_kind_0 == "eof" and v3 then
            yield();
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_4 = v52;
                local l_l_kind_1_4 = l_kind_1;
                v49 = l_v52_4;
                l_kind_0 = l_l_kind_1_4;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == v83 then
                local l_v49_5 = v49;
                local _ = l_kind_0;
                local l_v52_5 = v52;
                local l_l_kind_1_5 = l_kind_1;
                v49 = l_v52_5;
                l_kind_0 = l_l_kind_1_5;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                return l_v49_5;
            else
                local v100 = "expected %*, but got %* of %* instead";
                local v101 = {
                    kind = v83
                };
                local l_kind_5 = v101.kind;
                local v103 = if not (l_kind_5 ~= "identifier" and l_kind_5 ~= "number") or l_kind_5 == "string" then l_kind_5 else if v101.kind == "error" then "error '" .. v101.text .. "'" else "'" .. l_kind_5 .. "'";
                l_kind_5 = v49;
                local l_kind_6 = l_kind_5.kind;
                v100 = {
                    message = v100:format(v103, if not (l_kind_6 ~= "identifier" and l_kind_6 ~= "number") or l_kind_6 == "string" then l_kind_6 else if l_kind_5.kind == "error" then "error '" .. l_kind_5.text .. "'" else "'" .. l_kind_6 .. "'", l_kind_0), 
                    span = v49.span
                };
                error(("%* from %* to %*"):format(v100.message, v100.span.x, v100.span.y), 0);
                return nil;
            end;
        else
            return v82(v83);
        end;
    end;
    local v106 = nil;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    local v110 = nil;
    local v111 = nil;
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    local v115 = nil;
    local v116 = nil;
    local v117 = nil;
    local v118 = nil;
    local v119 = nil;
    local v120 = nil;
    v112 = function() --[[ Line: 681 ]] --[[ Name: parse_var_root ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v105 (copy), v110 (ref), v74 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_6 = v52;
            local l_l_kind_1_6 = l_kind_1;
            v49 = l_v52_6;
            l_kind_0 = l_l_kind_1_6;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "identifier" then
            local v125 = v105("identifier");
            return {
                kind = "global", 
                span = v125.span, 
                token = v125
            };
        else
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_7 = v52;
                local l_l_kind_1_7 = l_kind_1;
                v49 = l_v52_7;
                l_kind_0 = l_l_kind_1_7;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "$" then
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if l_kind_1 == "(" then
                    local v130 = v105("$");
                    local v131 = v105("(");
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_8 = v52;
                        local l_l_kind_1_8 = l_kind_1;
                        v49 = l_v52_8;
                        l_kind_0 = l_l_kind_1_8;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if not (l_kind_0 == "eof") then
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_9 = v52;
                            local l_l_kind_1_9 = l_kind_1;
                            v49 = l_v52_9;
                            l_kind_0 = l_l_kind_1_9;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if l_kind_0 ~= ";" then
                            local v140 = v110();
                            while l_kind_0 == "\n" do
                                local _ = v49;
                                local _ = l_kind_0;
                                local l_v52_10 = v52;
                                local l_l_kind_1_10 = l_kind_1;
                                v49 = l_v52_10;
                                l_kind_0 = l_l_kind_1_10;
                                l_x_0 = l_x_1;
                                v52 = v48();
                                l_kind_1 = v52.kind;
                                l_x_1 = v52.span.x;
                            end;
                            if l_kind_0 == "}" then
                                local v145 = v105("}");
                                return {
                                    kind = "paren", 
                                    span = vector.create(v130.span.x, v145.span.y, 0), 
                                    expr = {
                                        left = v131, 
                                        right = v145, 
                                        value = v140
                                    }, 
                                    operator = v130
                                };
                            else
                                return {
                                    kind = "paren", 
                                    span = vector.create(v130.span.x, v140.span.y, 0), 
                                    expr = {
                                        left = v131, 
                                        value = v140
                                    }, 
                                    operator = v130
                                };
                            end;
                        end;
                    end;
                    return {
                        kind = "paren", 
                        span = vector.create(v130.span.x, v131.span.y, 0), 
                        expr = {
                            left = v131
                        }, 
                        operator = v130
                    };
                end;
            end;
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_11 = v52;
                local l_l_kind_1_11 = l_kind_1;
                v49 = l_v52_11;
                l_kind_0 = l_l_kind_1_11;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "$" then
                local v150 = v105("$");
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_12 = v52;
                    local l_l_kind_1_12 = l_kind_1;
                    v49 = l_v52_12;
                    l_kind_0 = l_l_kind_1_12;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "identifier" then
                    local v155 = v105("identifier");
                    return {
                        kind = "name", 
                        span = vector.create(v150.span.x, v155.span.y, 0), 
                        name = v155, 
                        operator = v150
                    };
                else
                    return {
                        kind = "name", 
                        span = vector.create(v150.span.x, v150.span.y, 0), 
                        operator = v150
                    };
                end;
            else
                local l_v74_1 = v74;
                local v157 = "expected identifier, got %*";
                local l_v52_13 = v52;
                local l_kind_7 = l_v52_13.kind;
                return l_v74_1((v157:format(if not (l_kind_7 ~= "identifier" and l_kind_7 ~= "number") or l_kind_7 == "string" then l_kind_7 else if l_v52_13.kind == "error" then "error '" .. l_v52_13.text .. "'" else "'" .. l_kind_7 .. "'")));
            end;
        end;
    end;
    v113 = function() --[[ Line: 742 ]] --[[ Name: parse_var_suffix ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v105 (copy), v110 (ref), v74 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_14 = v52;
            local l_l_kind_1_13 = l_kind_1;
            v49 = l_v52_14;
            l_kind_0 = l_l_kind_1_13;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "." then
            local v164 = v105(".");
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_15 = v52;
                local l_l_kind_1_14 = l_kind_1;
                v49 = l_v52_15;
                l_kind_0 = l_l_kind_1_14;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "identifier" == false then
                return {
                    kind = "nameindex", 
                    span = vector.create(v164.span.x, v164.span.y, 0), 
                    operator = v164
                };
            else
                local v169 = v105("identifier");
                return {
                    kind = "nameindex", 
                    span = vector.create(v164.span.x, v169.span.y, 0), 
                    operator = v164, 
                    name = v169
                };
            end;
        else
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_16 = v52;
                local l_l_kind_1_15 = l_kind_1;
                v49 = l_v52_16;
                l_kind_0 = l_l_kind_1_15;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "[" then
                local v174 = v105("[");
                if l_kind_0 == "eof" then
                    return {
                        kind = "exprindex", 
                        span = vector.create(v174.span.x, v174.span.y, 0), 
                        expr = {
                            left = v174
                        }
                    };
                else
                    local v175 = v110();
                    if l_kind_0 ~= "]" then
                        return {
                            kind = "exprindex", 
                            span = vector.create(v174.span.x, v175.span.y, 0), 
                            expr = {
                                left = v174, 
                                value = v175
                            }
                        };
                    else
                        local v176 = v105("]");
                        return {
                            kind = "exprindex", 
                            span = vector.create(v174.span.x, v176.span.y, 0), 
                            expr = {
                                left = v174, 
                                right = v176, 
                                value = v175
                            }
                        };
                    end;
                end;
            else
                return v74("invalid");
            end;
        end;
    end;
    v114 = function() --[[ Line: 793 ]] --[[ Name: parse_var_suffixes ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v113 (ref)
        local v177 = false;
        local v178 = {};
        while true do
            if l_kind_0 == "\n" then
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_17 = v52;
                local l_l_kind_1_16 = l_kind_1;
                v49 = l_v52_17;
                l_kind_0 = l_l_kind_1_16;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                continue;
            end;
            v177 = l_kind_0 == ".";
            if not v177 then
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_18 = v52;
                    local l_l_kind_1_17 = l_kind_1;
                    v49 = l_v52_18;
                    l_kind_0 = l_l_kind_1_17;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 ~= "[" then
                    break;
                end;
            end;
            v177 = false;
            table.insert(v178, (v113()));
        end;
        return v178;
    end;
    v111 = function() --[[ Line: 802 ]] --[[ Name: parse_var ]]
        -- upvalues: v112 (ref), v114 (ref)
        local v187 = v112();
        local v188 = if v187.kind ~= "global" then v114() else {};
        return {
            span = vector.create(v187.span.x, if #v188 > 0 then v188[#v188].span.y else v187.span.y, 0), 
            prefix = v187, 
            suffixes = v188
        };
    end;
    v110 = function() --[[ Line: 820 ]] --[[ Name: parse_expression_or_command ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v107 (ref), v106 (ref)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_19 = v52;
            local l_l_kind_1_18 = l_kind_1;
            v49 = l_v52_19;
            l_kind_0 = l_l_kind_1_18;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "identifier" then
            return v107();
        else
            return v106();
        end;
    end;
    v115 = function() --[[ Line: 828 ]] --[[ Name: parse_function_body ]]
        -- upvalues: v105 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v108 (ref)
        local v193 = v105("|");
        local v194 = {};
        local v195 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_20 = v52;
                local l_l_kind_1_19 = l_kind_1;
                v49 = l_v52_20;
                l_kind_0 = l_l_kind_1_19;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                continue;
            end;
            if not (l_kind_0 == "|") then
                if not v195 then
                    v105(",");
                end;
                v195 = false;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_21 = v52;
                    local l_l_kind_1_20 = l_kind_1;
                    v49 = l_v52_21;
                    l_kind_0 = l_l_kind_1_20;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "identifier" then
                    table.insert(v194, v105("identifier"));
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_22 = v52;
            local l_l_kind_1_21 = l_kind_1;
            v49 = l_v52_22;
            l_kind_0 = l_l_kind_1_21;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v208 = if l_kind_0 == "|" then v105("|") else nil;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_23 = v52;
            local l_l_kind_1_22 = l_kind_1;
            v49 = l_v52_23;
            l_kind_0 = l_l_kind_1_22;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v213 = if l_kind_0 == "{" then v105("{") else nil;
        local v214 = v108("}");
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_24 = v52;
            local l_l_kind_1_23 = l_kind_1;
            v49 = l_v52_24;
            l_kind_0 = l_l_kind_1_23;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v219 = if l_kind_0 == "}" then v105("}") else nil;
        return {
            arguments = {
                left = v193, 
                right = v208, 
                value = v194
            }, 
            block = if not not v213 or v214 or v219 then {
                left = v213, 
                right = v219, 
                value = v214
            } else nil, 
            span = vector.create(v193.span.x, if v219 then v219.span.y else v214.span.y, 0)
        };
    end;
    v109 = function() --[[ Line: 866 ]] --[[ Name: parse_lambda ]]
        -- upvalues: v115 (ref)
        local v220 = v115();
        return {
            kind = "lambda", 
            body = v220, 
            span = v220.span
        };
    end;
    parse_table = function() --[[ Line: 875 ]] --[[ Name: parse_table ]]
        -- upvalues: v105 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v106 (ref)
        local v221 = v105("{");
        local v222 = {};
        local v223 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_25 = v52;
                local l_l_kind_1_24 = l_kind_1;
                v49 = l_v52_25;
                l_kind_0 = l_l_kind_1_24;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                continue;
            end;
            if not (l_kind_0 == "}") then
                if not v223 then
                    v105(",");
                end;
                v223 = false;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_26 = v52;
                    local l_l_kind_1_25 = l_kind_1;
                    v49 = l_v52_26;
                    l_kind_0 = l_l_kind_1_25;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "identifier" then
                    while l_kind_1 == "\n" do
                        v52 = v48();
                        l_kind_1 = v52.kind;
                    end;
                    if l_kind_1 == "=" then
                        local v232 = v105("identifier");
                        local v233 = v105("=");
                        if l_kind_0 == "eof" then
                            table.insert(v222, {
                                kind = "namekey", 
                                span = vector.create(v232.span.x, v233.span.y, 0), 
                                name = v232, 
                                operator = v233
                            });
                            break;
                        else
                            local v234 = v106();
                            table.insert(v222, {
                                kind = "namekey", 
                                name = v232, 
                                value = v234
                            });
                            continue;
                        end;
                    end;
                end;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_27 = v52;
                    local l_l_kind_1_26 = l_kind_1;
                    v49 = l_v52_27;
                    l_kind_0 = l_l_kind_1_26;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "[" then
                    local v239 = v105("[");
                    if l_kind_0 == "eof" then
                        table.insert(v222, {
                            kind = "exprkey", 
                            span = vector.create(v239.span.x, v239.span.y, 0), 
                            key = {
                                left = v239
                            }
                        });
                        break;
                    else
                        local v240 = v106();
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_28 = v52;
                            local l_l_kind_1_27 = l_kind_1;
                            v49 = l_v52_28;
                            l_kind_0 = l_l_kind_1_27;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        local v245 = if l_kind_0 == "]" then v105("]") else nil;
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_29 = v52;
                            local l_l_kind_1_28 = l_kind_1;
                            v49 = l_v52_29;
                            l_kind_0 = l_l_kind_1_28;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        local v250 = if l_kind_0 == "=" then v105("=") else nil;
                        if l_kind_0 == "eof" then
                            table.insert(v222, {
                                kind = "exprkey", 
                                span = vector.create(v239.span.x, if v250 then v250.span.y else if v245 then v245.span.y else v240.span.y, 0), 
                                key = {
                                    left = v239, 
                                    right = v245, 
                                    value = v240
                                }, 
                                operator = v250
                            });
                            break;
                        else
                            local v251 = v106();
                            table.insert(v222, {
                                kind = "exprkey", 
                                span = vector.create(v239.span.x, v251.span.y, 0), 
                                key = {
                                    left = v239, 
                                    right = v245, 
                                    value = v240
                                }, 
                                operator = v250, 
                                value = v251
                            });
                        end;
                    end;
                elseif l_kind_0 ~= "eof" then
                    local v252 = v106();
                    table.insert(v222, {
                        kind = "nokey", 
                        value = v252
                    });
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_30 = v52;
            local l_l_kind_1_29 = l_kind_1;
            v49 = l_v52_30;
            l_kind_0 = l_l_kind_1_29;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "}" then
            local v257 = v105("}");
            return {
                fields = {
                    left = v221, 
                    right = v257, 
                    value = v222
                }, 
                span = vector.create(v221.span.x, v257.span.y, 0)
            };
        else
            local l_y_0 = v221.span.y;
            if #v222 > 0 then
                l_y_0 = v222[#v222].span.y;
            end;
            return {
                fields = {
                    left = v221, 
                    value = v222
                }, 
                span = vector.create(v221.span.x, l_y_0, 0)
            };
        end;
    end;
    v120 = function() --[[ Line: 977 ]] --[[ Name: parse_vector ]]
        -- upvalues: v105 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v106 (ref)
        local v259 = v105("[");
        local l_x_2 = v259.span.x;
        local l_y_1 = v259.span.y;
        local v262 = {};
        local v263 = 0;
        while v263 < 3 do
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_31 = v52;
                local l_l_kind_1_30 = l_kind_1;
                v49 = l_v52_31;
                l_kind_0 = l_l_kind_1_30;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if not (l_kind_0 == "]") then
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_32 = v52;
                    local l_l_kind_1_31 = l_kind_1;
                    v49 = l_v52_32;
                    l_kind_0 = l_l_kind_1_31;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if not (l_kind_0 == "eof") then
                    if v263 ~= 0 then
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_33 = v52;
                            local l_l_kind_1_32 = l_kind_1;
                            v49 = l_v52_33;
                            l_kind_0 = l_l_kind_1_32;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if l_kind_0 == "," then
                            v105(",");
                        end;
                    end;
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_34 = v52;
                        local l_l_kind_1_33 = l_kind_1;
                        v49 = l_v52_34;
                        l_kind_0 = l_l_kind_1_33;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if not (l_kind_0 == "eof") then
                        v263 = v263 + 1;
                        local v280 = v106();
                        v262[v263] = v280;
                        l_y_1 = v280.span.y;
                    else
                        break;
                    end;
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_35 = v52;
            local l_l_kind_1_34 = l_kind_1;
            v49 = l_v52_35;
            l_kind_0 = l_l_kind_1_34;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v285 = if l_kind_0 == "]" then v105("]") else nil;
        if v285 then
            l_y_1 = v285.span.y;
        end;
        return {
            kind = "vector", 
            span = vector.create(l_x_2, l_y_1, 0), 
            contents = {
                left = v259, 
                right = v285, 
                value = v262
            }
        };
    end;
    v106 = function() --[[ Line: 1009 ]] --[[ Name: parse_expression ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v105 (copy), v107 (ref), v106 (ref), v111 (ref), v109 (ref), v120 (ref), v74 (copy)
        local v286 = false;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_36 = v52;
            local l_l_kind_1_35 = l_kind_1;
            v49 = l_v52_36;
            l_kind_0 = l_l_kind_1_35;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "$" then
            while l_kind_1 == "\n" do
                v52 = v48();
                l_kind_1 = v52.kind;
            end;
            if l_kind_1 == "(" then
                local v291 = v105("$");
                local v292 = v105("(");
                local v293 = nil;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_37 = v52;
                    local l_l_kind_1_36 = l_kind_1;
                    v49 = l_v52_37;
                    l_kind_0 = l_l_kind_1_36;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if not (l_kind_0 == "$") then
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_38 = v52;
                        local l_l_kind_1_37 = l_kind_1;
                        v49 = l_v52_38;
                        l_kind_0 = l_l_kind_1_37;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if l_kind_0 ~= "identifier" then
                        if l_kind_0 == "eof" then
                            return {
                                kind = "evaluate", 
                                body = {
                                    left = v292
                                }, 
                                operator = v291, 
                                span = vector.create(v291.span.x, v292.span.y, 0)
                            };
                        else
                            v293 = v106();
                            v286 = true;
                        end;
                    end;
                end;
                if not v286 then
                    v293 = v107();
                end;
                v286 = false;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_39 = v52;
                    local l_l_kind_1_38 = l_kind_1;
                    v49 = l_v52_39;
                    l_kind_0 = l_l_kind_1_38;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == ")" then
                    local v306 = v105(")");
                    return {
                        kind = "evaluate", 
                        body = {
                            left = v292, 
                            right = v306, 
                            value = v293
                        }, 
                        operator = v291, 
                        span = vector.create(v291.span.x, v306.span.y, 0)
                    };
                else
                    return {
                        kind = "evaluate", 
                        body = {
                            left = v292, 
                            value = v293
                        }, 
                        operator = v291, 
                        span = vector.create(v291.span.x, v293.span.y, 0)
                    };
                end;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_40 = v52;
            local l_l_kind_1_39 = l_kind_1;
            v49 = l_v52_40;
            l_kind_0 = l_l_kind_1_39;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "$" then
            while l_kind_1 == "\n" do
                v52 = v48();
                l_kind_1 = v52.kind;
            end;
            if l_kind_1 == "identifier" then
                local v311 = v111();
                return {
                    kind = "var", 
                    var = v311, 
                    span = v311.span
                };
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_41 = v52;
            local l_l_kind_1_40 = l_kind_1;
            v49 = l_v52_41;
            l_kind_0 = l_l_kind_1_40;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "string" then
            local v316 = v105("string");
            return {
                kind = "string", 
                token = v316, 
                span = v316.span
            };
        else
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_42 = v52;
                local l_l_kind_1_41 = l_kind_1;
                v49 = l_v52_42;
                l_kind_0 = l_l_kind_1_41;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "number" then
                local v321 = v105("number");
                return {
                    kind = "number", 
                    token = v321, 
                    span = v321.span
                };
            else
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_43 = v52;
                    local l_l_kind_1_42 = l_kind_1;
                    v49 = l_v52_43;
                    l_kind_0 = l_l_kind_1_42;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "true" then
                    local v326 = v105("true");
                    return {
                        kind = "boolean", 
                        token = v326, 
                        span = v326.span
                    };
                else
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_44 = v52;
                        local l_l_kind_1_43 = l_kind_1;
                        v49 = l_v52_44;
                        l_kind_0 = l_l_kind_1_43;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if l_kind_0 == "false" then
                        local v331 = v105("false");
                        return {
                            kind = "boolean", 
                            token = v331, 
                            span = v331.span
                        };
                    else
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_45 = v52;
                            local l_l_kind_1_44 = l_kind_1;
                            v49 = l_v52_45;
                            l_kind_0 = l_l_kind_1_44;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if l_kind_0 == "identifier" then
                            local v336 = v105("identifier");
                            return {
                                kind = "identifier", 
                                token = v336, 
                                span = v336.span
                            };
                        else
                            while l_kind_0 == "\n" do
                                local _ = v49;
                                local _ = l_kind_0;
                                local l_v52_46 = v52;
                                local l_l_kind_1_45 = l_kind_1;
                                v49 = l_v52_46;
                                l_kind_0 = l_l_kind_1_45;
                                l_x_0 = l_x_1;
                                v52 = v48();
                                l_kind_1 = v52.kind;
                                l_x_1 = v52.span.x;
                            end;
                            if l_kind_0 == "|" then
                                return v109();
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v49;
                                    local _ = l_kind_0;
                                    local l_v52_47 = v52;
                                    local l_l_kind_1_46 = l_kind_1;
                                    v49 = l_v52_47;
                                    l_kind_0 = l_l_kind_1_46;
                                    l_x_0 = l_x_1;
                                    v52 = v48();
                                    l_kind_1 = v52.kind;
                                    l_x_1 = v52.span.x;
                                end;
                                if l_kind_0 == "{" then
                                    local v345 = parse_table();
                                    return {
                                        kind = "table", 
                                        table = v345, 
                                        span = v345.span
                                    };
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v49;
                                        local _ = l_kind_0;
                                        local l_v52_48 = v52;
                                        local l_l_kind_1_47 = l_kind_1;
                                        v49 = l_v52_48;
                                        l_kind_0 = l_l_kind_1_47;
                                        l_x_0 = l_x_1;
                                        v52 = v48();
                                        l_kind_1 = v52.kind;
                                        l_x_1 = v52.span.x;
                                    end;
                                    if l_kind_0 == "[" then
                                        return v120();
                                    else
                                        return v74((("expected expression, got %*"):format(l_kind_0)));
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v107 = function() --[[ Line: 1100 ]] --[[ Name: parse_command ]]
        -- upvalues: v111 (ref), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v106 (ref)
        local v350 = v111();
        local v351 = {};
        while l_kind_0 ~= "\n" do
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_49 = v52;
                local l_l_kind_1_48 = l_kind_1;
                v49 = l_v52_49;
                l_kind_0 = l_l_kind_1_48;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if not (l_kind_0 == "$") then
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_50 = v52;
                    local l_l_kind_1_49 = l_kind_1;
                    v49 = l_v52_50;
                    l_kind_0 = l_l_kind_1_49;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if not (l_kind_0 == "string") then
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_51 = v52;
                        local l_l_kind_1_50 = l_kind_1;
                        v49 = l_v52_51;
                        l_kind_0 = l_l_kind_1_50;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if not (l_kind_0 == "number") then
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_52 = v52;
                            local l_l_kind_1_51 = l_kind_1;
                            v49 = l_v52_52;
                            l_kind_0 = l_l_kind_1_51;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if not (l_kind_0 == "true") then
                            while l_kind_0 == "\n" do
                                local _ = v49;
                                local _ = l_kind_0;
                                local l_v52_53 = v52;
                                local l_l_kind_1_52 = l_kind_1;
                                v49 = l_v52_53;
                                l_kind_0 = l_l_kind_1_52;
                                l_x_0 = l_x_1;
                                v52 = v48();
                                l_kind_1 = v52.kind;
                                l_x_1 = v52.span.x;
                            end;
                            if not (l_kind_0 == "false") then
                                while l_kind_0 == "\n" do
                                    local _ = v49;
                                    local _ = l_kind_0;
                                    local l_v52_54 = v52;
                                    local l_l_kind_1_53 = l_kind_1;
                                    v49 = l_v52_54;
                                    l_kind_0 = l_l_kind_1_53;
                                    l_x_0 = l_x_1;
                                    v52 = v48();
                                    l_kind_1 = v52.kind;
                                    l_x_1 = v52.span.x;
                                end;
                                if not (l_kind_0 == "identifier") then
                                    while l_kind_0 == "\n" do
                                        local _ = v49;
                                        local _ = l_kind_0;
                                        local l_v52_55 = v52;
                                        local l_l_kind_1_54 = l_kind_1;
                                        v49 = l_v52_55;
                                        l_kind_0 = l_l_kind_1_54;
                                        l_x_0 = l_x_1;
                                        v52 = v48();
                                        l_kind_1 = v52.kind;
                                        l_x_1 = v52.span.x;
                                    end;
                                    if not (l_kind_0 == "{") then
                                        while l_kind_0 == "\n" do
                                            local _ = v49;
                                            local _ = l_kind_0;
                                            local l_v52_56 = v52;
                                            local l_l_kind_1_55 = l_kind_1;
                                            v49 = l_v52_56;
                                            l_kind_0 = l_l_kind_1_55;
                                            l_x_0 = l_x_1;
                                            v52 = v48();
                                            l_kind_1 = v52.kind;
                                            l_x_1 = v52.span.x;
                                        end;
                                        if not (l_kind_0 == "|") then
                                            while l_kind_0 == "\n" do
                                                local _ = v49;
                                                local _ = l_kind_0;
                                                local l_v52_57 = v52;
                                                local l_l_kind_1_56 = l_kind_1;
                                                v49 = l_v52_57;
                                                l_kind_0 = l_l_kind_1_56;
                                                l_x_0 = l_x_1;
                                                v52 = v48();
                                                l_kind_1 = v52.kind;
                                                l_x_1 = v52.span.x;
                                            end;
                                            if l_kind_0 ~= "[" then
                                                break;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            table.insert(v351, (v106()));
        end;
        local v388 = if #v351 > 0 then v351[#v351].span.y else v350.span.y;
        return {
            kind = "command", 
            prefix = v350, 
            arguments = v351, 
            span = vector.create(v350.span.x, v388, 0)
        };
    end;
    v116 = function() --[[ Line: 1135 ]] --[[ Name: parse_if ]]
        -- upvalues: v105 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v107 (ref), v106 (ref), v108 (ref)
        local v389 = {};
        local v390 = true;
        local v391 = nil;
        local v392 = nil;
        while true do
            if v390 then
                v390 = false;
                local v393 = v105("if");
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_58 = v52;
                    local l_l_kind_1_57 = l_kind_1;
                    v49 = l_v52_58;
                    l_kind_0 = l_l_kind_1_57;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                local v398 = if l_kind_0 == "(" then v105("(") else nil;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_59 = v52;
                    local l_l_kind_1_58 = l_kind_1;
                    v49 = l_v52_59;
                    l_kind_0 = l_l_kind_1_58;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                local v403 = if l_kind_0 == "identifier" then v107() else v106();
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_60 = v52;
                    local l_l_kind_1_59 = l_kind_1;
                    v49 = l_v52_60;
                    l_kind_0 = l_l_kind_1_59;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                local v408 = if l_kind_0 == ")" then v105(")") else nil;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_61 = v52;
                    local l_l_kind_1_60 = l_kind_1;
                    v49 = l_v52_61;
                    l_kind_0 = l_l_kind_1_60;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                local v413 = if l_kind_0 == "{" then v105("{") else nil;
                local v414 = v108("}");
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_62 = v52;
                    local l_l_kind_1_61 = l_kind_1;
                    v49 = l_v52_62;
                    l_kind_0 = l_l_kind_1_61;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                local v419 = if l_kind_0 == "}" then v105("}") else nil;
                table.insert(v389, {
                    keyword = v393, 
                    condition = {
                        left = v398, 
                        right = v408, 
                        value = v403
                    }, 
                    block = {
                        left = v413, 
                        right = v419, 
                        value = v414
                    }, 
                    span = vector.create(v393.span.x, if v419 then v419.span.y else v414.span.y, 0)
                });
                v390 = false;
                continue;
            end;
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_63 = v52;
                local l_l_kind_1_62 = l_kind_1;
                v49 = l_v52_63;
                l_kind_0 = l_l_kind_1_62;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "else" then
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if l_kind_1 == "if" then
                    local v424 = v105("else");
                    local v425 = v105("if");
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_64 = v52;
                        local l_l_kind_1_63 = l_kind_1;
                        v49 = l_v52_64;
                        l_kind_0 = l_l_kind_1_63;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    local v430 = if l_kind_0 == "(" then v105("(") else nil;
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_65 = v52;
                        local l_l_kind_1_64 = l_kind_1;
                        v49 = l_v52_65;
                        l_kind_0 = l_l_kind_1_64;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    local v435 = if l_kind_0 == "identifier" then v107() else v106();
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_66 = v52;
                        local l_l_kind_1_65 = l_kind_1;
                        v49 = l_v52_66;
                        l_kind_0 = l_l_kind_1_65;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    local v440 = if l_kind_0 == ")" then v105(")") else nil;
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_67 = v52;
                        local l_l_kind_1_66 = l_kind_1;
                        v49 = l_v52_67;
                        l_kind_0 = l_l_kind_1_66;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    local v445 = if l_kind_0 == "{" then v105("{") else nil;
                    local v446 = v108("}");
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_68 = v52;
                        local l_l_kind_1_67 = l_kind_1;
                        v49 = l_v52_68;
                        l_kind_0 = l_l_kind_1_67;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    local v451 = if l_kind_0 == "}" then v105("}") else nil;
                    table.insert(v389, {
                        elsekeyword = v424, 
                        keyword = v425, 
                        condition = {
                            left = v430, 
                            right = v440, 
                            value = v435
                        }, 
                        block = {
                            left = v445, 
                            right = v451, 
                            value = v446
                        }, 
                        span = vector.create(v424.span.x, if v451 then v451.span.y else v446.span.y, 0)
                    });
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_69 = v52;
            local l_l_kind_1_68 = l_kind_1;
            v49 = l_v52_69;
            l_kind_0 = l_l_kind_1_68;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "else" then
            v391 = v105("else");
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_70 = v52;
                local l_l_kind_1_69 = l_kind_1;
                v49 = l_v52_70;
                l_kind_0 = l_l_kind_1_69;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            local v460 = if l_kind_0 == "{" then v105("{") else nil;
            local v461 = v108("}");
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_71 = v52;
                local l_l_kind_1_70 = l_kind_1;
                v49 = l_v52_71;
                l_kind_0 = l_l_kind_1_70;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            local v466 = if l_kind_0 == "}" then v105("}") else nil;
            v392 = {
                left = v460, 
                right = v466, 
                value = v461
            };
        end;
        return {
            kind = "if", 
            ifs = v389, 
            else_keyword = v391, 
            fallback = v392, 
            span = vector.create(v389[1].span.x, if v392 and v392.right then v392.right.span.y else if v392 then v392.value.span.y else v389[#v389].span.y, 0)
        };
    end;
    v117 = function() --[[ Line: 1231 ]] --[[ Name: parse_while ]]
        -- upvalues: v105 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v107 (ref), v106 (ref), v108 (ref)
        local v467 = v105("while");
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_72 = v52;
            local l_l_kind_1_71 = l_kind_1;
            v49 = l_v52_72;
            l_kind_0 = l_l_kind_1_71;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v472 = if l_kind_0 == "(" then v105("(") else nil;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_73 = v52;
            local l_l_kind_1_72 = l_kind_1;
            v49 = l_v52_73;
            l_kind_0 = l_l_kind_1_72;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v477 = if l_kind_0 == "identifier" then v107() else v106();
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_74 = v52;
            local l_l_kind_1_73 = l_kind_1;
            v49 = l_v52_74;
            l_kind_0 = l_l_kind_1_73;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v482 = if l_kind_0 == ")" then v105(")") else nil;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_75 = v52;
            local l_l_kind_1_74 = l_kind_1;
            v49 = l_v52_75;
            l_kind_0 = l_l_kind_1_74;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v487 = if l_kind_0 == "{" then v105("{") else nil;
        local v488 = v108("}");
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_76 = v52;
            local l_l_kind_1_75 = l_kind_1;
            v49 = l_v52_76;
            l_kind_0 = l_l_kind_1_75;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v493 = if l_kind_0 == "}" then v105("}") else nil;
        return {
            kind = "while", 
            keyword = v467, 
            expression = {
                left = v472, 
                right = v482, 
                value = v477
            }, 
            block = {
                left = v487, 
                right = v493, 
                value = v488
            }, 
            span = vector.create(v467.span.x, if v493 then v493.span.y else v488.span.y, 0)
        };
    end;
    v118 = function() --[[ Line: 1258 ]] --[[ Name: parse_for ]]
        -- upvalues: v105 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v110 (ref), v115 (ref)
        local v494 = v105("for");
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_77 = v52;
            local l_l_kind_1_76 = l_kind_1;
            v49 = l_v52_77;
            l_kind_0 = l_l_kind_1_76;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v499 = if l_kind_0 == "(" then v105("(") else nil;
        local v500 = v110();
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_78 = v52;
            local l_l_kind_1_77 = l_kind_1;
            v49 = l_v52_78;
            l_kind_0 = l_l_kind_1_77;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v505 = if l_kind_0 == ")" then v105(")") else nil;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_79 = v52;
            local l_l_kind_1_78 = l_kind_1;
            v49 = l_v52_79;
            l_kind_0 = l_l_kind_1_78;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v510 = if l_kind_0 == "|" then v115() else nil;
        return {
            kind = "for", 
            keyword = v494, 
            expression = {
                left = v499, 
                right = v505, 
                value = v500
            }, 
            call = v510, 
            span = vector.create(v494.span.x, if v510 then v510.span.y else if v505 then v505.span.y else v500.span.y, 0)
        };
    end;
    v119 = function() --[[ Line: 1281 ]] --[[ Name: parse_return ]]
        -- upvalues: v105 (copy), l_kind_0 (ref), v106 (ref)
        local v511 = v105("return");
        local l_y_2 = v511.span.y;
        local v513 = {};
        while l_kind_0 ~= "}" and l_kind_0 ~= "eof" do
            if #v513 > 0 then
                v105(",");
            end;
            local v514 = v106();
            table.insert(v513, v514);
            l_y_2 = v514.span.y;
        end;
        return {
            kind = "return", 
            values = v513, 
            keyword = v511, 
            span = vector.create(v511.span.x, l_y_2, 0)
        };
    end;
    v108 = function(v515, v516) --[[ Line: 1302 ]] --[[ Name: parse_block ]]
        -- upvalues: l_x_0 (ref), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_1 (ref), v48 (copy), v105 (copy), v110 (ref), v116 (ref), v117 (ref), v118 (ref), v119 (ref), v107 (ref)
        local v517 = false;
        local v518 = {};
        local v519 = nil;
        local v520 = v516 or l_x_0;
        local l_v520_0 = v520;
        while l_kind_0 ~= v515 do
            if v519 then
                local v522 = {
                    message = "expected to finish after last statement", 
                    span = v49.span
                };
                error(("%* from %* to %*"):format(v522.message, v522.span.x, v522.span.y), 0);
            end;
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_80 = v52;
                local l_l_kind_1_79 = l_kind_1;
                v49 = l_v52_80;
                l_kind_0 = l_l_kind_1_79;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "identifier" then
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if l_kind_1 == "=" then
                    local v527 = v105("identifier");
                    local v528 = v105("=");
                    local v529 = v110();
                    table.insert(v518, {
                        kind = "assign", 
                        span = vector.create(v527.span.x, v529.span.y, 0), 
                        operator = v528, 
                        left = v527, 
                        right = v529
                    });
                    v517 = true;
                end;
            end;
            if not v517 then
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_81 = v52;
                    local l_l_kind_1_80 = l_kind_1;
                    v49 = l_v52_81;
                    l_kind_0 = l_l_kind_1_80;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "if" then
                    table.insert(v518, v116());
                else
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_82 = v52;
                        local l_l_kind_1_81 = l_kind_1;
                        v49 = l_v52_82;
                        l_kind_0 = l_l_kind_1_81;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if l_kind_0 == "while" then
                        table.insert(v518, v117());
                    else
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_83 = v52;
                            local l_l_kind_1_82 = l_kind_1;
                            v49 = l_v52_83;
                            l_kind_0 = l_l_kind_1_82;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if l_kind_0 == "for" then
                            table.insert(v518, v118());
                        else
                            while l_kind_0 == "\n" do
                                local _ = v49;
                                local _ = l_kind_0;
                                local l_v52_84 = v52;
                                local l_l_kind_1_83 = l_kind_1;
                                v49 = l_v52_84;
                                l_kind_0 = l_l_kind_1_83;
                                l_x_0 = l_x_1;
                                v52 = v48();
                                l_kind_1 = v52.kind;
                                l_x_1 = v52.span.x;
                            end;
                            if l_kind_0 == "return" then
                                v519 = v119();
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v49;
                                    local _ = l_kind_0;
                                    local l_v52_85 = v52;
                                    local l_l_kind_1_84 = l_kind_1;
                                    v49 = l_v52_85;
                                    l_kind_0 = l_l_kind_1_84;
                                    l_x_0 = l_x_1;
                                    v52 = v48();
                                    l_kind_1 = v52.kind;
                                    l_x_1 = v52.span.x;
                                end;
                                if l_kind_0 == "break" then
                                    local v550 = v105("break");
                                    v519 = {
                                        kind = "break", 
                                        span = v550.span, 
                                        keyword = v550
                                    };
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v49;
                                        local _ = l_kind_0;
                                        local l_v52_86 = v52;
                                        local l_l_kind_1_85 = l_kind_1;
                                        v49 = l_v52_86;
                                        l_kind_0 = l_l_kind_1_85;
                                        l_x_0 = l_x_1;
                                        v52 = v48();
                                        l_kind_1 = v52.kind;
                                        l_x_1 = v52.span.x;
                                    end;
                                    if l_kind_0 == "continue" then
                                        local v555 = v105("continue");
                                        v519 = {
                                            kind = "continue", 
                                            span = v555.span, 
                                            keyword = v555
                                        };
                                    else
                                        while l_kind_0 == "\n" do
                                            local _ = v49;
                                            local _ = l_kind_0;
                                            local l_v52_87 = v52;
                                            local l_l_kind_1_86 = l_kind_1;
                                            v49 = l_v52_87;
                                            l_kind_0 = l_l_kind_1_86;
                                            l_x_0 = l_x_1;
                                            v52 = v48();
                                            l_kind_1 = v52.kind;
                                            l_x_1 = v52.span.x;
                                        end;
                                        if not (l_kind_0 == "identifier") then
                                            while l_kind_0 == "\n" do
                                                local _ = v49;
                                                local _ = l_kind_0;
                                                local l_v52_88 = v52;
                                                local l_l_kind_1_87 = l_kind_1;
                                                v49 = l_v52_88;
                                                l_kind_0 = l_l_kind_1_87;
                                                l_x_0 = l_x_1;
                                                v52 = v48();
                                                l_kind_1 = v52.kind;
                                                l_x_1 = v52.span.x;
                                            end;
                                            if l_kind_0 ~= "$" then
                                                while l_kind_0 == "\n" do
                                                    local _ = v49;
                                                    local _ = l_kind_0;
                                                    local l_v52_89 = v52;
                                                    local l_l_kind_1_88 = l_kind_1;
                                                    v49 = l_v52_89;
                                                    l_kind_0 = l_l_kind_1_88;
                                                    l_x_0 = l_x_1;
                                                    v52 = v48();
                                                    l_kind_1 = v52.kind;
                                                    l_x_1 = v52.span.x;
                                                end;
                                                if l_kind_0 == ";" then
                                                    local _ = v49;
                                                    local _ = l_kind_0;
                                                    local l_v52_90 = v52;
                                                    local l_l_kind_1_89 = l_kind_1;
                                                    v49 = l_v52_90;
                                                    l_kind_0 = l_l_kind_1_89;
                                                    l_x_0 = l_x_1;
                                                    v52 = v48();
                                                    l_kind_1 = v52.kind;
                                                    l_x_1 = v52.span.x;
                                                    v517 = true;
                                                elseif l_kind_0 ~= "eof" then
                                                    if l_kind_0 == v515 then
                                                        l_v520_0 = l_x_0;
                                                        break;
                                                    else
                                                        local v572 = {
                                                            message = ("cannot parse %*"):format(l_kind_0), 
                                                            span = v49.span
                                                        };
                                                        error(("%* from %* to %*"):format(v572.message, v572.span.x, v572.span.y), 0);
                                                        v517 = true;
                                                    end;
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                        if not v517 then
                                            if not v517 then
                                                table.insert(v518, v107());
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v517 = false;
            l_v520_0 = l_x_0;
        end;
        return {
            span = vector.create(v520, l_v520_0, 0), 
            body = v518, 
            last_statement = v519
        };
    end;
    return v108("eof");
end;
return function(v574) --[[ Line: 1387 ]] --[[ Name: generate ]]
    -- upvalues: v573 (copy)
    local l_v574_0 = v574;
    local v576 = coroutine.create(v573);
    local v577 = nil;
    local function v580(v578) --[[ Line: 1392 ]] --[[ Name: overwrite ]]
        -- upvalues: l_v574_0 (ref), v577 (ref), v576 (copy)
        l_v574_0 = v578;
        local v579 = buffer.fromstring(v578);
        return v577(coroutine.resume(v576, v579, yield));
    end;
    v577 = function(v581, v582) --[[ Line: 1398 ]] --[[ Name: get_result ]]
        -- upvalues: l_v574_0 (ref), v576 (copy)
        if v581 == false then
            return {
                status = "error", 
                src = l_v574_0, 
                why = v582
            };
        elseif coroutine.status(v576) == "dead" then
            return {
                status = "finished", 
                src = l_v574_0, 
                value = v582
            };
        else
            error("?");
            return;
        end;
    end;
    return v580(v574);
end;