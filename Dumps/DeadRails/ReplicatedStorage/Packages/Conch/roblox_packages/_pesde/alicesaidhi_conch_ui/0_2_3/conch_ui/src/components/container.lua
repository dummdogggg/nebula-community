--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.container
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:31
-- Luau version 6, Types version 3
-- Time taken: 0.001118 seconds

local ._____roblox_packages_vide = require("../../roblox_packages/vide")
local create_upvr = ._____roblox_packages_vide.create
local read_upvr = ._____roblox_packages_vide.read
return function(arg1) -- Line 22
	--[[ Upvalues[2]:
		[1]: create_upvr (readonly)
		[2]: read_upvr (readonly)
	]]
	local module = {}
	local function Position() -- Line 24, Named "Size"
		--[[ Upvalues[2]:
			[1]: read_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return UDim2.fromOffset(read_upvr(arg1.width) or 0, read_upvr(arg1.height) or 0)
	end
	module.Size = Position
	function Position() -- Line 30
		--[[ Upvalues[2]:
			[1]: read_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return UDim2.new(read_upvr(arg1.xs) or 0, read_upvr(arg1.x) or 0, read_upvr(arg1.ys) or 0, read_upvr(arg1.y) or 0)
	end
	local var7 = Position
	module.Position = var7
	if arg1.anchor then
		function var7() -- Line 39
			--[[ Upvalues[2]:
				[1]: read_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return Vector2.new(read_upvr(arg1.anchor)[1] or 0, read_upvr(arg1.anchor)[2] or 0)
		end
	else
		var7 = nil
	end
	module.AnchorPoint = var7
	module.AutomaticSize = arg1.auto
	module.LayoutOrder = arg1.layout
	module.ZIndex = arg1.zindex
	module.BackgroundTransparency = 1
	module[1] = unpack(arg1)
	return create_upvr("Frame")(module)
end