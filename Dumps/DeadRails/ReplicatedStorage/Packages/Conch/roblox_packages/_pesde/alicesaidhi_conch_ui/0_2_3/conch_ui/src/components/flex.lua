--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.components.flex
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:33
-- Luau version 6, Types version 3
-- Time taken: 0.002076 seconds

local create_upvr = require("../../roblox_packages/vide").create
return function() -- Line 5
	--[[ Upvalues[1]:
		[1]: create_upvr (readonly)
	]]
	local var3_upvr = create_upvr("UIListLayout")({})
	return setmetatable({var3_upvr}, {
		__index = {
			row = function(arg1) -- Line 10, Named "row"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				var3_upvr.FillDirection = Enum.FillDirection.Vertical
				return arg1
			end;
			column = function(arg1) -- Line 15, Named "column"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				var3_upvr.FillDirection = Enum.FillDirection.Horizontal
				return arg1
			end;
			layout = function(arg1) -- Line 20, Named "layout"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				var3_upvr.SortOrder = Enum.SortOrder.LayoutOrder
				return arg1
			end;
			name = function(arg1) -- Line 25, Named "name"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				var3_upvr.SortOrder = Enum.SortOrder.Name
				return arg1
			end;
			none = function(arg1, arg2) -- Line 30, Named "none"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				if arg2 ~= "vertical" then
					var3_upvr.HorizontalFlex = Enum.UIFlexAlignment.None
				end
				if arg2 ~= "horizontal" then
					var3_upvr.VerticalFlex = Enum.UIFlexAlignment.None
				end
				return arg1
			end;
			even = function(arg1, arg2) -- Line 40, Named "even"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				if arg2 ~= "vertical" then
					var3_upvr.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
				end
				if arg2 ~= "horizontal" then
					var3_upvr.VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly
				end
				return arg1
			end;
			around = function(arg1, arg2) -- Line 50, Named "around"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				if arg2 ~= "vertical" then
					var3_upvr.HorizontalFlex = Enum.UIFlexAlignment.SpaceAround
				end
				if arg2 ~= "horizontal" then
					var3_upvr.VerticalFlex = Enum.UIFlexAlignment.SpaceAround
				end
				return arg1
			end;
			between = function(arg1, arg2) -- Line 60, Named "between"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				if arg2 ~= "vertical" then
					var3_upvr.HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
				end
				if arg2 ~= "horizontal" then
					var3_upvr.VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
				end
				return arg1
			end;
			fill = function(arg1, arg2) -- Line 70, Named "fill"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				if arg2 ~= "vertical" then
					var3_upvr.HorizontalFlex = Enum.UIFlexAlignment.Fill
				end
				if arg2 ~= "horizontal" then
					var3_upvr.VerticalFlex = Enum.UIFlexAlignment.Fill
				end
				return arg1
			end;
			horizontal = function(arg1, arg2) -- Line 80, Named "horizontal"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				local var6
				if arg2 == "left" then
					var6 = Enum.HorizontalAlignment.Left
				elseif arg2 == "right" then
					var6 = Enum.HorizontalAlignment.Right
				else
					var6 = Enum.HorizontalAlignment.Center
				end
				var3_upvr.HorizontalAlignment = var6
				return arg1
			end;
			vertical = function(arg1, arg2) -- Line 88, Named "vertical"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 10 start (CF ANALYSIS FAILED)
				local var7
				if arg2 == "top" then
					var7 = Enum.VerticalAlignment.Top
					-- KONSTANTWARNING: GOTO [13] #9
				end
				-- KONSTANTERROR: [0] 1. Error Block 10 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [6] 5. Error Block 11 start (CF ANALYSIS FAILED)
				if arg2 == "bottom" then
					var7 = Enum.VerticalAlignment.Bottom
				else
					var7 = Enum.VerticalAlignment.Center
				end
				var3_upvr.VerticalAlignment = var7
				do
					return arg1
				end
				-- KONSTANTERROR: [6] 5. Error Block 11 end (CF ANALYSIS FAILED)
			end;
			gap = function(arg1, arg2) -- Line 96, Named "gap"
				--[[ Upvalues[1]:
					[1]: var3_upvr (readonly)
				]]
				var3_upvr.Padding = UDim.new(0, arg2)
				return arg1
			end;
		};
	})
end