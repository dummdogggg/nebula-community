--[[
    Script: ReplicatedStorage.Shared.Utils.retryAsync
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0, v1, v2, v3, v4) --[[ Line: 13 ]] --[[ Name: retryAsync ]]
    local v5 = v2 or 0;
    local v6 = v3 or 0;
    local v7 = v4 or pcall;
    local v8 = 0;
    local v9 = nil;
    local v10 = nil;
    while v8 < v1 do
        v8 = v8 + 1;
        local v11 = nil;
        v11 = {
            v7(v0)
        };
        v9 = table.remove(v11, 1);
        v10 = v11;
        if not v9 then
            local v12 = v5 + v6 ^ v8;
            if v8 < v1 then
                task.wait(v12);
            end;
        else
            break;
        end;
    end;
    if v9 then
        return v9, table.unpack(v10);
    else
        return v9, not v9 and v10[1] or nil;
    end;
end;