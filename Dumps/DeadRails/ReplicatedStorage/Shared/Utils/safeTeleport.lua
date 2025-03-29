--[[
    Script: ReplicatedStorage.Shared.Utils.safeTeleport
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_TeleportService_0 = game:GetService("TeleportService");
local function v9(v1, v2, v3) --[[ Line: 7 ]] --[[ Name: safeTeleport ]]
    -- upvalues: l_TeleportService_0 (copy)
    local v4 = 0;
    local v5 = nil;
    local v6 = nil;
    repeat
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
            -- upvalues: l_TeleportService_0 (ref), v1 (copy), v2 (copy), v3 (copy)
            return l_TeleportService_0:TeleportAsync(v1, v2, v3);
        end);
        v5 = l_status_0;
        v6 = l_result_0;
        v4 = v4 + 1;
        if not v5 then
            task.wait(1);
        end;
    until v5 or v4 == 5;
    if not v5 then
        warn(v6);
    end;
    return v5, v6;
end;
l_TeleportService_0.TeleportInitFailed:Connect(function(v10, v11, v12, v13, v14) --[[ Line: 28 ]] --[[ Name: handleFailedTeleport ]]
    -- upvalues: v9 (copy)
    if v11 == Enum.TeleportResult.Flooded then
        task.wait(15);
    elseif v11 == Enum.TeleportResult.Failure then
        task.wait(1);
    else
        error(("Invalid teleport [%s]: %s"):format(v11.Name, v12));
    end;
    v9(v13, {
        v10
    }, v14);
end);
return v9;