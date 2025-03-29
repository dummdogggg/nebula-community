--[[
    Script: StarterPlayer.StarterPlayerScripts.RealismClient.Util
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = {};
local l_RunService_0 = game:GetService("RunService");
v0.Round = function(_, v3, v4) --[[ Line: 9 ]] --[[ Name: Round ]]
    local v5 = 10 ^ (v4 or 0);
    return math.floor(v3 * v5 + 0.5) / v5;
end;
v0.RoundNearestInterval = function(_, v7, v8) --[[ Line: 14 ]] --[[ Name: RoundNearestInterval ]]
    -- upvalues: v0 (copy)
    return v0:Round(v7 / v8) * v8;
end;
v0.StepTowards = function(_, v10, v11, v12) --[[ Line: 18 ]] --[[ Name: StepTowards ]]
    if math.abs(v10 - v11) < v12 then
        return v11;
    elseif v11 < v10 then
        return v10 - v12;
    elseif v10 < v11 then
        return v10 + v12;
    else
        return;
    end;
end;
v0.PromiseChild = function(_, v14, v15, v16, ...) --[[ Line: 28 ]] --[[ Name: PromiseChild ]]
    coroutine.wrap(function(...) --[[ Line: 29 ]]
        -- upvalues: v14 (copy), v15 (copy), v16 (copy)
        local v17 = v14:WaitForChild(v15, 10);
        if v17 then
            v16(v17, ...);
        end;
    end)(...);
end;
v0.PromiseValue = function(_, v19, v20, v21, ...) --[[ Line: 40 ]] --[[ Name: PromiseValue ]]
    -- upvalues: l_RunService_0 (copy)
    local _ = {
        ...
    };
    coroutine.wrap(function(...) --[[ Line: 43 ]]
        -- upvalues: v19 (copy), v20 (copy), l_RunService_0 (ref), v21 (copy)
        local v23 = tick() + 10;
        while true do
            if not v19[v20] then
                if v23 - tick() < 0 then
                    return;
                else
                    l_RunService_0.Heartbeat:Wait();
                end;
            else
                v21(v19[v20], ...);
                return;
            end;
        end;
    end)(...);
end;
return v0;