--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.merge.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:06
-- Luau version 6, Types version 3
-- Time taken: 0.000874 seconds

local merge_upvr = require(script.Parent.merge)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: merge_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("merge 2", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: merge_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(merge_upvr(tbl_upvr, {
			x = 4;
			y = 5;
			z = 6;
		})).toEqual({
			a = 1;
			b = 2;
			c = 3;
			x = 4;
			y = 5;
			z = 6;
		})
	end)
	it("merge 3 with overwrite", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: merge_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(merge_upvr(tbl_upvr, {
			x = 4;
		}, {
			a = "test";
		})).toEqual({
			a = "test";
			b = 2;
			c = 3;
			x = 4;
		})
	end)
end