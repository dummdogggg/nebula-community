--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.every.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:02
-- Luau version 6, Types version 3
-- Time taken: 0.000851 seconds

local every_upvr = require(script.Parent.every)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: every_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("match", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: every_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(every_upvr(tbl_upvr, function(arg1) -- Line 7
			local var6
			if type(arg1) ~= "number" then
				var6 = false
			else
				var6 = true
			end
			return var6
		end)).toEqual(true)
	end)
	it("no match", function() -- Line 12
		--[[ Upvalues[2]:
			[1]: every_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(every_upvr(tbl_upvr, function(arg1) -- Line 13
			return false
		end)).toEqual(false)
	end)
end