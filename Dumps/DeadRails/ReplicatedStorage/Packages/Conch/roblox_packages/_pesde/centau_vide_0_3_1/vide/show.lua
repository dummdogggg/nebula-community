--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.show
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:17
-- Luau version 6, Types version 3
-- Time taken: 0.000545 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local switch_upvr = require(script.Parent.switch)
return function(arg1, arg2, arg3) -- Line 5, Named "show"
	--[[ Upvalues[1]:
		[1]: switch_upvr (readonly)
	]]
	local module = {}
	module[true] = arg2
	module[false] = arg3
	return switch_upvr(function() -- Line 6, Named "truthy"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return not not arg1()
	end)(module)
end