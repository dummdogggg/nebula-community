--[[
    Script: ReplicatedStorage.Client.Effects.drawRayResults
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Shared_0 = game:GetService("ReplicatedStorage").Shared;
local _ = require(l_Shared_0.Utils.castRays);
local v2 = require("./bulletTrail");
local v3 = require("./bulletImpact");
return function(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: drawRayResults ]]
    -- upvalues: v2 (copy), v3 (copy)
    for _, v8 in v6 do
        v2(v5, v8.position);
        if v8.instance then
            v3(v4, v8);
        end;
    end;
end;