--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.stories.suggestion.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:31
-- Luau version 6, Types version 3
-- Time taken: 0.000769 seconds

local ._____roblox_packages_vide_upvr = require("../../roblox_packages/vide")
local .__state_upvr = require("../state")
local ._____roblox_packages_conch_upvr = require("../../roblox_packages/conch")
local .__components_suggestion_upvr = require("../components/suggestion")
local source_upvr = ._____roblox_packages_vide_upvr.source
return function(arg1) -- Line 9
	--[[ Upvalues[5]:
		[1]: .__state_upvr (readonly)
		[2]: ._____roblox_packages_conch_upvr (readonly)
		[3]: ._____roblox_packages_vide_upvr (readonly)
		[4]: .__components_suggestion_upvr (readonly)
		[5]: source_upvr (readonly)
	]]
	.__state_upvr.opened(true)
	._____roblox_packages_conch_upvr._.create_local_user()
	return ._____roblox_packages_vide_upvr.mount(function() -- Line 13
		--[[ Upvalues[2]:
			[1]: .__components_suggestion_upvr (copied, readonly)
			[2]: source_upvr (copied, readonly)
		]]
		return .__components_suggestion_upvr({
			highlighted_suggestion = source_upvr({
				name = "highlight";
				description = "this argument onmly takes like a vector or something and does this and that i honestly dont care.";
				type = "meow";
			});
			suggestions = source_upvr({"test", "value", "grapes", "apples"});
		})
	end, arg1)
end