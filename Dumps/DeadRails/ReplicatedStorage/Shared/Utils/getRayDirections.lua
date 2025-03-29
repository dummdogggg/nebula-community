--[[
    Script: ReplicatedStorage.Shared.Utils.getRayDirections
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function(v0, v1, v2, v3) --[[ Line: 1 ]] --[[ Name: getRayDirections ]]
    local v4 = Random.new(v3 * 100000);
    local v5 = {};
    for _ = 1, v1 do
        local v7 = v4:NextNumber() * 3.141592653589793 * 2;
        local v8 = v4:NextNumber() * v2;
        table.insert(v5, (v0 * CFrame.Angles(0, 0, v7) * CFrame.Angles(v8, 0, 0)).LookVector);
    end;
    return v5;
end;