--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.max.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:56
-- Luau version 6, Types version 3
-- Time taken: 0.001492 seconds

local max_upvr = require(script.Parent.max)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: max_upvr (readonly)
	]]
	local tbl_2_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("default comparator", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: max_upvr (copied, readonly)
			[2]: tbl_2_upvr (readonly)
		]]
		local max_upvr_result1, max_upvr_result2 = max_upvr(tbl_2_upvr)
		expect(max_upvr_result2).toEqual('c')
		expect(max_upvr_result1).toEqual(3)
	end)
	it("max, object", function() -- Line 12
		--[[ Upvalues[1]:
			[1]: max_upvr (copied, readonly)
		]]
		local tbl = {
			age = 25;
		}
		local max_upvr_result1_2, var2_result2 = max_upvr({
			alice = {
				age = 5;
			};
			bertram = {
				age = 15;
			};
			charlie = tbl;
		}, function(arg1, arg2) -- Line 19
			local var13
			if arg2.age >= arg1.age then
				var13 = false
			else
				var13 = true
			end
			return var13
		end)
		expect(var2_result2).toEqual("charlie")
		expect(max_upvr_result1_2).toEqual(tbl)
	end)
	it("max, empty", function() -- Line 27
		--[[ Upvalues[1]:
			[1]: max_upvr (copied, readonly)
		]]
		local max_upvr_result1_3, max_upvr_result2_2 = max_upvr({})
		expect(max_upvr_result1_3).toEqual(nil)
		expect(max_upvr_result2_2).toEqual(nil)
	end)
end