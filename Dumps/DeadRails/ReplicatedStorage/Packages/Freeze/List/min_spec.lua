--[[
    Script: ReplicatedStorage.Packages.Freeze.List.min.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:05
-- Luau version 6, Types version 3
-- Time taken: 0.001215 seconds

local min_upvr = require(script.Parent.min)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: min_upvr (readonly)
	]]
	local tbl_2_upvr = {10, -200, 30}
	it("min, default", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: min_upvr (copied, readonly)
			[2]: tbl_2_upvr (readonly)
		]]
		local min_upvr_result1, var2_result2_2 = min_upvr(tbl_2_upvr)
		expect(min_upvr_result1).toEqual(-200)
		expect(var2_result2_2).toEqual(2)
	end)
	it("min, object", function() -- Line 12
		--[[ Upvalues[1]:
			[1]: min_upvr (copied, readonly)
		]]
		local tbl = {
			age = 5;
		}
		expect(min_upvr({tbl, {
			age = 15;
		}, {
			age = 25;
		}}, function(arg1, arg2) -- Line 17
			local var13
			if arg2.age >= arg1.age then
				var13 = false
			else
				var13 = true
			end
			return var13
		end)).toEqual(tbl)
	end)
	it("min, empty", function() -- Line 24
		--[[ Upvalues[1]:
			[1]: min_upvr (copied, readonly)
		]]
		local min_upvr_result1_2, var2_result2 = min_upvr({})
		expect(min_upvr_result1_2).toEqual(nil)
		expect(var2_result2).toEqual(nil)
	end)
end