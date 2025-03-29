--[[
    Script: ReplicatedStorage.Packages.Conch.lib
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require("./roblox_packages/conch");
return (setmetatable({
    ui = require("./roblox_packages/ui")
}, {
    __index = v0
}));