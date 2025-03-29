--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.equals.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:45
-- Luau version 6, Types version 3
-- Time taken: 0.000907 seconds

local equals_upvr = require(script.Parent.equals)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: equals_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("match reference", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: equals_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(equals_upvr(tbl_upvr, tbl_upvr)).toEqual(true)
	end)
	it("match value", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: equals_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(equals_upvr(tbl_upvr, {
			a = 1;
			b = 2;
			c = 3;
		})).toEqual(true)
	end)
	it("empty", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: equals_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(equals_upvr(tbl_upvr, {})).toEqual(false)
	end)
	it("no match", function() -- Line 18
		--[[ Upvalues[2]:
			[1]: equals_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(equals_upvr(tbl_upvr, {
			a = 1;
			b = 3;
		})).toEqual(false)
	end)
end