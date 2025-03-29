--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.app
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:24
-- Luau version 6, Types version 3
-- Time taken: 0.008726 seconds

local .__roblox_packages_vide_upvr = require("../roblox_packages/vide")
local ._state_upvr = require("./state")
local .__roblox_packages_conch_upvr = require("../roblox_packages/conch")
local source_upvr = .__roblox_packages_vide_upvr.source
local derive_upvr = .__roblox_packages_vide_upvr.derive
local effect_upvr = .__roblox_packages_vide_upvr.effect
local ._theme_upvr = require("./theme")
local TextService_upvr = game:GetService("TextService")
local cleanup_upvr = .__roblox_packages_vide_upvr.cleanup
local UserInputService_upvr = game:GetService("UserInputService")
local ._components_screen_upvr = require("./components/screen")
local ._components_flex_upvr = require("./components/flex")
local ._components_padding_upvr = require("./components/padding")
local show_upvr = .__roblox_packages_vide_upvr.show
local ._components_suggestion_upvr = require("./components/suggestion")
local ._components_background_upvr = require("./components/background")
local ._components_corner_upvr = require("./components/corner")
local indexes_upvr = .__roblox_packages_vide_upvr.indexes
local ._components_text_upvr = require("./components/text")
local ._components_gap_upvr = require("./components/gap")
local ._components_loading_upvr = require("./components/loading")
local ._components_textbox_upvr = require("./components/textbox")
local changed_upvr = .__roblox_packages_vide_upvr.changed
return function() -- Line 31
	--[[ Upvalues[23]:
		[1]: ._state_upvr (readonly)
		[2]: .__roblox_packages_conch_upvr (readonly)
		[3]: source_upvr (readonly)
		[4]: derive_upvr (readonly)
		[5]: effect_upvr (readonly)
		[6]: ._theme_upvr (readonly)
		[7]: TextService_upvr (readonly)
		[8]: cleanup_upvr (readonly)
		[9]: UserInputService_upvr (readonly)
		[10]: ._components_screen_upvr (readonly)
		[11]: ._components_flex_upvr (readonly)
		[12]: ._components_padding_upvr (readonly)
		[13]: show_upvr (readonly)
		[14]: .__roblox_packages_vide_upvr (readonly)
		[15]: ._components_suggestion_upvr (readonly)
		[16]: ._components_background_upvr (readonly)
		[17]: ._components_corner_upvr (readonly)
		[18]: indexes_upvr (readonly)
		[19]: ._components_text_upvr (readonly)
		[20]: ._components_gap_upvr (readonly)
		[21]: ._components_loading_upvr (readonly)
		[22]: ._components_textbox_upvr (readonly)
		[23]: changed_upvr (readonly)
	]]
	local function output(arg1) -- Line 32
		--[[ Upvalues[1]:
			[1]: ._state_upvr (copied, readonly)
		]]
		for _, v in string.split(arg1.text, '\n'), nil do
			local any_logs_result1 = ._state_upvr.logs()
			table.insert(any_logs_result1, 1, {
				kind = arg1.kind;
				text = v;
			})
			table.remove(any_logs_result1, 100)
			._state_upvr.logs(any_logs_result1)
		end
	end
	.__roblox_packages_conch_upvr.console.output = output
	for _, v_2 in string.split("Conch 0.2.x\nCopyright (c) alicesays_hallo - This project is licensed under MIT, you can view the included license with `license`", '\n') do
		output({
			kind = "normal";
			text = v_2;
		})
	end
	.__roblox_packages_conch_upvr.register("clear", {
		description = "Clears the console.";
		permissions = {};
		arguments = function() -- Line 52, Named "arguments"
		end;
		callback = function() -- Line 53, Named "callback"
			--[[ Upvalues[1]:
				[1]: ._state_upvr (copied, readonly)
			]]
			._state_upvr.logs({})
		end;
	})
	local source_upvr_result1_upvr_3 = source_upvr("")
	local source_upvr_result1_upvr_8 = source_upvr(false)
	local source_upvr_result1_upvr_4 = source_upvr(0)
	local source_upvr_result1_upvr_6 = source_upvr(Vector2.zero)
	local source_upvr_result1_upvr_2 = source_upvr()
	local var6_result1_upvr_3 = derive_upvr(function() -- Line 62
		--[[ Upvalues[2]:
			[1]: source_upvr_result1_upvr_2 (readonly)
			[2]: source_upvr_result1_upvr_3 (readonly)
		]]
		if source_upvr_result1_upvr_2() then
			return source_upvr_result1_upvr_2().src..source_upvr_result1_upvr_3()
		end
		return source_upvr_result1_upvr_3()
	end)
	local source_upvr_result1_upvr_7 = source_upvr(.__roblox_packages_conch_upvr.analyze("", 0))
	local source_upvr_result1_upvr = source_upvr(1)
	effect_upvr(function() -- Line 79
		--[[ Upvalues[2]:
			[1]: source_upvr_result1_upvr (readonly)
			[2]: source_upvr_result1_upvr_7 (readonly)
		]]
		source_upvr_result1_upvr(math.clamp(source_upvr_result1_upvr(), 1, math.max(1, #source_upvr_result1_upvr_7().suggestions)))
	end)
	local var51_upvw = false
	effect_upvr(function() -- Line 91
		--[[ Upvalues[5]:
			[1]: source_upvr_result1_upvr_3 (readonly)
			[2]: source_upvr_result1_upvr_4 (readonly)
			[3]: var51_upvw (read and write)
			[4]: source_upvr_result1_upvr_7 (readonly)
			[5]: .__roblox_packages_conch_upvr (copied, readonly)
		]]
		source_upvr_result1_upvr_3()
		source_upvr_result1_upvr_4()
		if var51_upvw then
		else
			var51_upvw = true
			task.defer(function() -- Line 96
				--[[ Upvalues[5]:
					[1]: var51_upvw (copied, read and write)
					[2]: source_upvr_result1_upvr_7 (copied, readonly)
					[3]: .__roblox_packages_conch_upvr (copied, readonly)
					[4]: source_upvr_result1_upvr_3 (copied, readonly)
					[5]: source_upvr_result1_upvr_4 (copied, readonly)
				]]
				var51_upvw = false
				source_upvr_result1_upvr_7(.__roblox_packages_conch_upvr.analyze(source_upvr_result1_upvr_3(), source_upvr_result1_upvr_4() - 1))
			end)
		end
	end)
	local var6_result1_upvr = derive_upvr(function() -- Line 103
		--[[ Upvalues[2]:
			[1]: source_upvr_result1_upvr_3 (readonly)
			[2]: source_upvr_result1_upvr_4 (readonly)
		]]
		return string.sub(source_upvr_result1_upvr_3(), 1, source_upvr_result1_upvr_4() - 1)
	end)
	local source_upvr_result1_upvr_5 = source_upvr(Vector3.new(0, 0, 0))
	local GetTextBoundsParams_upvr = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams_upvr.Font = ._theme_upvr.font()
	GetTextBoundsParams_upvr.RichText = false
	GetTextBoundsParams_upvr.Size = 20
	GetTextBoundsParams_upvr.Width = 100000
	effect_upvr(function() -- Line 114
		--[[ Upvalues[4]:
			[1]: var6_result1_upvr (readonly)
			[2]: GetTextBoundsParams_upvr (readonly)
			[3]: TextService_upvr (copied, readonly)
			[4]: source_upvr_result1_upvr_5 (readonly)
		]]
		local var6_result1_upvr_result1_upvr = var6_result1_upvr()
		GetTextBoundsParams_upvr.Text = var6_result1_upvr_result1_upvr
		task.spawn(function() -- Line 117
			--[[ Upvalues[5]:
				[1]: TextService_upvr (copied, readonly)
				[2]: GetTextBoundsParams_upvr (copied, readonly)
				[3]: var6_result1_upvr_result1_upvr (readonly)
				[4]: var6_result1_upvr (copied, readonly)
				[5]: source_upvr_result1_upvr_5 (copied, readonly)
			]]
			if var6_result1_upvr_result1_upvr ~= var6_result1_upvr() then
			else
				source_upvr_result1_upvr_5(TextService_upvr:GetTextBoundsAsync(GetTextBoundsParams_upvr))
			end
		end)
	end)
	local function _(arg1, arg2, arg3) -- Line 124, Named "autofill"
		--[[ Upvalues[1]:
			[1]: source_upvr_result1_upvr_4 (readonly)
		]]
		task.defer(source_upvr_result1_upvr_4, arg2.x + #arg3 + 2)
		return string.sub(arg1, 1, arg2.x)..arg3..' '..string.sub(arg1, arg2.y + 1, -1)
	end
	cleanup_upvr(UserInputService_upvr.InputBegan:Connect(function(arg1) -- Line 132
		--[[ Upvalues[2]:
			[1]: source_upvr_result1_upvr (readonly)
			[2]: source_upvr_result1_upvr_7 (readonly)
		]]
		if arg1.KeyCode == Enum.KeyCode.Down then
			source_upvr_result1_upvr(math.min(source_upvr_result1_upvr() + 1, #source_upvr_result1_upvr_7().suggestions))
		elseif arg1.KeyCode == Enum.KeyCode.Up then
			source_upvr_result1_upvr(math.max(1, source_upvr_result1_upvr() - 1))
		end
	end))
	local module_2 = {
		name = "Command Executor";
		display_order = 100000;
		enabled = ._state_upvr.opened;
	}
	local tbl = {
		auto = 'Y';
	}
	local var6_result1_upvr_2 = derive_upvr(function() -- Line 70
		--[[ Upvalues[2]:
			[1]: .__roblox_packages_conch_upvr (copied, readonly)
			[2]: var6_result1_upvr_3 (readonly)
		]]
		local any_parse_result1 = .__roblox_packages_conch_upvr.parse(var6_result1_upvr_3())
		if any_parse_result1.status == "error" then
			return any_parse_result1.why
		end
		return nil
	end)
	tbl[1] = ._components_flex_upvr()
	tbl[2] = ._components_corner_upvr(4)
	tbl[3] = ._components_padding_upvr({
		y = 4;
	})
	tbl[4] = indexes_upvr(function() -- Line 178
		--[[ Upvalues[2]:
			[1]: var6_result1_upvr_2 (readonly)
			[2]: source_upvr_result1_upvr_7 (readonly)
		]]
		local var70_result1 = var6_result1_upvr_2()
		local var72
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var72 = source_upvr_result1_upvr_7().logs
			return var72
		end
		if not source_upvr_result1_upvr_7() or not INLINED() then
			var72 = {}
		end
		local clone = table.clone(var72)
		if var70_result1 then
			var72 = table.insert
			var72(clone, {
				kind = "error";
				text = var70_result1;
			})
		end
		return clone
	end, function(arg1, arg2) -- Line 185
		--[[ Upvalues[2]:
			[1]: ._components_text_upvr (copied, readonly)
			[2]: ._components_padding_upvr (copied, readonly)
		]]
		local module = {
			order = 0 - arg2 + 100;
			height = 20;
		}
		local function text() -- Line 190
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return arg1().text
		end
		module.text = text
		module.text_size = 16
		local function text_style() -- Line 192
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return arg1().kind
		end
		module.text_style = text_style
		module.xalignment = Enum.TextXAlignment.Left
		module[1] = ._components_padding_upvr({
			x = 8;
		})
		return ._components_text_upvr(module)
	end)
	tbl[5] = indexes_upvr(._state_upvr.logs, function(arg1, arg2) -- Line 199
		--[[ Upvalues[2]:
			[1]: ._components_text_upvr (copied, readonly)
			[2]: ._components_padding_upvr (copied, readonly)
		]]
		return ._components_text_upvr({
			height = 20;
			order = -arg2 - 1;
			text = function() -- Line 204, Named "text"
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				return arg1().text
			end;
			text_size = 16;
			text_style = function() -- Line 206, Named "text_style"
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				return arg1().kind
			end;
			xalignment = Enum.TextXAlignment.Left;
			
			._components_padding_upvr({
				x = 8;
			})
		})
	end)
	local tbl_2 = {
		auto = Enum.AutomaticSize.Y;
	}
	local var86_upvw = false
	tbl_2[1] = ._components_corner_upvr(4)
	tbl_2[2] = show_upvr(source_upvr_result1_upvr_8, function() -- Line 222
		--[[ Upvalues[1]:
			[1]: ._components_loading_upvr (copied, readonly)
		]]
		return ._components_loading_upvr({
			height = 18;
			speed = 6;
			text_size = 18;
			xalignment = Enum.TextXAlignment.Left;
		})
	end, function() -- Line 230
		--[[ Upvalues[11]:
			[1]: ._components_textbox_upvr (copied, readonly)
			[2]: source_upvr_result1_upvr_3 (readonly)
			[3]: var86_upvw (read and write)
			[4]: source_upvr_result1_upvr_4 (readonly)
			[5]: source_upvr_result1_upvr_7 (readonly)
			[6]: source_upvr_result1_upvr (readonly)
			[7]: source_upvr_result1_upvr_2 (readonly)
			[8]: .__roblox_packages_conch_upvr (copied, readonly)
			[9]: ._state_upvr (copied, readonly)
			[10]: source_upvr_result1_upvr_8 (readonly)
			[11]: changed_upvr (copied, readonly)
		]]
		return ._components_textbox_upvr({
			text = source_upvr_result1_upvr_3;
			update_text = function(arg1) -- Line 233, Named "update_text"
				--[[ Upvalues[5]:
					[1]: var86_upvw (copied, read and write)
					[2]: source_upvr_result1_upvr_4 (copied, readonly)
					[3]: source_upvr_result1_upvr_7 (copied, readonly)
					[4]: source_upvr_result1_upvr_3 (copied, readonly)
					[5]: source_upvr_result1_upvr (copied, readonly)
				]]
				local var88
				if not var88 then
					var88 = source_upvr_result1_upvr_4()
				end
				local suggestions = source_upvr_result1_upvr_7().suggestions
				local var90
				if string.sub(arg1, var88 - 1, var88 - 1) == '\t' and suggestions[1] then
					local var38_result1 = source_upvr_result1_upvr_3()
					local replace = suggestions[source_upvr_result1_upvr()].replace
					local with = suggestions[source_upvr_result1_upvr()].with
					task.defer(source_upvr_result1_upvr_4, replace.x + #with + 2)
					var90 = string.sub(var38_result1, 1, replace.x)..with..' '..string.sub(var38_result1, replace.y + 1, -1)
				end
				source_upvr_result1_upvr_3(var90)
			end;
			placeholder = "Enter your command";
			text_size = 18;
			xalignment = Enum.TextXAlignment.Left;
			multiline = function() -- Line 253, Named "multiline"
				--[[ Upvalues[3]:
					[1]: source_upvr_result1_upvr_2 (copied, readonly)
					[2]: .__roblox_packages_conch_upvr (copied, readonly)
					[3]: source_upvr_result1_upvr_3 (copied, readonly)
				]]
				local var94
				if source_upvr_result1_upvr_2() then
					var94 = .__roblox_packages_conch_upvr
					var94 = source_upvr_result1_upvr_2().src..source_upvr_result1_upvr_3()
					if var94.parse(var94, "yield").status ~= "pending" then
						var94 = false
					else
						var94 = true
					end
					return var94
				end
				if .__roblox_packages_conch_upvr.parse(source_upvr_result1_upvr_3(), "yield").status ~= "pending" then
				else
				end
				return true
			end;
			enter = function(arg1) -- Line 266, Named "enter"
				--[[ Upvalues[5]:
					[1]: source_upvr_result1_upvr_3 (copied, readonly)
					[2]: ._state_upvr (copied, readonly)
					[3]: source_upvr_result1_upvr_2 (copied, readonly)
					[4]: .__roblox_packages_conch_upvr (copied, readonly)
					[5]: source_upvr_result1_upvr_8 (copied, readonly)
				]]
				source_upvr_result1_upvr_3("")
				._state_upvr.focused(true)
				if source_upvr_result1_upvr_2() then
					source_upvr_result1_upvr_2(source_upvr_result1_upvr_2().append(arg1))
				else
					source_upvr_result1_upvr_2(.__roblox_packages_conch_upvr.parse(arg1, true))
				end
				if source_upvr_result1_upvr_2().status ~= "pending" then
					source_upvr_result1_upvr_8(true)
					source_upvr_result1_upvr_2(nil)
					.__roblox_packages_conch_upvr.execute(arg1)
					source_upvr_result1_upvr_8(false)
				end
			end;
			focused = ._state_upvr.focused;
			update_focused = ._state_upvr.focused;
			
			{
				CursorPosition = source_upvr_result1_upvr_4;
				
				changed_upvr("CursorPosition", function(arg1) -- Line 289
					--[[ Upvalues[2]:
						[1]: var86_upvw (copied, read and write)
						[2]: source_upvr_result1_upvr_4 (copied, readonly)
					]]
					if var86_upvw then
						var86_upvw = arg1
					else
						var86_upvw = arg1
						task.defer(function() -- Line 297
							--[[ Upvalues[2]:
								[1]: source_upvr_result1_upvr_4 (copied, readonly)
								[2]: var86_upvw (copied, read and write)
							]]
							source_upvr_result1_upvr_4(var86_upvw)
							var86_upvw = false
						end)
					end
				end)
			}
		})
	end)
	tbl_2[3] = ._components_padding_upvr({
		x = 8;
		y = 8;
	})
	tbl_2[4] = ._components_flex_upvr():fill():vertical("center"):horizontal("left")
	tbl_2[5] = changed_upvr("AbsolutePosition", source_upvr_result1_upvr_6)
	module_2[1] = ._components_flex_upvr():fill("horizontal"):vertical("bottom")
	module_2[2] = ._components_padding_upvr({
		padding = 12;
	})
	module_2[3] = show_upvr(source_upvr_result1_upvr_7, function() -- Line 151
		--[[ Upvalues[7]:
			[1]: .__roblox_packages_vide_upvr (copied, readonly)
			[2]: ._components_suggestion_upvr (copied, readonly)
			[3]: var6_result1_upvr (readonly)
			[4]: source_upvr_result1_upvr_5 (readonly)
			[5]: source_upvr_result1_upvr_6 (readonly)
			[6]: source_upvr_result1_upvr (readonly)
			[7]: source_upvr_result1_upvr_7 (readonly)
		]]
		return .__roblox_packages_vide_upvr.create("Folder")({._components_suggestion_upvr({
			x = function() -- Line 154, Named "x"
				--[[ Upvalues[1]:
					[1]: var6_result1_upvr (copied, readonly)
				]]
				local string_split_result1_2 = string.split(var6_result1_upvr(), '\n')
				return #string_split_result1_2[#string_split_result1_2] * 10 + 10
			end;
			y = function() -- Line 158, Named "y"
				--[[ Upvalues[2]:
					[1]: source_upvr_result1_upvr_5 (copied, readonly)
					[2]: source_upvr_result1_upvr_6 (copied, readonly)
				]]
				return source_upvr_result1_upvr_5().Y + source_upvr_result1_upvr_6().Y - 20
			end;
			selected = source_upvr_result1_upvr;
			analyzing = function() -- Line 165, Named "analyzing"
				--[[ Upvalues[1]:
					[1]: source_upvr_result1_upvr_7 (copied, readonly)
				]]
				return source_upvr_result1_upvr_7().analyzing
			end;
			suggestions = function() -- Line 166, Named "suggestions"
				--[[ Upvalues[1]:
					[1]: source_upvr_result1_upvr_7 (copied, readonly)
				]]
				return source_upvr_result1_upvr_7().suggestions
			end;
		})})
	end)
	module_2[4] = ._components_background_upvr(tbl)
	module_2[5] = ._components_gap_upvr({
		height = 4;
	})
	module_2[6] = ._components_background_upvr(tbl_2)
	return ._components_screen_upvr(module_2)
end