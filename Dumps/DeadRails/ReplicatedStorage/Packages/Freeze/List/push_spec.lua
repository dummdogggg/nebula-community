--[[
    Script: ReplicatedStorage.Packages.Freeze.List.push.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:04
-- Luau version 6, Types version 3
-- Time taken: 0.000832 seconds

local push_upvr = require(script.Parent.push)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: push_upvr (readonly)
	]]
	local tbl_upvr = {10, 20}
	it("push, 1", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: push_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(push_upvr(tbl_upvr, 30)).toEqual({10, 20, 30})
	end)
	it("push, 2", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: push_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(push_upvr(tbl_upvr, 30, 40)).toEqual({10, 20, 30, 40})
	end)
	it("push, 0", function() -- Line 16
		--[[ Upvalues[2]:
			[1]: push_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(push_upvr(tbl_upvr)).toBe(tbl_upvr)
	end)
end