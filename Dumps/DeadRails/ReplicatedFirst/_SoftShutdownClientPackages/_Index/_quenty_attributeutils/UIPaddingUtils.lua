--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.UIPaddingUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:10
-- Luau version 6, Types version 3
-- Time taken: 0.000807 seconds

local module_upvr = {
	fromUDim = function(arg1) -- Line 8, Named "fromUDim"
		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingBottom = arg1
		UIPadding.PaddingTop = arg1
		UIPadding.PaddingLeft = arg1
		UIPadding.PaddingRight = arg1
		return UIPadding
	end;
	getTotalPadding = function(arg1) -- Line 18, Named "getTotalPadding"
		return UDim2.new(arg1.PaddingLeft + arg1.PaddingRight, arg1.PaddingBottom + arg1.PaddingTop)
	end;
}
function module_upvr.getTotalAbsolutePadding(arg1, arg2) -- Line 23
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_getTotalPadding_result1 = module_upvr.getTotalPadding(arg1)
	return Vector2.new(any_getTotalPadding_result1.X.Offset + any_getTotalPadding_result1.X.Scale * arg2.x, any_getTotalPadding_result1.Y.Offset + any_getTotalPadding_result1.Y.Scale * arg2.Y)
end
function module_upvr.getHorizontalPadding(arg1) -- Line 31
	return arg1.PaddingLeft + arg1.PaddingRight
end
return module_upvr