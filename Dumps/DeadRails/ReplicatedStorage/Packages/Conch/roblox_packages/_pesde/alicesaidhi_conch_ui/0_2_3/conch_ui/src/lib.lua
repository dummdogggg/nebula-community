--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.lib
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local v2 = require("./app");
local v3 = require("../roblox_packages/conch");
local v4 = require("./state");
local v5 = require("../roblox_packages/vide");
local v6 = false;
local l_opened_0 = v4.opened;
local l_focused_0 = v4.focused;
local function v9() --[[ Line: 12 ]] --[[ Name: mount ]]
    -- upvalues: v6 (ref), v5 (copy), v2 (copy), l_Players_0 (copy)
    if v6 then
        return;
    else
        v6 = true;
        return v5.mount(v2, l_Players_0.LocalPlayer:WaitForChild("PlayerGui"));
    end;
end;
local function v14(v10) --[[ Line: 18 ]] --[[ Name: bind_to ]]
    -- upvalues: v6 (ref), v5 (copy), v2 (copy), l_Players_0 (copy), l_ContextActionService_0 (copy), l_opened_0 (copy), l_focused_0 (copy)
    if not v6 then
        v6 = true;
        local _ = v5.mount(v2, l_Players_0.LocalPlayer:WaitForChild("PlayerGui"));
    end;
    l_ContextActionService_0:BindAction("Trigger Conch", function(_, v13) --[[ Line: 20 ]]
        -- upvalues: l_opened_0 (ref), l_focused_0 (ref)
        if v13 == Enum.UserInputState.Begin then
            l_opened_0(not l_opened_0());
            l_focused_0(l_opened_0());
        end;
    end, false, v10);
end;
return {
    app = v2, 
    mount = v9, 
    opened = l_opened_0, 
    bind_to = v14, 
    conch = v3
};