--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.background
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:30
-- Luau version 6, Types version 3
-- Time taken: 0.001466 seconds

local ._____roblox_packages_vide = require("../../roblox_packages/vide")
local create_upvr = ._____roblox_packages_vide.create
local read_upvr = ._____roblox_packages_vide.read
local .__theme_upvr = require("../theme")
return function(arg1) -- Line 24
	--[[ Upvalues[3]:
		[1]: create_upvr (readonly)
		[2]: read_upvr (readonly)
		[3]: .__theme_upvr (readonly)
	]]
	local module = {}
	local function Position() -- Line 26, Named "Size"
		--[[ Upvalues[2]:
			[1]: read_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local read_upvr_result1 = read_upvr(arg1.width)
		local var8 = arg1
		local read_upvr_result1_2 = read_upvr(var8.height)
		local var10
		if read_upvr_result1 then
			var8 = 0
		else
			var8 = 1
		end
		if read_upvr_result1_2 then
			var10 = 0
		else
			var10 = 1
		end
		return UDim2.new(var8, read_upvr_result1 or 0, var10, read_upvr_result1_2 or 0)
	end
	module.Size = Position
	function Position() -- Line 35
		--[[ Upvalues[2]:
			[1]: read_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return UDim2.new(read_upvr(arg1.xs) or 0, read_upvr(arg1.x) or 0, read_upvr(arg1.ys) or 0, read_upvr(arg1.y) or 0)
	end
	local var12 = Position
	module.Position = var12
	if arg1.anchor then
		function var12() -- Line 44
			--[[ Upvalues[2]:
				[1]: read_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return Vector2.new(read_upvr(arg1.anchor)[1] or 0, read_upvr(arg1.anchor)[2] or 0)
		end
	else
		var12 = nil
	end
	module.AnchorPoint = var12
	module.AutomaticSize = arg1.auto
	module.LayoutOrder = arg1.layout
	local color = arg1.color
	if not color then
		color = .__theme_upvr.background
	end
	module.BackgroundColor3 = color
	module.BackgroundTransparency = .__theme_upvr.background_transparency
	module[1] = unpack(arg1)
	return create_upvr("Frame")(module)
end