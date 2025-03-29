--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.flatten.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:41
-- Luau version 6, Types version 3
-- Time taken: 0.000919 seconds

local flatten_upvr = require(script.Parent.flatten)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: flatten_upvr (readonly)
	]]
	local tbl_upvr = {
		foo = 1;
		foobar = {
			bar = 2;
			baz = {
				etc = 3;
			};
		};
	}
	it("flatten", function() -- Line 15
		--[[ Upvalues[2]:
			[1]: flatten_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(flatten_upvr(tbl_upvr)).toEqual({
			foo = 1;
			bar = 2;
			etc = 3;
		})
	end)
	it("flatten with depth", function() -- Line 21
		--[[ Upvalues[2]:
			[1]: flatten_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(flatten_upvr(tbl_upvr, 1)).toEqual({
			foo = 1;
			bar = 2;
			baz = {
				etc = 3;
			};
		})
	end)
end