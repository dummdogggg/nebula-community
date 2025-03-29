--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.mount
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:13
-- Luau version 6, Types version 3
-- Time taken: 0.000618 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local root_upvr = require(script.Parent.root)
local apply_upvr = require(script.Parent.apply)
return function(arg1, arg2) -- Line 6, Named "mount"
	--[[ Upvalues[2]:
		[1]: root_upvr (readonly)
		[2]: apply_upvr (readonly)
	]]
	return root_upvr(function() -- Line 7
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: apply_upvr (copied, readonly)
		]]
		if arg2 then
			apply_upvr(arg2, {arg1()})
		end
	end)
end