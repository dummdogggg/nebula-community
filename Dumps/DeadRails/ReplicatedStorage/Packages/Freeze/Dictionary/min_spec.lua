--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.min.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:15
-- Luau version 6, Types version 3
-- Time taken: 0.001157 seconds

local min_upvr = require(script.Parent.min)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: min_upvr (readonly)
	]]
	local tbl_2_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("default comparator", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: min_upvr (copied, readonly)
			[2]: tbl_2_upvr (readonly)
		]]
		local min_upvr_result1, min_upvr_result2 = min_upvr(tbl_2_upvr)
		expect(min_upvr_result2).toEqual('a')
		expect(min_upvr_result1).toEqual(1)
	end)
	it("min, object", function() -- Line 12
		--[[ Upvalues[1]:
			[1]: min_upvr (copied, readonly)
		]]
		local tbl = {
			age = 5;
		}
		local min_upvr_result1_2, var2_result2 = min_upvr({
			alice = tbl;
			bertram = {
				age = 15;
			};
			charlie = {
				age = 25;
			};
		}, function(arg1, arg2) -- Line 19
			local var13
			if arg2.age >= arg1.age then
				var13 = false
			else
				var13 = true
			end
			return var13
		end)
		expect(var2_result2).toEqual("alice")
		expect(min_upvr_result1_2).toEqual(tbl)
	end)
	it("min, empty", function() -- Line 27
		--[[ Upvalues[1]:
			[1]: min_upvr (copied, readonly)
		]]
		local min_upvr_result1_3, min_upvr_result2_2 = min_upvr({})
		expect(min_upvr_result1_3).toEqual(nil)
		expect(min_upvr_result2_2).toEqual(nil)
	end)
end