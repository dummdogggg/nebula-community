--[[
    Script: ReplicatedStorage.Packages.Freeze.List.slice.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:20
-- Luau version 6, Types version 3
-- Time taken: 0.000953 seconds

local slice_upvr = require(script.Parent.slice)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: slice_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("no arguments", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: slice_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(slice_upvr(tbl_upvr)).toBe(tbl_upvr)
	end)
	it("positive from", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: slice_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(slice_upvr(tbl_upvr, 2)).toEqual({'b', 'c'})
	end)
	it("negative from", function() -- Line 16
		--[[ Upvalues[2]:
			[1]: slice_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(slice_upvr(tbl_upvr, -1)).toEqual({'c'})
	end)
	it("negative to", function() -- Line 21
		--[[ Upvalues[2]:
			[1]: slice_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(slice_upvr(tbl_upvr, 1, -1)).toEqual({'a', 'b'})
	end)
end