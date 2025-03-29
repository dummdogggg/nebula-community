--[[
    Script: ReplicatedStorage.Packages.Freeze.List.indexOf.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:11
-- Luau version 6, Types version 3
-- Time taken: 0.000652 seconds

local indexOf_upvr = require(script.Parent.indexOf)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: indexOf_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("exists", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: indexOf_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(indexOf_upvr(tbl_upvr, 'b')).toEqual(2)
	end)
	it("doesnt exist", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: indexOf_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(indexOf_upvr(tbl_upvr, 'd')).toEqual(nil)
	end)
end