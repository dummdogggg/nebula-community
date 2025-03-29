--[[
    Script: ReplicatedStorage.Packages.Freeze.List.max.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:24
-- Luau version 6, Types version 3
-- Time taken: 0.001131 seconds

local max_upvr = require(script.Parent.max)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: max_upvr (readonly)
	]]
	local tbl_upvr = {10, 200, 30}
	it("max, default", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: max_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		local max_upvr_result1, var2_result2_2 = max_upvr(tbl_upvr)
		expect(max_upvr_result1).toEqual(200)
		expect(var2_result2_2).toEqual(2)
	end)
	it("max, object", function() -- Line 12
		--[[ Upvalues[1]:
			[1]: max_upvr (copied, readonly)
		]]
		local tbl = {
			age = 25;
		}
		expect(max_upvr({{
			age = 5;
		}, {
			age = 15;
		}, tbl}, function(arg1, arg2) -- Line 17
			local var13
			if arg2.age >= arg1.age then
				var13 = false
			else
				var13 = true
			end
			return var13
		end)).toEqual(tbl)
	end)
	it("max, empty", function() -- Line 24
		--[[ Upvalues[1]:
			[1]: max_upvr (copied, readonly)
		]]
		local max_upvr_result1_2, var2_result2 = max_upvr({})
		expect(max_upvr_result1_2).toEqual(nil)
		expect(var2_result2).toEqual(nil)
	end)
end