--[[
    Script: ReplicatedStorage.Packages.Freeze.List.concat.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:49
-- Luau version 6, Types version 3
-- Time taken: 0.001570 seconds

local concat_upvr = require(script.Parent.concat)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: concat_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("concat 2 values", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: concat_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(concat_upvr(tbl_upvr, {'x', 'y', 'z'})).toEqual({'a', 'b', 'c', 'x', 'y', 'z'})
	end)
	it("concat 3 values", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: concat_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(concat_upvr(tbl_upvr, {'x', 'y', 'z'}, tbl_upvr)).toEqual({'a', 'b', 'c', 'x', 'y', 'z', 'a', 'b', 'c'})
	end)
	it("concat 1 value", function() -- Line 16
		--[[ Upvalues[2]:
			[1]: concat_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(concat_upvr(tbl_upvr)).toEqual({'a', 'b', 'c'})
	end)
	it("handle nil", function() -- Line 21
		--[[ Upvalues[2]:
			[1]: concat_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(concat_upvr(tbl_upvr, nil, {'x', 'y', 'z'})).toEqual({'a', 'b', 'c', 'x', 'y', 'z'})
	end)
	it("handle empty table", function() -- Line 27
		--[[ Upvalues[2]:
			[1]: concat_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(concat_upvr(tbl_upvr, {}, {'x', 'y', 'z'})).toEqual({'a', 'b', 'c', 'x', 'y', 'z'})
	end)
	it("handle objects", function() -- Line 32
		--[[ Upvalues[1]:
			[1]: concat_upvr (copied, readonly)
		]]
		expect(concat_upvr({{
			age = 0;
		}}, {{
			age = 100;
		}})).toEqual({{
			age = 0;
		}, {
			age = 100;
		}})
	end)
end