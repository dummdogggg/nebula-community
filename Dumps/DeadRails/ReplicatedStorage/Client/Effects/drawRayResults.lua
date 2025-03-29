--[[
    Script: ReplicatedStorage.Client.Effects.drawRayResults
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:13
-- Luau version 6, Types version 3
-- Time taken: 0.000595 seconds

local ._bulletTrail_upvr = require("./bulletTrail")
local ._bulletImpact_upvr = require("./bulletImpact")
return function(arg1, arg2, arg3) -- Line 9, Named "drawRayResults"
	--[[ Upvalues[2]:
		[1]: ._bulletTrail_upvr (readonly)
		[2]: ._bulletImpact_upvr (readonly)
	]]
	for _, v in arg3 do
		._bulletTrail_upvr(arg2, v.position)
		if v.instance then
			._bulletImpact_upvr(arg1, v)
		end
	end
end