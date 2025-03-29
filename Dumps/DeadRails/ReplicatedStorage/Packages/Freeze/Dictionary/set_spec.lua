--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.set.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:57
-- Luau version 6, Types version 3
-- Time taken: 0.000871 seconds

local set_upvr = require(script.Parent.set)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: set_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("set existing", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: set_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(set_upvr(tbl_upvr, 'b', 4)).toEqual({
			a = 1;
			b = 4;
			c = 3;
		})
	end)
	it("set new", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: set_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(set_upvr(tbl_upvr, 'd', 4)).toEqual({
			a = 1;
			b = 2;
			c = 3;
			d = 4;
		})
	end)
	it("set no change, same id", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: set_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(set_upvr(tbl_upvr, 'a', 1)).toBe(tbl_upvr)
	end)
end