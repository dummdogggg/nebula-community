--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.keys.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:24
-- Luau version 6, Types version 3
-- Time taken: 0.000477 seconds

local keys_upvr = require(script.Parent.keys)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: keys_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
	}
	it("keys", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: keys_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(keys_upvr(tbl_upvr)).toEqual({'a'})
	end)
end