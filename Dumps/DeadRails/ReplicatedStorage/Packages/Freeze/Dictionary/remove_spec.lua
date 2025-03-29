--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.remove.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:32
-- Luau version 6, Types version 3
-- Time taken: 0.001042 seconds

local module_upvr = require(script.Parent:FindFirstChild("remove"))
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("remove 1", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, 'a')).toEqual({
			b = 2;
			c = 3;
		})
	end)
	it("remove 2", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, 'a', 'b')).toEqual({
			c = 3;
		})
	end)
	it("remove missing key, same id", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		local module_upvr_result1 = module_upvr(tbl_upvr, 'z')
		expect(module_upvr_result1).toBe(module_upvr_result1)
	end)
end