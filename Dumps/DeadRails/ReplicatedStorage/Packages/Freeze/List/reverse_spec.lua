--[[
    Script: ReplicatedStorage.Packages.Freeze.List.reverse.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:28
-- Luau version 6, Types version 3
-- Time taken: 0.000529 seconds

local reverse_upvr = require(script.Parent.reverse)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: reverse_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("reverse", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: reverse_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(reverse_upvr(tbl_upvr)).toEqual({'c', 'b', 'a'})
	end)
end