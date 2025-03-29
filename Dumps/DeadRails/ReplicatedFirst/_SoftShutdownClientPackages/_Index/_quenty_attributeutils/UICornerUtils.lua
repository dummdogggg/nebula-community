--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.UICornerUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:29
-- Luau version 6, Types version 3
-- Time taken: 0.001655 seconds

return {
	fromScale = function(arg1, arg2) -- Line 7, Named "fromScale"
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(arg1, 0)
		UICorner.Parent = arg2
		return UICorner
	end;
	fromOffset = function(arg1, arg2) -- Line 14, Named "fromOffset"
		local UICorner_2 = Instance.new("UICorner")
		UICorner_2.CornerRadius = UDim.new(0, arg1)
		UICorner_2.Parent = arg2
		return UICorner_2
	end;
	clampPositionToFrame = function(arg1, arg2, arg3, arg4) -- Line 23, Named "clampPositionToFrame"
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
		local var4
		if 0 >= arg3 then
			var4 = false
		else
			var4 = true
		end
		assert(var4, "Bad radius")
		var4 = arg4
		assert(var4, "Bad point")
		var4 = arg4.y
		local x = arg1.x
		local y = arg1.y
		local var7 = x + arg3
		local var9 = y + arg3
		if var7 < x + arg2.x - arg3 then
			-- KONSTANTWARNING: GOTO [51] #38
		end
		-- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [50] 37. Error Block 24 start (CF ANALYSIS FAILED)
		if var9 < y + arg2.y - arg3 then
		else
		end
		local vector2 = Vector2.new(var7, var9)
		local var12 = arg4 - vector2
		if var12.magnitude == 0 then
			return nil, nil
		end
		local unit = var12.unit
		do
			return vector2 + unit * arg3, unit
		end
		-- KONSTANTERROR: [50] 37. Error Block 24 end (CF ANALYSIS FAILED)
	end;
}