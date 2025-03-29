--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.loading
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:39
-- Luau version 6, Types version 3
-- Time taken: 0.002189 seconds

local ._____roblox_packages_vide = require("../../roblox_packages/vide")
local module_upvr = {'-', '/', '|', '\\'}
local source_upvr = ._____roblox_packages_vide.source
local cleanup_upvr = ._____roblox_packages_vide.cleanup
local create_upvr = ._____roblox_packages_vide.create
local read_upvr = ._____roblox_packages_vide.read
local .__theme_upvr = require("../theme")
return function(arg1) -- Line 34
	--[[ Upvalues[6]:
		[1]: source_upvr (readonly)
		[2]: cleanup_upvr (readonly)
		[3]: create_upvr (readonly)
		[4]: read_upvr (readonly)
		[5]: module_upvr (readonly)
		[6]: .__theme_upvr (readonly)
	]]
	local source_upvr_result1_upvr = source_upvr(0)
	local task_spawn_result1_upvr = task.spawn(function() -- Line 36
		--[[ Upvalues[1]:
			[1]: source_upvr_result1_upvr (readonly)
		]]
		while true do
			source_upvr_result1_upvr(source_upvr_result1_upvr() + task.wait())
		end
	end)
	cleanup_upvr(function() -- Line 42
		--[[ Upvalues[1]:
			[1]: task_spawn_result1_upvr (readonly)
		]]
		task.cancel(task_spawn_result1_upvr)
	end)
	local module = {}
	local function Position() -- Line 45, Named "Size"
		--[[ Upvalues[2]:
			[1]: read_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return UDim2.new(0, read_upvr(arg1.width) or 0, 0, read_upvr(arg1.height) or 0)
	end
	module.Size = Position
	function Position() -- Line 49
		--[[ Upvalues[2]:
			[1]: read_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return UDim2.new(read_upvr(arg1.xs) or 0, read_upvr(arg1.x) or 0, read_upvr(arg1.ys) or 0, read_upvr(arg1.y) or 0)
	end
	local var15 = Position
	module.Position = var15
	if arg1.anchor then
		function var15() -- Line 58
			--[[ Upvalues[2]:
				[1]: read_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return Vector2.new(read_upvr(arg1.anchor)[1] or 0, read_upvr(arg1.anchor)[2] or 0)
		end
	else
		var15 = nil
	end
	module.AnchorPoint = var15
	module.AutomaticSize = arg1.auto
	module.LayoutOrder = arg1.layout
	module.BackgroundTransparency = 1
	function module.Text() -- Line 70
		--[[ Upvalues[3]:
			[1]: module_upvr (copied, readonly)
			[2]: source_upvr_result1_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		return `{module_upvr[source_upvr_result1_upvr() * arg1.speed // 1 % 4 + 1]} - {source_upvr_result1_upvr() * 100 // 1 / 100}\ts`
	end
	module.TextSize = arg1.text_size
	local color = arg1.color
	if not color then
		function color() -- Line 74
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: read_upvr (copied, readonly)
				[3]: .__theme_upvr (copied, readonly)
			]]
			local text_style = arg1.text_style
			if read_upvr(text_style) == "normal" then
				return .__theme_upvr.text()
			end
			if read_upvr(text_style) == "warn" then
				return .__theme_upvr.text_warn()
			end
			if read_upvr(text_style) == "error" then
				return .__theme_upvr.text_error()
			end
			if read_upvr(text_style) == "info" then
				return .__theme_upvr.text_info()
			end
			return .__theme_upvr.text()
		end
	end
	module.TextColor3 = color
	function module.FontFace() -- Line 83
		--[[ Upvalues[3]:
			[1]: .__theme_upvr (copied, readonly)
			[2]: read_upvr (copied, readonly)
			[3]: arg1 (readonly)
		]]
		local var7_result1 = read_upvr(arg1.weight)
		if not var7_result1 then
			var7_result1 = Enum.FontWeight.Regular
		end
		return Font.new(.__theme_upvr.font().Family, var7_result1)
	end
	module.TextWrapped = arg1.wrapped
	module.TextXAlignment = arg1.xalignment
	module.BackgroundTransparency = 1
	module[1] = unpack(arg1)
	return create_upvr("TextLabel")(module)
end