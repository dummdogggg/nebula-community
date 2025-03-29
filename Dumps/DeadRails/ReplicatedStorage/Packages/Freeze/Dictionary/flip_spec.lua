--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.flip.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:40
-- Luau version 6, Types version 3
-- Time taken: 0.000553 seconds

local flip_upvr = require(script.Parent.flip)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: flip_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 'A';
		b = 'B';
		c = 'C';
	}
	it("flip match", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: flip_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(flip_upvr(tbl_upvr)).toEqual({
			A = 'a';
			B = 'b';
			C = 'c';
		})
	end)
end