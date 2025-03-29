--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ast.0.2.0.conch_ast.src.lib
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = require("../roblox_packages/types");
local function _(v1) --[[ Line: 8 ]] --[[ Name: char ]]
    return (string.byte(v1));
end;
local function v405(v3, v4) --[[ Line: 13 ]] --[[ Name: parse ]]
    local v5 = 0;
    local v6 = 0;
    local v7 = buffer.len(v3);
    local function _() --[[ Line: 18 ]] --[[ Name: peek ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref)
        if v5 == v7 then
            return 0;
        else
            return (buffer.readu8(v3, v5));
        end;
    end;
    local function _() --[[ Line: 23 ]] --[[ Name: bump ]]
        -- upvalues: v5 (ref), v7 (ref)
        v5 = math.min(v5 + 1, v7);
    end;
    local function _() --[[ Line: 25 ]] --[[ Name: bump_any ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v6 (ref)
        if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
            v6 = v6 + 1;
        end;
        v5 = math.min(v5 + 1, v7);
        if v5 == v7 then
            return 0;
        else
            return (buffer.readu8(v3, v5));
        end;
    end;
    local function _(v11) --[[ Line: 34 ]] --[[ Name: eof ]]
        -- upvalues: v5 (ref), v7 (ref)
        if v7 <= v5 then
            error(v11, 0);
        end;
        return false;
    end;
    local function _() --[[ Line: 39 ]] --[[ Name: bump_peek ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref)
        v5 = math.min(v5 + 1, v7);
        if v5 == v7 then
            return 0;
        else
            return (buffer.readu8(v3, v5));
        end;
    end;
    local function _(v14) --[[ Line: 44 ]] --[[ Name: is_whitespace ]]
        local v15 = true;
        if v14 ~= 32 then
            v15 = true;
            if v14 ~= 9 then
                v15 = v14 == 13;
            end;
        end;
        return v15;
    end;
    local function _(v17) --[[ Line: 48 ]] --[[ Name: is_digit ]]
        local v18 = false;
        if v17 >= 48 then
            v18 = v17 <= 57;
        end;
        return v18;
    end;
    local function v21(v20) --[[ Line: 52 ]] --[[ Name: is_alpha ]]
        return v20 >= 97 and v20 <= 122 or v20 >= 65 and v20 <= 90 or v20 == 64 or v20 == 95;
    end;
    local function v27() --[[ Line: 59 ]] --[[ Name: string_backslash ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v6 (ref)
        local v22 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        if v22 == 13 then
            v5 = math.min(v5 + 1, v7);
            if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                v5 = math.min(v5 + 1, v7);
                v6 = v6 + 1;
                return;
            end;
        elseif v22 == 122 then
            v5 = math.min(v5 + 1, v7);
            while true do
                local v23 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                local v24 = true;
                if v23 ~= 32 then
                    v24 = true;
                    if v23 ~= 9 then
                        v24 = v23 == 13;
                    end;
                end;
                if v24 then
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                        v6 = v6 + 1;
                    end;
                    v5 = math.min(v5 + 1, v7);
                    if v5 == v7 then
                        v24 = 0;
                    else
                        v24 = buffer.readu8(v3, v5);
                    end;
                else
                    break;
                end;
            end;
        else
            if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                v6 = v6 + 1;
            end;
            v5 = math.min(v5 + 1, v7);
            if v5 == v7 then
                local _ = 0;
                return;
            else
                local _ = buffer.readu8(v3, v5);
            end;
        end;
    end;
    local function v30() --[[ Line: 80 ]] --[[ Name: quoted_string ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v27 (copy)
        local v28 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        v5 = math.min(v5 + 1, v7);
        local v29 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        while v29 ~= v28 do
            if v7 <= v5 then
                error("unterminated string", 0);
            end;
            if not false then
                if v29 == 0 or v29 == 10 or v29 == 13 then
                    has_error = true;
                    return "error";
                else
                    if v29 == 92 then
                        v5 = math.min(v5 + 1, v7);
                        v27();
                    else
                        v5 = math.min(v5 + 1, v7);
                    end;
                    if v5 == v7 then
                        v29 = 0;
                    else
                        v29 = buffer.readu8(v3, v5);
                    end;
                end;
            else
                break;
            end;
        end;
        v5 = math.min(v5 + 1, v7);
        return "string";
    end;
    local function v39() --[[ Line: 102 ]] --[[ Name: number ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v21 (copy)
        local l_v5_0 = v5;
        local v32 = 10;
        local v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        if v33 == 48 then
            v5 = math.min(v5 + 1, v7);
            v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
            if v33 == 120 or v33 == 88 then
                v5 = math.min(v5 + 1, v7);
                v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                v32 = 16;
            elseif v33 == 98 or v33 == 66 then
                v5 = math.min(v5 + 1, v7);
                v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                v32 = 2;
            end;
        end;
        while true do
            local l_v33_0 = v33;
            local v35 = false;
            if l_v33_0 >= 48 then
                v35 = l_v33_0 <= 57;
            end;
            if v35 or v33 == 46 or v33 == 95 then
                v5 = math.min(v5 + 1, v7);
                if v5 == v7 then
                    v33 = 0;
                else
                    v33 = buffer.readu8(v3, v5);
                end;
            else
                break;
            end;
        end;
        if v33 == 101 or v33 == 69 then
            v5 = math.min(v5 + 1, v7);
            v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
            if v33 == 43 or v33 == 45 then
                v5 = math.min(v5 + 1, v7);
                v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
            end;
        end;
        while true do
            local l_v33_1 = v33;
            local v37 = false;
            if l_v33_1 >= 48 then
                v37 = l_v33_1 <= 57;
            end;
            if v37 or v21(v33) or v33 == 95 then
                v5 = math.min(v5 + 1, v7);
                if v5 == v7 then
                    v33 = 0;
                else
                    v33 = buffer.readu8(v3, v5);
                end;
            else
                break;
            end;
        end;
        local v38 = nil;
        v38 = if v32 == 10 then buffer.readstring(v3, l_v5_0, v5 - l_v5_0) else buffer.readstring(v3, l_v5_0 + 2, v5 - l_v5_0 - 2);
        if tonumber(string.gsub(v38, "_", ""), v32) then
            return "number";
        else
            has_error = true;
            return "error";
        end;
    end;
    local function v40() --[[ Line: 152 ]] --[[ Name: read_kind ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v6 (ref), v21 (copy), v39 (copy), v30 (copy), v40 (copy)
        local v41 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        if v41 == 0 then
            return "eof";
        elseif v41 == 35 then
            while v41 ~= 10 and v41 ~= 0 do
                if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                    v6 = v6 + 1;
                end;
                v5 = math.min(v5 + 1, v7);
                if v5 == v7 then
                    local _ = 0;
                else
                    local _ = buffer.readu8(v3, v5);
                end;
            end;
            return "comment";
        else
            local l_v41_0 = v41;
            local v45 = true;
            if l_v41_0 ~= 32 then
                v45 = true;
                if l_v41_0 ~= 9 then
                    v45 = l_v41_0 == 13;
                end;
            end;
            if v45 then
                v5 = math.min(v5 + 1, v7);
                return "whitespace";
            elseif v21(v41) then
                v45 = v5;
                while true do
                    v5 = math.min(v5 + 1, v7);
                    v41 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                    if v21(v41) then
                        continue;
                    end;
                    local l_v41_1 = v41;
                    l_v41_0 = false;
                    if l_v41_1 >= 48 then
                        l_v41_0 = l_v41_1 <= 57;
                    end;
                    if not l_v41_0 and v41 ~= 45 then
                        break;
                    end;
                end;
                l_v41_0 = buffer.readstring(v3, v45, v5 - v45);
                if l_v41_0 == "true" then
                    return "true";
                elseif l_v41_0 == "false" then
                    return "false";
                elseif l_v41_0 == "nil" then
                    return "nil";
                elseif l_v41_0 == "return" then
                    return "return";
                elseif l_v41_0 == "for" then
                    return "for";
                elseif l_v41_0 == "while" then
                    return "while";
                elseif l_v41_0 == "if" then
                    return "if";
                elseif l_v41_0 == "else" then
                    return "else";
                elseif l_v41_0 == "break" then
                    return "break";
                elseif l_v41_0 == "continue" then
                    return "continue";
                else
                    return "identifier";
                end;
            else
                l_v41_0 = v41;
                v45 = false;
                if l_v41_0 >= 48 then
                    v45 = l_v41_0 <= 57;
                end;
                if v45 then
                    return (v39());
                elseif v41 == 34 then
                    return (v30());
                elseif v41 == 39 then
                    return (v30());
                elseif v41 == 46 then
                    l_v41_0 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                    v45 = false;
                    if l_v41_0 >= 48 then
                        v45 = l_v41_0 <= 57;
                    end;
                    if v45 then
                        v5 = v5 - 1;
                        return (v39());
                    else
                        v5 = math.min(v5 + 1, v7);
                        return ".";
                    end;
                elseif v41 == 61 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return "==";
                    else
                        return "=";
                    end;
                elseif v41 == 126 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return "~=";
                    else
                        has_error = true;
                        return "error";
                    end;
                elseif v41 == 62 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return ">=";
                    else
                        return ">";
                    end;
                elseif v41 == 60 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return "<=";
                    else
                        return "<";
                    end;
                elseif v41 == 36 then
                    v5 = math.min(v5 + 1, v7);
                    return "$";
                elseif v41 == 40 then
                    v5 = math.min(v5 + 1, v7);
                    return "(";
                elseif v41 == 41 then
                    v5 = math.min(v5 + 1, v7);
                    return ")";
                elseif v41 == 123 then
                    v5 = math.min(v5 + 1, v7);
                    return "{";
                elseif v41 == 125 then
                    v5 = math.min(v5 + 1, v7);
                    return "}";
                elseif v41 == 91 then
                    v5 = math.min(v5 + 1, v7);
                    return "[";
                elseif v41 == 93 then
                    v5 = math.min(v5 + 1, v7);
                    return "]";
                elseif v41 == 124 then
                    v5 = math.min(v5 + 1, v7);
                    return "|";
                elseif v41 == 10 then
                    v5 = math.min(v5 + 1, v7);
                    return "\n";
                elseif v41 == 59 then
                    v5 = math.min(v5 + 1, v7);
                    return ";";
                elseif v41 == 44 then
                    v5 = math.min(v5 + 1, v7);
                    return ",";
                else
                    l_v41_0 = v41;
                    v45 = true;
                    if l_v41_0 ~= 32 then
                        v45 = true;
                        if l_v41_0 ~= 9 then
                            v45 = l_v41_0 == 13;
                        end;
                    end;
                    if v45 then
                        v5 = math.min(v5 + 1, v7);
                        return v40();
                    else
                        error(("no symbol matching %*"):format((string.char(v41))), 0);
                        return "error";
                    end;
                end;
            end;
        end;
    end;
    local function v49() --[[ Line: 292 ]] --[[ Name: next_token ]]
        -- upvalues: v5 (ref), v40 (copy), v3 (ref)
        local l_v5_1 = v5;
        local v48 = v40();
        while v48 == "whitespace" or v48 == "comment" do
            l_v5_1 = v5;
            v48 = v40();
        end;
        return {
            kind = v48, 
            text = buffer.readstring(v3, l_v5_1, v5 - l_v5_1), 
            span = vector.create(l_v5_1, v5, 0)
        };
    end;
    local v50 = v49();
    local l_kind_0 = v50.kind;
    local l_x_0 = v50.span.x;
    local v53 = v49();
    local l_kind_1 = v53.kind;
    local l_x_1 = v53.span.x;
    local function _() --[[ Line: 315 ]] --[[ Name: consume ]]
        -- upvalues: v50 (ref), l_kind_0 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy)
        local l_v50_0 = v50;
        local l_l_kind_0_0 = l_kind_0;
        local l_v53_0 = v53;
        local l_l_kind_1_0 = l_kind_1;
        v50 = l_v53_0;
        l_kind_0 = l_l_kind_1_0;
        l_x_0 = l_x_1;
        v53 = v49();
        l_kind_1 = v53.kind;
        l_x_1 = v53.span.x;
        return l_v50_0, l_l_kind_0_0;
    end;
    local _ = function(v61) --[[ Line: 325 ]] --[[ Name: current_is ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy)
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_1 = v53;
            local l_l_kind_1_1 = l_kind_1;
            v50 = l_v53_1;
            l_kind_0 = l_l_kind_1_1;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        return l_kind_0 == v61;
    end;
    local function _(v67) --[[ Line: 333 ]] --[[ Name: lookahead_is ]]
        -- upvalues: l_kind_1 (ref), v53 (ref), v49 (copy)
        while l_kind_1 == "\n" do
            v53 = v49();
            l_kind_1 = v53.kind;
        end;
        return l_kind_1 == v67;
    end;
    local function _() --[[ Line: 342 ]] --[[ Name: yield ]]
        -- upvalues: v4 (copy), v3 (ref), v7 (ref), v50 (ref), v49 (copy), l_kind_0 (ref), v53 (ref), l_kind_1 (ref)
        if v4 then
            local v69 = coroutine.yield();
            assert(typeof(v69) == "buffer");
            v3 = v69;
            v7 = buffer.len(v69);
            v50 = v49();
            l_kind_0 = v50.kind;
            v53 = v49();
            l_kind_1 = v53.kind;
        end;
    end;
    local function _(v71) --[[ Line: 356 ]] --[[ Name: display ]]
        local l_kind_2 = v71.kind;
        if l_kind_2 == "identifier" or l_kind_2 == "number" or l_kind_2 == "string" then
            return l_kind_2;
        elseif v71.kind == "error" then
            return "error '" .. v71.text .. "'";
        else
            return "'" .. l_kind_2 .. "'";
        end;
    end;
    local function v77(v74, v75) --[[ Line: 368 ]] --[[ Name: report ]]
        -- upvalues: v50 (ref)
        local v76 = {
            message = v74, 
            span = v75 or v50.span
        };
        error(("%* from %* to %*"):format(v76.message, v76.span.x, v76.span.y), 0);
    end;
    local function v85(v78) --[[ Line: 377 ]] --[[ Name: expect_failure ]]
        -- upvalues: v77 (copy), v50 (ref), l_kind_0 (ref)
        local l_v77_0 = v77;
        local v80 = "expected %*, but got %* of %* instead";
        local v81 = {
            kind = v78
        };
        local l_kind_3 = v81.kind;
        local v83 = if not (l_kind_3 ~= "identifier" and l_kind_3 ~= "number") or l_kind_3 == "string" then l_kind_3 else if v81.kind == "error" then "error '" .. v81.text .. "'" else "'" .. l_kind_3 .. "'";
        l_kind_3 = v50;
        local l_kind_4 = l_kind_3.kind;
        return l_v77_0((v80:format(v83, if not (l_kind_4 ~= "identifier" and l_kind_4 ~= "number") or l_kind_4 == "string" then l_kind_4 else if l_kind_3.kind == "error" then "error '" .. l_kind_3.text .. "'" else "'" .. l_kind_4 .. "'", l_kind_0)));
    end;
    local function v109(v86) --[[ Line: 387 ]] --[[ Name: expect ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v4 (copy), v3 (ref), v7 (ref), v85 (copy)
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_2 = v53;
            local l_l_kind_1_2 = l_kind_1;
            v50 = l_v53_2;
            l_kind_0 = l_l_kind_1_2;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        if l_kind_0 == v86 then
            local l_v50_3 = v50;
            local _ = l_kind_0;
            local l_v53_3 = v53;
            local l_l_kind_1_3 = l_kind_1;
            v50 = l_v53_3;
            l_kind_0 = l_l_kind_1_3;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
            return l_v50_3;
        elseif l_kind_0 == "eof" and v4 then
            if v4 then
                local v95 = coroutine.yield();
                assert(typeof(v95) == "buffer");
                v3 = v95;
                v7 = buffer.len(v95);
                v50 = v49();
                l_kind_0 = v50.kind;
                v53 = v49();
                l_kind_1 = v53.kind;
            end;
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_4 = v53;
                local l_l_kind_1_4 = l_kind_1;
                v50 = l_v53_4;
                l_kind_0 = l_l_kind_1_4;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if l_kind_0 == v86 then
                local l_v50_5 = v50;
                local _ = l_kind_0;
                local l_v53_5 = v53;
                local l_l_kind_1_5 = l_kind_1;
                v50 = l_v53_5;
                l_kind_0 = l_l_kind_1_5;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
                return l_v50_5;
            else
                local v104 = "expected %*, but got %* of %* instead";
                local v105 = {
                    kind = v86
                };
                local l_kind_5 = v105.kind;
                local v107 = if not (l_kind_5 ~= "identifier" and l_kind_5 ~= "number") or l_kind_5 == "string" then l_kind_5 else if v105.kind == "error" then "error '" .. v105.text .. "'" else "'" .. l_kind_5 .. "'";
                l_kind_5 = v50;
                local l_kind_6 = l_kind_5.kind;
                v104 = {
                    message = v104:format(v107, if not (l_kind_6 ~= "identifier" and l_kind_6 ~= "number") or l_kind_6 == "string" then l_kind_6 else if l_kind_5.kind == "error" then "error '" .. l_kind_5.text .. "'" else "'" .. l_kind_6 .. "'", l_kind_0), 
                    span = v50.span
                };
                error(("%* from %* to %*"):format(v104.message, v104.span.x, v104.span.y), 0);
                return nil;
            end;
        else
            return v85(v86);
        end;
    end;
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
    local v121 = nil;
    local v122 = nil;
    local v123 = nil;
    v116 = function() --[[ Line: 413 ]] --[[ Name: parse_var_root ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v109 (copy), v114 (ref), v77 (copy)
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_6 = v53;
            local l_l_kind_1_6 = l_kind_1;
            v50 = l_v53_6;
            l_kind_0 = l_l_kind_1_6;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        if l_kind_0 == "identifier" then
            local v128 = v109("identifier");
            return {
                kind = "global", 
                span = v128.span, 
                token = v128
            };
        else
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_7 = v53;
                local l_l_kind_1_7 = l_kind_1;
                v50 = l_v53_7;
                l_kind_0 = l_l_kind_1_7;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if l_kind_0 == "$" then
                while l_kind_1 == "\n" do
                    v53 = v49();
                    l_kind_1 = v53.kind;
                end;
                if l_kind_1 == "identifier" then
                    local v133 = v109("$");
                    local v134 = v109("identifier");
                    return {
                        kind = "name", 
                        span = vector.create(v133.span.x, v134.span.y, 0), 
                        name = v134
                    };
                end;
            end;
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_8 = v53;
                local l_l_kind_1_8 = l_kind_1;
                v50 = l_v53_8;
                l_kind_0 = l_l_kind_1_8;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if l_kind_0 == "$" then
                while l_kind_1 == "\n" do
                    v53 = v49();
                    l_kind_1 = v53.kind;
                end;
                if l_kind_1 == "(" then
                    local v139 = v109("$");
                    v109("(");
                    local v140 = v114();
                    local v141 = v109(")");
                    return {
                        kind = "paren", 
                        span = vector.create(v139.span.x, v141.span.y, 0), 
                        expr = v140
                    };
                end;
            end;
            local l_v77_1 = v77;
            local v143 = "expected identifier, got %*";
            local l_v53_9 = v53;
            local l_kind_7 = l_v53_9.kind;
            return l_v77_1((v143:format(if not (l_kind_7 ~= "identifier" and l_kind_7 ~= "number") or l_kind_7 == "string" then l_kind_7 else if l_v53_9.kind == "error" then "error '" .. l_v53_9.text .. "'" else "'" .. l_kind_7 .. "'")));
        end;
    end;
    v117 = function() --[[ Line: 442 ]] --[[ Name: parse_var_suffix ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v109 (copy), v114 (ref), v77 (copy)
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_10 = v53;
            local l_l_kind_1_9 = l_kind_1;
            v50 = l_v53_10;
            l_kind_0 = l_l_kind_1_9;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        if l_kind_0 == "." then
            local v150 = v109(".");
            local v151 = v109("identifier");
            return {
                kind = "nameindex", 
                span = vector.create(v150.span.x, v151.span.y, 0), 
                name = v151
            };
        else
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_11 = v53;
                local l_l_kind_1_10 = l_kind_1;
                v50 = l_v53_11;
                l_kind_0 = l_l_kind_1_10;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if l_kind_0 == "[" then
                local v156 = v109("[");
                local v157 = v114();
                local v158 = v109("]");
                return {
                    kind = "exprindex", 
                    span = vector.create(v156.span.x, v158.span.y, 0), 
                    expr = v157
                };
            else
                return v77("invalid");
            end;
        end;
    end;
    v118 = function() --[[ Line: 465 ]] --[[ Name: parse_var_suffixes ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v117 (ref)
        local v159 = false;
        local v160 = {};
        while true do
            if l_kind_0 == "\n" then
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_12 = v53;
                local l_l_kind_1_11 = l_kind_1;
                v50 = l_v53_12;
                l_kind_0 = l_l_kind_1_11;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
                continue;
            end;
            v159 = l_kind_0 == ".";
            if not v159 then
                while l_kind_0 == "\n" do
                    local _ = v50;
                    local _ = l_kind_0;
                    local l_v53_13 = v53;
                    local l_l_kind_1_12 = l_kind_1;
                    v50 = l_v53_13;
                    l_kind_0 = l_l_kind_1_12;
                    l_x_0 = l_x_1;
                    v53 = v49();
                    l_kind_1 = v53.kind;
                    l_x_1 = v53.span.x;
                end;
                if l_kind_0 ~= "[" then
                    break;
                end;
            end;
            v159 = false;
            table.insert(v160, (v117()));
        end;
        return v160;
    end;
    v115 = function() --[[ Line: 474 ]] --[[ Name: parse_var ]]
        -- upvalues: v116 (ref), v118 (ref)
        local v169 = v116();
        local v170 = if v169.kind ~= "global" then v118() else {};
        return {
            span = vector.create(v169.span.x, if #v170 > 0 then v170[#v170].span.y else v169.span.y, 0), 
            prefix = v169, 
            suffixes = v170
        };
    end;
    v114 = function() --[[ Line: 492 ]] --[[ Name: parse_expression_or_command ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v111 (ref), v4 (copy), v3 (ref), v7 (ref), v114 (ref), v110 (ref)
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_14 = v53;
            local l_l_kind_1_13 = l_kind_1;
            v50 = l_v53_14;
            l_kind_0 = l_l_kind_1_13;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        if l_kind_0 == "identifier" then
            return v111();
        elseif l_kind_0 == "eof" and v4 then
            if v4 then
                local v175 = coroutine.yield();
                assert(typeof(v175) == "buffer");
                v3 = v175;
                v7 = buffer.len(v175);
                v50 = v49();
                l_kind_0 = v50.kind;
                v53 = v49();
                l_kind_1 = v53.kind;
            end;
            return v114();
        else
            return v110();
        end;
    end;
    v119 = function() --[[ Line: 503 ]] --[[ Name: parse_function_body ]]
        -- upvalues: v109 (copy), l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v4 (copy), v3 (ref), v7 (ref), v112 (ref)
        local l_x_2 = v109("|").span.x;
        local v177 = {};
        local v178 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_15 = v53;
                local l_l_kind_1_14 = l_kind_1;
                v50 = l_v53_15;
                l_kind_0 = l_l_kind_1_14;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
                continue;
            end;
            if not (l_kind_0 == "|") then
                if l_kind_0 == "eof" and v4 then
                    if v4 then
                        local v183 = coroutine.yield();
                        assert(typeof(v183) == "buffer");
                        v3 = v183;
                        v7 = buffer.len(v183);
                        v50 = v49();
                        l_kind_0 = v50.kind;
                        v53 = v49();
                        l_kind_1 = v53.kind;
                    end;
                else
                    if not v178 then
                        v109(",");
                    end;
                    table.insert(v177, v109("identifier"));
                    v178 = false;
                end;
            else
                break;
            end;
        end;
        v109("|");
        v109("{");
        local v184 = v112("}");
        return {
            span = vector.create(l_x_2, v109("}").span.y, 0), 
            arguments = v177, 
            block = v184
        };
    end;
    v113 = function() --[[ Line: 532 ]] --[[ Name: parse_lambda ]]
        -- upvalues: v119 (ref)
        local v185 = v119();
        return {
            kind = "lambda", 
            body = v185, 
            span = v185.span
        };
    end;
    parse_table = function() --[[ Line: 541 ]] --[[ Name: parse_table ]]
        -- upvalues: v109 (copy), l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v110 (ref)
        local l_x_3 = v109("{").span.x;
        local v187 = {};
        local v188 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_16 = v53;
                local l_l_kind_1_15 = l_kind_1;
                v50 = l_v53_16;
                l_kind_0 = l_l_kind_1_15;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
                continue;
            end;
            if not (l_kind_0 == "}") then
                if not v188 then
                    v109(",");
                end;
                v188 = false;
                while l_kind_0 == "\n" do
                    local _ = v50;
                    local _ = l_kind_0;
                    local l_v53_17 = v53;
                    local l_l_kind_1_16 = l_kind_1;
                    v50 = l_v53_17;
                    l_kind_0 = l_l_kind_1_16;
                    l_x_0 = l_x_1;
                    v53 = v49();
                    l_kind_1 = v53.kind;
                    l_x_1 = v53.span.x;
                end;
                if l_kind_0 == "identifier" then
                    while l_kind_1 == "\n" do
                        v53 = v49();
                        l_kind_1 = v53.kind;
                    end;
                    if l_kind_1 == "=" then
                        local v197 = v109("identifier");
                        v109("=");
                        local v198 = v110();
                        table.insert(v187, {
                            kind = "namekey", 
                            name = v197, 
                            value = v198
                        });
                        continue;
                    end;
                end;
                while l_kind_0 == "\n" do
                    local _ = v50;
                    local _ = l_kind_0;
                    local l_v53_18 = v53;
                    local l_l_kind_1_17 = l_kind_1;
                    v50 = l_v53_18;
                    l_kind_0 = l_l_kind_1_17;
                    l_x_0 = l_x_1;
                    v53 = v49();
                    l_kind_1 = v53.kind;
                    l_x_1 = v53.span.x;
                end;
                if l_kind_0 == "[" then
                    v109("[");
                    local v203 = v110();
                    v109("]");
                    v109("=");
                    local v204 = v110();
                    table.insert(v187, {
                        kind = "exprkey", 
                        key = v203, 
                        value = v204
                    });
                else
                    local v205 = v110();
                    table.insert(v187, {
                        kind = "nokey", 
                        value = v205
                    });
                end;
            else
                break;
            end;
        end;
        local l_y_0 = v109("}").span.y;
        return {
            fields = v187, 
            span = vector.create(l_x_3, l_y_0, 0)
        };
    end;
    parse_vector = function() --[[ Line: 584 ]] --[[ Name: parse_vector ]]
        -- upvalues: v109 (copy), l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v110 (ref)
        local v207 = v109("[");
        local v208 = {};
        local v209 = 0;
        while v209 < 3 do
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_19 = v53;
                local l_l_kind_1_18 = l_kind_1;
                v50 = l_v53_19;
                l_kind_0 = l_l_kind_1_18;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if not (l_kind_0 == "]") then
                if v209 ~= 0 then
                    v109(",");
                end;
                v209 = v209 + 1;
                v208[v209] = v110();
            else
                break;
            end;
        end;
        local v214 = v109("]");
        return {
            kind = "vector", 
            span = vector.create(v207.span.x, v214.span.y, 0), 
            contents = v208
        };
    end;
    v110 = function() --[[ Line: 607 ]] --[[ Name: parse_expression ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v109 (copy), v111 (ref), v110 (ref), v115 (ref), v113 (ref), v4 (copy), v3 (ref), v7 (ref), v77 (copy)
        local v215 = false;
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_20 = v53;
            local l_l_kind_1_19 = l_kind_1;
            v50 = l_v53_20;
            l_kind_0 = l_l_kind_1_19;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        if l_kind_0 == "$" then
            while l_kind_1 == "\n" do
                v53 = v49();
                l_kind_1 = v53.kind;
            end;
            if l_kind_1 == "(" then
                local l_x_4 = v109("$").span.x;
                local v221 = nil;
                while l_kind_1 == "\n" do
                    v53 = v49();
                    l_kind_1 = v53.kind;
                end;
                if not (l_kind_1 == "$") then
                    while l_kind_1 == "\n" do
                        v53 = v49();
                        l_kind_1 = v53.kind;
                    end;
                    if l_kind_1 ~= "identifier" then
                        v109("(");
                        v221 = v110();
                        v215 = true;
                    end;
                end;
                if not v215 then
                    v109("(");
                    v221 = v111();
                end;
                v215 = false;
                local l_y_1 = v109(")").span.y;
                return {
                    kind = "evaluate", 
                    body = v221, 
                    span = vector.create(l_x_4, l_y_1, 0)
                };
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_21 = v53;
            local l_l_kind_1_20 = l_kind_1;
            v50 = l_v53_21;
            l_kind_0 = l_l_kind_1_20;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        if l_kind_0 == "$" then
            local v227 = v115();
            return {
                kind = "var", 
                var = v227, 
                span = v227.span
            };
        else
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_22 = v53;
                local l_l_kind_1_21 = l_kind_1;
                v50 = l_v53_22;
                l_kind_0 = l_l_kind_1_21;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if l_kind_0 == "string" then
                local v232 = v109("string");
                return {
                    kind = "string", 
                    token = v232, 
                    span = v232.span
                };
            else
                while l_kind_0 == "\n" do
                    local _ = v50;
                    local _ = l_kind_0;
                    local l_v53_23 = v53;
                    local l_l_kind_1_22 = l_kind_1;
                    v50 = l_v53_23;
                    l_kind_0 = l_l_kind_1_22;
                    l_x_0 = l_x_1;
                    v53 = v49();
                    l_kind_1 = v53.kind;
                    l_x_1 = v53.span.x;
                end;
                if l_kind_0 == "number" then
                    local v237 = v109("number");
                    return {
                        kind = "number", 
                        token = v237, 
                        span = v237.span
                    };
                else
                    while l_kind_0 == "\n" do
                        local _ = v50;
                        local _ = l_kind_0;
                        local l_v53_24 = v53;
                        local l_l_kind_1_23 = l_kind_1;
                        v50 = l_v53_24;
                        l_kind_0 = l_l_kind_1_23;
                        l_x_0 = l_x_1;
                        v53 = v49();
                        l_kind_1 = v53.kind;
                        l_x_1 = v53.span.x;
                    end;
                    if l_kind_0 == "true" then
                        local v242 = v109("true");
                        return {
                            kind = "boolean", 
                            token = v242, 
                            span = v242.span
                        };
                    else
                        while l_kind_0 == "\n" do
                            local _ = v50;
                            local _ = l_kind_0;
                            local l_v53_25 = v53;
                            local l_l_kind_1_24 = l_kind_1;
                            v50 = l_v53_25;
                            l_kind_0 = l_l_kind_1_24;
                            l_x_0 = l_x_1;
                            v53 = v49();
                            l_kind_1 = v53.kind;
                            l_x_1 = v53.span.x;
                        end;
                        if l_kind_0 == "false" then
                            local v247 = v109("false");
                            return {
                                kind = "boolean", 
                                token = v247, 
                                span = v247.span
                            };
                        else
                            while l_kind_0 == "\n" do
                                local _ = v50;
                                local _ = l_kind_0;
                                local l_v53_26 = v53;
                                local l_l_kind_1_25 = l_kind_1;
                                v50 = l_v53_26;
                                l_kind_0 = l_l_kind_1_25;
                                l_x_0 = l_x_1;
                                v53 = v49();
                                l_kind_1 = v53.kind;
                                l_x_1 = v53.span.x;
                            end;
                            if l_kind_0 == "identifier" then
                                local v252 = v109("identifier");
                                return {
                                    kind = "string", 
                                    token = {
                                        kind = "string", 
                                        text = ("\"%*\""):format(v252.text), 
                                        span = v252.span
                                    }, 
                                    span = v252.span
                                };
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v50;
                                    local _ = l_kind_0;
                                    local l_v53_27 = v53;
                                    local l_l_kind_1_26 = l_kind_1;
                                    v50 = l_v53_27;
                                    l_kind_0 = l_l_kind_1_26;
                                    l_x_0 = l_x_1;
                                    v53 = v49();
                                    l_kind_1 = v53.kind;
                                    l_x_1 = v53.span.x;
                                end;
                                if l_kind_0 == "|" then
                                    return v113();
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v50;
                                        local _ = l_kind_0;
                                        local l_v53_28 = v53;
                                        local l_l_kind_1_27 = l_kind_1;
                                        v50 = l_v53_28;
                                        l_kind_0 = l_l_kind_1_27;
                                        l_x_0 = l_x_1;
                                        v53 = v49();
                                        l_kind_1 = v53.kind;
                                        l_x_1 = v53.span.x;
                                    end;
                                    if l_kind_0 == "{" then
                                        local v261 = parse_table();
                                        return {
                                            kind = "table", 
                                            table = v261, 
                                            span = v261.span
                                        };
                                    else
                                        while l_kind_0 == "\n" do
                                            local _ = v50;
                                            local _ = l_kind_0;
                                            local l_v53_29 = v53;
                                            local l_l_kind_1_28 = l_kind_1;
                                            v50 = l_v53_29;
                                            l_kind_0 = l_l_kind_1_28;
                                            l_x_0 = l_x_1;
                                            v53 = v49();
                                            l_kind_1 = v53.kind;
                                            l_x_1 = v53.span.x;
                                        end;
                                        if l_kind_0 == "[" then
                                            return parse_vector();
                                        elseif l_kind_0 == "eof" and v4 then
                                            if v4 then
                                                local v266 = coroutine.yield();
                                                assert(typeof(v266) == "buffer");
                                                v3 = v266;
                                                v7 = buffer.len(v266);
                                                v50 = v49();
                                                l_kind_0 = v50.kind;
                                                v53 = v49();
                                                l_kind_1 = v53.kind;
                                            end;
                                            return v110();
                                        else
                                            return v77((("expected expression, got %*"):format(l_kind_0)));
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v111 = function() --[[ Line: 687 ]] --[[ Name: parse_command ]]
        -- upvalues: v115 (ref), l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v110 (ref)
        local v267 = v115();
        local v268 = {};
        while l_kind_0 ~= "\n" do
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_30 = v53;
                local l_l_kind_1_29 = l_kind_1;
                v50 = l_v53_30;
                l_kind_0 = l_l_kind_1_29;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if not (l_kind_0 == "$") then
                while l_kind_0 == "\n" do
                    local _ = v50;
                    local _ = l_kind_0;
                    local l_v53_31 = v53;
                    local l_l_kind_1_30 = l_kind_1;
                    v50 = l_v53_31;
                    l_kind_0 = l_l_kind_1_30;
                    l_x_0 = l_x_1;
                    v53 = v49();
                    l_kind_1 = v53.kind;
                    l_x_1 = v53.span.x;
                end;
                if not (l_kind_0 == "string") then
                    while l_kind_0 == "\n" do
                        local _ = v50;
                        local _ = l_kind_0;
                        local l_v53_32 = v53;
                        local l_l_kind_1_31 = l_kind_1;
                        v50 = l_v53_32;
                        l_kind_0 = l_l_kind_1_31;
                        l_x_0 = l_x_1;
                        v53 = v49();
                        l_kind_1 = v53.kind;
                        l_x_1 = v53.span.x;
                    end;
                    if not (l_kind_0 == "number") then
                        while l_kind_0 == "\n" do
                            local _ = v50;
                            local _ = l_kind_0;
                            local l_v53_33 = v53;
                            local l_l_kind_1_32 = l_kind_1;
                            v50 = l_v53_33;
                            l_kind_0 = l_l_kind_1_32;
                            l_x_0 = l_x_1;
                            v53 = v49();
                            l_kind_1 = v53.kind;
                            l_x_1 = v53.span.x;
                        end;
                        if not (l_kind_0 == "true") then
                            while l_kind_0 == "\n" do
                                local _ = v50;
                                local _ = l_kind_0;
                                local l_v53_34 = v53;
                                local l_l_kind_1_33 = l_kind_1;
                                v50 = l_v53_34;
                                l_kind_0 = l_l_kind_1_33;
                                l_x_0 = l_x_1;
                                v53 = v49();
                                l_kind_1 = v53.kind;
                                l_x_1 = v53.span.x;
                            end;
                            if not (l_kind_0 == "false") then
                                while l_kind_0 == "\n" do
                                    local _ = v50;
                                    local _ = l_kind_0;
                                    local l_v53_35 = v53;
                                    local l_l_kind_1_34 = l_kind_1;
                                    v50 = l_v53_35;
                                    l_kind_0 = l_l_kind_1_34;
                                    l_x_0 = l_x_1;
                                    v53 = v49();
                                    l_kind_1 = v53.kind;
                                    l_x_1 = v53.span.x;
                                end;
                                if not (l_kind_0 == "identifier") then
                                    while l_kind_0 == "\n" do
                                        local _ = v50;
                                        local _ = l_kind_0;
                                        local l_v53_36 = v53;
                                        local l_l_kind_1_35 = l_kind_1;
                                        v50 = l_v53_36;
                                        l_kind_0 = l_l_kind_1_35;
                                        l_x_0 = l_x_1;
                                        v53 = v49();
                                        l_kind_1 = v53.kind;
                                        l_x_1 = v53.span.x;
                                    end;
                                    if not (l_kind_0 == "{") then
                                        while l_kind_0 == "\n" do
                                            local _ = v50;
                                            local _ = l_kind_0;
                                            local l_v53_37 = v53;
                                            local l_l_kind_1_36 = l_kind_1;
                                            v50 = l_v53_37;
                                            l_kind_0 = l_l_kind_1_36;
                                            l_x_0 = l_x_1;
                                            v53 = v49();
                                            l_kind_1 = v53.kind;
                                            l_x_1 = v53.span.x;
                                        end;
                                        if not (l_kind_0 == "|") then
                                            while l_kind_0 == "\n" do
                                                local _ = v50;
                                                local _ = l_kind_0;
                                                local l_v53_38 = v53;
                                                local l_l_kind_1_37 = l_kind_1;
                                                v50 = l_v53_38;
                                                l_kind_0 = l_l_kind_1_37;
                                                l_x_0 = l_x_1;
                                                v53 = v49();
                                                l_kind_1 = v53.kind;
                                                l_x_1 = v53.span.x;
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
            table.insert(v268, (v110()));
        end;
        local v305 = if #v268 > 0 then v268[#v268].span.y else v267.span.y;
        return {
            kind = "command", 
            prefix = v267, 
            arguments = v268, 
            span = vector.create(v267.span.x, v305, 0)
        };
    end;
    v120 = function() --[[ Line: 722 ]] --[[ Name: parse_if ]]
        -- upvalues: v109 (copy), l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v111 (ref), v110 (ref), v112 (ref)
        local l_x_5 = v109("if").span.x;
        local v307 = {};
        local v308 = nil;
        local v309 = true;
        local v310 = 0;
        while true do
            if v309 then
                v109("(");
                while l_kind_0 == "\n" do
                    local _ = v50;
                    local _ = l_kind_0;
                    local l_v53_39 = v53;
                    local l_l_kind_1_38 = l_kind_1;
                    v50 = l_v53_39;
                    l_kind_0 = l_l_kind_1_38;
                    l_x_0 = l_x_1;
                    v53 = v49();
                    l_kind_1 = v53.kind;
                    l_x_1 = v53.span.x;
                end;
                local v315 = if l_kind_0 == "identifier" then v111() else v110();
                v109(")");
                v109("{");
                local v316 = v112("}");
                v310 = v109("}").span.y;
                table.insert(v307, {
                    condition = v315, 
                    block = v316
                });
                v309 = false;
                continue;
            end;
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_40 = v53;
                local l_l_kind_1_39 = l_kind_1;
                v50 = l_v53_40;
                l_kind_0 = l_l_kind_1_39;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if l_kind_0 == "else" then
                while l_kind_1 == "\n" do
                    v53 = v49();
                    l_kind_1 = v53.kind;
                end;
                if l_kind_1 == "if" then
                    v109("else");
                    v109("if");
                    v109("(");
                    while l_kind_0 == "\n" do
                        local _ = v50;
                        local _ = l_kind_0;
                        local l_v53_41 = v53;
                        local l_l_kind_1_40 = l_kind_1;
                        v50 = l_v53_41;
                        l_kind_0 = l_l_kind_1_40;
                        l_x_0 = l_x_1;
                        v53 = v49();
                        l_kind_1 = v53.kind;
                        l_x_1 = v53.span.x;
                    end;
                    local v325 = if l_kind_0 == "identifier" then v111() else v110();
                    v109(")");
                    v109("{");
                    local v326 = v112("}");
                    v310 = v109("}").span.y;
                    table.insert(v307, {
                        condition = v325, 
                        block = v326
                    });
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_42 = v53;
            local l_l_kind_1_41 = l_kind_1;
            v50 = l_v53_42;
            l_kind_0 = l_l_kind_1_41;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        if l_kind_0 == "else" then
            v109("else");
            v109("{");
            v308 = v112("}");
            v310 = v109("}").span.y;
        end;
        return {
            kind = "if", 
            ifs = v307, 
            fallback = v308, 
            span = vector.create(l_x_5, v310, 0)
        };
    end;
    v121 = function() --[[ Line: 782 ]] --[[ Name: parse_while ]]
        -- upvalues: v109 (copy), l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v111 (ref), v110 (ref), v112 (ref)
        local l_x_6 = v109("while").span.x;
        v109("(");
        while l_kind_0 == "\n" do
            local _ = v50;
            local _ = l_kind_0;
            local l_v53_43 = v53;
            local l_l_kind_1_42 = l_kind_1;
            v50 = l_v53_43;
            l_kind_0 = l_l_kind_1_42;
            l_x_0 = l_x_1;
            v53 = v49();
            l_kind_1 = v53.kind;
            l_x_1 = v53.span.x;
        end;
        local v336 = if l_kind_0 == "identifier" then v111() else v110();
        v109(")");
        v109("{");
        local v337 = v112("}");
        local l_y_2 = v109("}").span.y;
        return {
            kind = "while", 
            expression = v336, 
            block = v337, 
            span = vector.create(l_x_6, l_y_2, 0)
        };
    end;
    v122 = function() --[[ Line: 803 ]] --[[ Name: parse_for ]]
        -- upvalues: v109 (copy), v114 (ref), v119 (ref)
        local l_x_7 = v109("for").span.x;
        v109("(");
        local v340 = v114();
        v109(")");
        local v341 = v119();
        return {
            kind = "for", 
            expression = v340, 
            call = v341, 
            span = vector.create(l_x_7, v341.span.y, 0)
        };
    end;
    v123 = function() --[[ Line: 818 ]] --[[ Name: parse_return ]]
        -- upvalues: v109 (copy), l_kind_0 (ref), v110 (ref)
        local l_span_0 = v109("return").span;
        local l_x_8 = l_span_0.x;
        local l_y_3 = l_span_0.y;
        local v345 = {};
        while l_kind_0 ~= "}" and l_kind_0 ~= "eof" do
            if #v345 > 0 then
                v109(",");
            end;
            local v346 = v110();
            table.insert(v345, v346);
            l_y_3 = v346.span.y;
        end;
        return {
            kind = "return", 
            values = v345, 
            span = vector.create(l_x_8, l_y_3, 0)
        };
    end;
    v112 = function(v347, v348) --[[ Line: 839 ]] --[[ Name: parse_block ]]
        -- upvalues: l_kind_0 (ref), v50 (ref), v53 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v49 (copy), v109 (copy), v114 (ref), v120 (ref), v121 (ref), v122 (ref), v123 (ref), v111 (ref), v4 (copy), v3 (ref), v7 (ref)
        local v349 = false;
        local v350 = {};
        local v351 = nil;
        local v352 = v348 or 0;
        local l_v352_0 = v352;
        while l_kind_0 ~= v347 do
            if v351 then
                local v354 = {
                    message = "expected to finish after last statement", 
                    span = v50.span
                };
                error(("%* from %* to %*"):format(v354.message, v354.span.x, v354.span.y), 0);
            end;
            while l_kind_0 == "\n" do
                local _ = v50;
                local _ = l_kind_0;
                local l_v53_44 = v53;
                local l_l_kind_1_43 = l_kind_1;
                v50 = l_v53_44;
                l_kind_0 = l_l_kind_1_43;
                l_x_0 = l_x_1;
                v53 = v49();
                l_kind_1 = v53.kind;
                l_x_1 = v53.span.x;
            end;
            if l_kind_0 == "identifier" then
                while l_kind_1 == "\n" do
                    v53 = v49();
                    l_kind_1 = v53.kind;
                end;
                if l_kind_1 == "=" then
                    local v359 = v109("identifier");
                    v109("=");
                    local v360 = v114();
                    table.insert(v350, {
                        kind = "assign", 
                        left = v359, 
                        right = v360
                    });
                    v349 = true;
                end;
            end;
            if not v349 then
                while l_kind_0 == "\n" do
                    local _ = v50;
                    local _ = l_kind_0;
                    local l_v53_45 = v53;
                    local l_l_kind_1_44 = l_kind_1;
                    v50 = l_v53_45;
                    l_kind_0 = l_l_kind_1_44;
                    l_x_0 = l_x_1;
                    v53 = v49();
                    l_kind_1 = v53.kind;
                    l_x_1 = v53.span.x;
                end;
                if l_kind_0 == "if" then
                    table.insert(v350, v120());
                else
                    while l_kind_0 == "\n" do
                        local _ = v50;
                        local _ = l_kind_0;
                        local l_v53_46 = v53;
                        local l_l_kind_1_45 = l_kind_1;
                        v50 = l_v53_46;
                        l_kind_0 = l_l_kind_1_45;
                        l_x_0 = l_x_1;
                        v53 = v49();
                        l_kind_1 = v53.kind;
                        l_x_1 = v53.span.x;
                    end;
                    if l_kind_0 == "while" then
                        table.insert(v350, v121());
                    else
                        while l_kind_0 == "\n" do
                            local _ = v50;
                            local _ = l_kind_0;
                            local l_v53_47 = v53;
                            local l_l_kind_1_46 = l_kind_1;
                            v50 = l_v53_47;
                            l_kind_0 = l_l_kind_1_46;
                            l_x_0 = l_x_1;
                            v53 = v49();
                            l_kind_1 = v53.kind;
                            l_x_1 = v53.span.x;
                        end;
                        if l_kind_0 == "for" then
                            table.insert(v350, v122());
                        else
                            while l_kind_0 == "\n" do
                                local _ = v50;
                                local _ = l_kind_0;
                                local l_v53_48 = v53;
                                local l_l_kind_1_47 = l_kind_1;
                                v50 = l_v53_48;
                                l_kind_0 = l_l_kind_1_47;
                                l_x_0 = l_x_1;
                                v53 = v49();
                                l_kind_1 = v53.kind;
                                l_x_1 = v53.span.x;
                            end;
                            if l_kind_0 == "return" then
                                v351 = v123();
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v50;
                                    local _ = l_kind_0;
                                    local l_v53_49 = v53;
                                    local l_l_kind_1_48 = l_kind_1;
                                    v50 = l_v53_49;
                                    l_kind_0 = l_l_kind_1_48;
                                    l_x_0 = l_x_1;
                                    v53 = v49();
                                    l_kind_1 = v53.kind;
                                    l_x_1 = v53.span.x;
                                end;
                                if l_kind_0 == "break" then
                                    local l_span_1 = v109("break").span;
                                    v351 = {
                                        kind = "break", 
                                        span = l_span_1
                                    };
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v50;
                                        local _ = l_kind_0;
                                        local l_v53_50 = v53;
                                        local l_l_kind_1_49 = l_kind_1;
                                        v50 = l_v53_50;
                                        l_kind_0 = l_l_kind_1_49;
                                        l_x_0 = l_x_1;
                                        v53 = v49();
                                        l_kind_1 = v53.kind;
                                        l_x_1 = v53.span.x;
                                    end;
                                    if l_kind_0 == "continue" then
                                        local v386 = v109("continue");
                                        v351 = {
                                            kind = "continue", 
                                            span = v386
                                        };
                                    else
                                        while l_kind_0 == "\n" do
                                            local _ = v50;
                                            local _ = l_kind_0;
                                            local l_v53_51 = v53;
                                            local l_l_kind_1_50 = l_kind_1;
                                            v50 = l_v53_51;
                                            l_kind_0 = l_l_kind_1_50;
                                            l_x_0 = l_x_1;
                                            v53 = v49();
                                            l_kind_1 = v53.kind;
                                            l_x_1 = v53.span.x;
                                        end;
                                        if not (l_kind_0 == "identifier") then
                                            while l_kind_0 == "\n" do
                                                local _ = v50;
                                                local _ = l_kind_0;
                                                local l_v53_52 = v53;
                                                local l_l_kind_1_51 = l_kind_1;
                                                v50 = l_v53_52;
                                                l_kind_0 = l_l_kind_1_51;
                                                l_x_0 = l_x_1;
                                                v53 = v49();
                                                l_kind_1 = v53.kind;
                                                l_x_1 = v53.span.x;
                                            end;
                                            if l_kind_0 ~= "$" then
                                                while l_kind_0 == "\n" do
                                                    local _ = v50;
                                                    local _ = l_kind_0;
                                                    local l_v53_53 = v53;
                                                    local l_l_kind_1_52 = l_kind_1;
                                                    v50 = l_v53_53;
                                                    l_kind_0 = l_l_kind_1_52;
                                                    l_x_0 = l_x_1;
                                                    v53 = v49();
                                                    l_kind_1 = v53.kind;
                                                    l_x_1 = v53.span.x;
                                                end;
                                                if l_kind_0 == ";" then
                                                    local _ = v50;
                                                    local _ = l_kind_0;
                                                    local l_v53_54 = v53;
                                                    local l_l_kind_1_53 = l_kind_1;
                                                    v50 = l_v53_54;
                                                    l_kind_0 = l_l_kind_1_53;
                                                    l_x_0 = l_x_1;
                                                    v53 = v49();
                                                    l_kind_1 = v53.kind;
                                                    l_x_1 = v53.span.x;
                                                    v349 = true;
                                                elseif l_kind_0 == "eof" and v347 ~= "eof" and v4 then
                                                    if v4 then
                                                        local v403 = coroutine.yield();
                                                        assert(typeof(v403) == "buffer");
                                                        v3 = v403;
                                                        v7 = buffer.len(v403);
                                                        v50 = v49();
                                                        l_kind_0 = v50.kind;
                                                        v53 = v49();
                                                        l_kind_1 = v53.kind;
                                                        v349 = true;
                                                    else
                                                        v349 = true;
                                                    end;
                                                elseif l_kind_0 == v347 then
                                                    l_v352_0 = l_x_0;
                                                    break;
                                                else
                                                    local v404 = {
                                                        message = ("cannot parse %*"):format(l_kind_0), 
                                                        span = v50.span
                                                    };
                                                    error(("%* from %* to %*"):format(v404.message, v404.span.x, v404.span.y), 0);
                                                    v349 = true;
                                                end;
                                            end;
                                        end;
                                        if not v349 then
                                            if not v349 then
                                                if not v349 then
                                                    if not v349 then
                                                        table.insert(v350, v111());
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v349 = false;
            l_v352_0 = l_x_0;
        end;
        return {
            span = vector.create(v352, l_v352_0, 0), 
            body = v350, 
            last_statement = v351
        };
    end;
    return v112("eof");
end;
return function(v406, v407) --[[ Line: 923 ]] --[[ Name: generate ]]
    -- upvalues: v405 (copy)
    local l_v406_0 = v406;
    local v409 = coroutine.create(v405);
    local v410 = nil;
    local function v413(v411) --[[ Line: 928 ]] --[[ Name: append ]]
        -- upvalues: l_v406_0 (ref), v410 (ref), v409 (copy), v407 (copy)
        l_v406_0 = l_v406_0 .. v411;
        local v412 = buffer.fromstring(l_v406_0);
        return v410(coroutine.resume(v409, v412, v407));
    end;
    local function v416(v414) --[[ Line: 934 ]] --[[ Name: overwrite ]]
        -- upvalues: l_v406_0 (ref), v410 (ref), v409 (copy), v407 (copy)
        l_v406_0 = v414;
        local v415 = buffer.fromstring(v414);
        return v410(coroutine.resume(v409, v415, v407));
    end;
    v410 = function(v417, v418) --[[ Line: 940 ]] --[[ Name: get_result ]]
        -- upvalues: v409 (copy), l_v406_0 (ref), v413 (copy), v416 (copy)
        if coroutine.status(v409) == "suspended" then
            return {
                status = "pending", 
                src = l_v406_0, 
                append = v413, 
                set = v416
            };
        elseif v417 == false then
            return {
                status = "error", 
                src = l_v406_0, 
                why = v418
            };
        elseif coroutine.status(v409) == "dead" then
            return {
                status = "finished", 
                src = l_v406_0, 
                value = v418
            };
        else
            error("?");
            return;
        end;
    end;
    return v416(v406);
end;