--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.gap
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:34
-- Luau version 6, Types version 3
-- Time taken: 0.000601 seconds

local ._____roblox_packages_vide = require("../../roblox_packages/vide")
local create_upvr = ._____roblox_packages_vide.create
local read_upvr = ._____roblox_packages_vide.read
return function(arg1) -- Line 14
	--[[ Upvalues[2]:
		[1]: create_upvr (readonly)
		[2]: read_upvr (readonly)
	]]
	return create_upvr("Frame")({
		Name = "gap";
		Size = function() -- Line 17, Named "Size"
			--[[ Upvalues[2]:
				[1]: read_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return UDim2.fromOffset(read_upvr(arg1.width) or 0, read_upvr(arg1.height) or 0)
		end;
		BackgroundTransparency = 1;
		
		unpack(arg1)
	})
end