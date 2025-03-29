--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.SpringUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:41
-- Luau version 6, Types version 3
-- Time taken: 0.001990 seconds

local var1_upvr = require(script.Parent.loader).load(script)("LinearValue")
return {
	animating = function(arg1, arg2) -- Line 22, Named "animating"
		--[[ Upvalues[1]:
			[1]: var1_upvr (readonly)
		]]
		local var3 = arg2 or 0.000001
		local Target = arg1.Target
		local var5
		if type(Target) == "number" then
			local var6 = true
			if var3 >= math.abs(arg1.Position - arg1.Target) then
				if var3 >= math.abs(arg1.Velocity) then
					var6 = false
				else
					var6 = true
				end
			end
			var5 = var6
		else
			local typeof_result1 = typeof(Target)
			if typeof_result1 == "Vector3" or typeof_result1 == "Vector2" or var1_upvr.isLinear(Target) then
				local var8 = true
				if var3 >= (arg1.Position - arg1.Target).magnitude then
					if var3 >= arg1.Velocity.magnitude then
						var8 = false
					else
						var8 = true
					end
				end
				var5 = var8
			else
				error("Unknown type")
			end
		end
		if var5 then
			return true, arg1.Position
		end
		return false, Target
	end;
	getVelocityAdjustment = function(arg1, arg2, arg3) -- Line 58, Named "getVelocityAdjustment"
		assert(arg1, "Bad velocity")
		assert(arg2, "Bad dampen")
		assert(arg3, "Bad speed")
		return (arg1) * (2 * arg2 / arg3)
	end;
	toLinearIfNeeded = function(arg1) -- Line 73, Named "toLinearIfNeeded"
		--[[ Upvalues[1]:
			[1]: var1_upvr (readonly)
		]]
		if typeof(arg1) == "Color3" then
			return var1_upvr.new(Color3.new, {arg1.r, arg1.g, arg1.b})
		end
		if typeof(arg1) == "UDim2" then
			return var1_upvr.new(UDim2.new, {arg1.X.Scale, arg1.X.Offset, arg1.Y.Scale, arg1.Y.Offset})
		end
		if typeof(arg1) == "UDim" then
			return var1_upvr.new(UDim.new, {arg1.scale, arg1.offset})
		end
		return arg1
	end;
	fromLinearIfNeeded = function(arg1) -- Line 91, Named "fromLinearIfNeeded"
		--[[ Upvalues[1]:
			[1]: var1_upvr (readonly)
		]]
		if var1_upvr.isLinear(arg1) then
			return arg1:ToBaseValue()
		end
		return arg1
	end;
}