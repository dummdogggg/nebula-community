--[[
    Script: ReplicatedStorage.Packages.Freeze.List.shift.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:08
-- Luau version 6, Types version 3
-- Time taken: 0.001021 seconds

local shift_upvr = require(script.Parent.shift)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: shift_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("shift, no args", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: shift_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(shift_upvr(tbl_upvr)).toEqual({'b', 'c'})
	end)
	it("shift, number", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: shift_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(shift_upvr(tbl_upvr, 2)).toEqual({'c'})
	end)
	it("shift, to empty", function() -- Line 16
		--[[ Upvalues[2]:
			[1]: shift_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(shift_upvr(tbl_upvr, 3)).toEqual({})
	end)
	it("shift, out of bounds", function() -- Line 21
		--[[ Upvalues[2]:
			[1]: shift_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(shift_upvr(tbl_upvr, 4)).toEqual({})
	end)
end