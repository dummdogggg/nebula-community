--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.flags
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:13
-- Luau version 6, Types version 3
-- Time taken: 0.000648 seconds

local function _() -- Line 1, Named "inline_test"
	return debug.info(1, 'n')
end
local var1
if debug.info(1, 'n') == "inline_test" then
	var1 = false
else
	var1 = true
end
return {
	strict = not var1;
	batch = false;
}