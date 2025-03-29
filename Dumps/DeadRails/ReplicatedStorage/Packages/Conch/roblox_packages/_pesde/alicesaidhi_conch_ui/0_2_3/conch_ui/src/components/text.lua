--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.text
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:26
-- Luau version 6, Types version 3
-- Time taken: 0.001680 seconds

local ._____roblox_packages_vide = require("../../roblox_packages/vide")
local create_upvr = ._____roblox_packages_vide.create
local read_upvr = ._____roblox_packages_vide.read
local .__theme_upvr = require("../theme")
return function(arg1) -- Line 23
	--[[ Upvalues[3]:
		[1]: create_upvr (readonly)
		[2]: read_upvr (readonly)
		[3]: .__theme_upvr (readonly)
	]]
	local module = {
		Size = function() -- Line 25, Named "Size"
			--[[ Upvalues[2]:
				[1]: read_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return UDim2.fromOffset(read_upvr(arg1.width) or 0, read_upvr(arg1.height) or 0)
		end;
	}
	local FontFace
	if arg1.width and arg1.height then
		FontFace = nil
	elseif arg1.width then
		FontFace = Enum.AutomaticSize.Y
	else
		FontFace = Enum.AutomaticSize.X
	end
	module.AutomaticSize = FontFace
	FontFace = arg1.text
	module.Text = FontFace
	FontFace = arg1.text_size
	module.TextSize = FontFace
	function FontFace() -- Line 38, Named "TextColor3"
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
	module.TextColor3 = FontFace
	function FontFace() -- Line 47
		--[[ Upvalues[3]:
			[1]: .__theme_upvr (copied, readonly)
			[2]: read_upvr (copied, readonly)
			[3]: arg1 (readonly)
		]]
		local read_upvr_result1 = read_upvr(arg1.weight)
		if not read_upvr_result1 then
			read_upvr_result1 = Enum.FontWeight.Regular
		end
		return Font.new(.__theme_upvr.font().Family, read_upvr_result1)
	end
	module.FontFace = FontFace
	FontFace = arg1.wrapped
	module.TextWrapped = FontFace
	FontFace = arg1.xalignment
	module.TextXAlignment = FontFace
	FontFace = arg1.order
	module.LayoutOrder = FontFace
	FontFace = 1
	module.BackgroundTransparency = FontFace
	FontFace = arg1
	module[1] = unpack(FontFace)
	return create_upvr("TextLabel")(module)
end