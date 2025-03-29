--[[
    Script: ReplicatedStorage.Client.Handlers.ClientCommandHandler
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContextActionService");
local v2 = require(l_ReplicatedStorage_0.Packages.Conch);
local v3 = require(l_ReplicatedStorage_0.Packages.Conch.roblox_packages.ui);
return {
    start = function() --[[ Line: 9 ]] --[[ Name: start ]]
        -- upvalues: v2 (copy), v3 (copy)
        v2.initiate_default_lifecycle();
        v3.bind_to(Enum.KeyCode.F10);
    end
};