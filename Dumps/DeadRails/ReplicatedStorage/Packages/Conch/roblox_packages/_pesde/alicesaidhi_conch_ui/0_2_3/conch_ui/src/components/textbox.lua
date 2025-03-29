--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.textbox
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:29
-- Luau version 6, Types version 3
-- Time taken: 0.001655 seconds

local ._____roblox_packages_vide = require("../../roblox_packages/vide")
local source_upvr = ._____roblox_packages_vide.source
local create_upvr = ._____roblox_packages_vide.create
local read_upvr = ._____roblox_packages_vide.read
local .__theme_upvr = require("../theme")
local changed_upvr = ._____roblox_packages_vide.changed
local effect_upvr = ._____roblox_packages_vide.effect
return function(arg1) -- Line 30
	--[[ Upvalues[6]:
		[1]: source_upvr (readonly)
		[2]: create_upvr (readonly)
		[3]: read_upvr (readonly)
		[4]: .__theme_upvr (readonly)
		[5]: changed_upvr (readonly)
		[6]: effect_upvr (readonly)
	]]
	local source_upvr_result1_upvr = source_upvr("")
	local tbl = {
		Size = function() -- Line 33, Named "Size"
			--[[ Upvalues[2]:
				[1]: read_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			return UDim2.fromOffset(read_upvr(arg1.width) or 0, read_upvr(arg1.height) or 0)
		end;
		AutomaticSize = Enum.AutomaticSize.XY;
		Text = arg1.text;
		PlaceholderText = arg1.placeholder;
		TextSize = arg1.text_size or 16;
		TextColor3 = .__theme_upvr.text;
		TextXAlignment = arg1.xalignment;
		MultiLine = arg1.multiline;
		FontFace = .__theme_upvr.font;
		BackgroundTransparency = 1;
	}
	local var13
	if arg1.update_text then
		var13 = changed_upvr("Text", arg1.update_text)
	else
		var13 = nil
	end
	tbl[1] = var13
	tbl[2] = changed_upvr("Text", source_upvr_result1_upvr)
	function tbl.Focused() -- Line 54
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if not arg1.update_focused then
		else
			arg1.update_focused(true)
		end
	end
	function tbl.FocusLost(arg1_2) -- Line 59
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: source_upvr_result1_upvr (readonly)
		]]
		if arg1.update_focused then
			arg1.update_focused(false)
		end
		if not arg1_2 then
		else
			if not arg1.focused then return end
			arg1.enter(source_upvr_result1_upvr())
		end
	end
	var13 = unpack(arg1)
	tbl[3] = var13
	local var12_upvr = create_upvr("TextBox")(tbl)
	function var13() -- Line 69
		--[[ Upvalues[3]:
			[1]: read_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: var12_upvr (readonly)
		]]
		local read_upvr_result1_upvr = read_upvr(arg1.focused)
		if var12_upvr:IsFocused() == read_upvr_result1_upvr then
		else
			task.defer(function() -- Line 72
				--[[ Upvalues[2]:
					[1]: read_upvr_result1_upvr (readonly)
					[2]: var12_upvr (copied, readonly)
				]]
				if read_upvr_result1_upvr then
					var12_upvr:CaptureFocus()
				else
					var12_upvr:ReleaseFocus(false)
				end
			end)
		end
	end
	effect_upvr(var13)
	return var12_upvr
end