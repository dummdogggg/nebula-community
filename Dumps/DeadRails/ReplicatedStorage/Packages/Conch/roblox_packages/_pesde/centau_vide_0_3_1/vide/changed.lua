--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.changed
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:49:02
-- Luau version 6, Types version 3
-- Time taken: 0.000729 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local var1_upvr = require(script.Parent.action)()
local cleanup_upvr = require(script.Parent.cleanup)
return function(arg1, arg2) -- Line 6, Named "changed"
	--[[ Upvalues[2]:
		[1]: var1_upvr (readonly)
		[2]: cleanup_upvr (readonly)
	]]
	return var1_upvr(function(arg1_2) -- Line 7
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: cleanup_upvr (copied, readonly)
		]]
		local any_Connect_result1_upvr = arg1_2:GetPropertyChangedSignal(arg1):Connect(function() -- Line 8
			--[[ Upvalues[3]:
				[1]: arg2 (copied, readonly)
				[2]: arg1_2 (readonly)
				[3]: arg1 (copied, readonly)
			]]
			arg2(arg1_2[arg1])
		end)
		cleanup_upvr(function() -- Line 12
			--[[ Upvalues[1]:
				[1]: any_Connect_result1_upvr (readonly)
			]]
			any_Connect_result1_upvr:Disconnect()
		end)
		arg2(arg1_2[arg1])
	end)
end