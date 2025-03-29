--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.suggestion
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:47
-- Luau version 6, Types version 3
-- Time taken: 0.004157 seconds

local ._____roblox_packages_vide = require("../../roblox_packages/vide")
local source_upvr = ._____roblox_packages_vide.source
local effect_upvr = ._____roblox_packages_vide.effect
local ._container_upvr = require("./container")
local ._flex_upvr = require("./flex")
local show_upvr = ._____roblox_packages_vide.show
local ._background_upvr = require("./background")
local ._padding_upvr = require("./padding")
local ._text_upvr = require("./text")
local indexes_upvr = ._____roblox_packages_vide.indexes
return function(arg1) -- Line 48
	--[[ Upvalues[9]:
		[1]: source_upvr (readonly)
		[2]: effect_upvr (readonly)
		[3]: ._container_upvr (readonly)
		[4]: ._flex_upvr (readonly)
		[5]: show_upvr (readonly)
		[6]: ._background_upvr (readonly)
		[7]: ._padding_upvr (readonly)
		[8]: ._text_upvr (readonly)
		[9]: indexes_upvr (readonly)
	]]
	local source_upvr_result1_upvr = source_upvr(arg1.selected())
	effect_upvr(function() -- Line 51
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: source_upvr_result1_upvr (readonly)
		]]
		local any_selected_result1 = arg1.selected()
		local source_upvr_result1_upvr_result1 = source_upvr_result1_upvr()
		local var16 = source_upvr_result1_upvr() + 10 - 1
		if var16 < any_selected_result1 then
			source_upvr_result1_upvr((source_upvr_result1_upvr()) + (any_selected_result1 - var16))
		elseif any_selected_result1 < source_upvr_result1_upvr_result1 then
			source_upvr_result1_upvr((source_upvr_result1_upvr()) + (any_selected_result1 - source_upvr_result1_upvr_result1))
		end
	end)
	return ._container_upvr({
		x = arg1.x;
		y = arg1.y;
		width = 300;
		auto = 'Y';
		anchor = {0, 1};
		zindex = 10000;
		
		._flex_upvr():column():gap(4):vertical("bottom"), show_upvr(arg1.analyzing, function() -- Line 76
			--[[ Upvalues[5]:
				[1]: arg1 (readonly)
				[2]: ._background_upvr (copied, readonly)
				[3]: ._flex_upvr (copied, readonly)
				[4]: ._padding_upvr (copied, readonly)
				[5]: ._text_upvr (copied, readonly)
			]]
			local function _() -- Line 77
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				if not arg1.analyzing() then
				end
				return {
					kind = "";
					name = "";
					description = "";
				}
			end
			local module = {
				width = 300;
				layout = 10;
				auto = Enum.AutomaticSize.Y;
			}
			local tbl_3 = {
				height = 24;
				width = 300;
			}
			local tbl_2 = {}
			local function text() -- Line 98
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				if not arg1.analyzing() then
				end
				if ({
					kind = "";
					name = "";
					description = "";
				}).kind == "variadic" then
					return "..."
				end
				if not arg1.analyzing() then
				end
				return ({
					kind = "";
					name = "";
					description = "";
				}).name or ""
			end
			tbl_2.text = text
			tbl_2.text_size = 20
			tbl_2.weight = Enum.FontWeight.Bold
			local tbl = {}
			local function text() -- Line 108
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				if not arg1.analyzing() then
				end
				return ({
					kind = "";
					name = "";
					description = "";
				}).type or ""
			end
			tbl.text = text
			tbl.text_size = 18
			tbl.weight = Enum.FontWeight.Light
			tbl_3[1] = ._flex_upvr():column():between("horizontal"):vertical("center")
			tbl_3[2] = ._padding_upvr({
				x = 4;
			})
			tbl_3[3] = ._text_upvr(tbl_2)
			tbl_3[4] = ._text_upvr(tbl)
			local tbl_4 = {
				width = 300;
				wrapped = true;
				text_size = 16;
				xalignment = Enum.TextXAlignment.Left;
				._padding_upvr({
					padding = 4;
				})
			}
			local function text() -- Line 120
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				if not arg1.analyzing() then
				end
				return ({
					kind = "";
					name = "";
					description = "";
				}).description or ""
			end
			tbl_4.text = text
			module[1] = {
				BackgroundTransparency = 0;
			}
			module[2] = ._flex_upvr()
			module[3] = ._background_upvr(tbl_3)
			module[4] = ._text_upvr(tbl_4)
			return ._background_upvr(module)
		end), show_upvr(function() -- Line 125
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			local var35
			if arg1.suggestions()[1] == nil then
				var35 = false
			else
				var35 = true
			end
			return var35
		end, function() -- Line 125
			--[[ Upvalues[7]:
				[1]: ._background_upvr (copied, readonly)
				[2]: ._flex_upvr (copied, readonly)
				[3]: indexes_upvr (copied, readonly)
				[4]: arg1 (readonly)
				[5]: source_upvr_result1_upvr (readonly)
				[6]: ._text_upvr (copied, readonly)
				[7]: ._padding_upvr (copied, readonly)
			]]
			return ._background_upvr({
				ys = 1;
				width = 200;
				height = 0;
				anchor = {0, 1};
				auto = Enum.AutomaticSize.Y;
				
				{
					BackgroundTransparency = 0;
				}, ._flex_upvr():vertical("bottom"), indexes_upvr(function() -- Line 138
					--[[ Upvalues[2]:
						[1]: arg1 (copied, readonly)
						[2]: source_upvr_result1_upvr (copied, readonly)
					]]
					local any_suggestions_result1 = arg1.suggestions()
					table.sort(any_suggestions_result1, function(arg1_2, arg2) -- Line 143
						local var45
						if arg1_2.name >= arg2.name then
							var45 = false
						else
							var45 = true
						end
						return var45
					end)
					local module_3 = {}
					for i = source_upvr_result1_upvr(), source_upvr_result1_upvr() + 10 - 1 do
						module_3[i - source_upvr_result1_upvr() + 1] = any_suggestions_result1[i]
					end
					return module_3
				end, function(arg1_3, arg2) -- Line 152
					--[[ Upvalues[4]:
						[1]: ._text_upvr (copied, readonly)
						[2]: arg1 (copied, readonly)
						[3]: source_upvr_result1_upvr (copied, readonly)
						[4]: ._padding_upvr (copied, readonly)
					]]
					local module_2 = {
						width = 200;
						height = 20;
					}
					module_2.order = arg2
					module_2.text_size = 16
					module_2.xalignment = Enum.TextXAlignment.Left
					function module_2.text() -- Line 160
						--[[ Upvalues[1]:
							[1]: arg1_3 (readonly)
						]]
						return arg1_3().name
					end
					function module_2.text_style() -- Line 161
						--[[ Upvalues[3]:
							[1]: arg2 (readonly)
							[2]: arg1 (copied, readonly)
							[3]: source_upvr_result1_upvr (copied, readonly)
						]]
						if arg2 == arg1.selected() - source_upvr_result1_upvr() + 1 then
							return "info"
						end
						return "normal"
					end
					module_2[1] = ._padding_upvr({
						left = 4;
					})
					return ._text_upvr(module_2)
				end)
			})
		end)
	})
end