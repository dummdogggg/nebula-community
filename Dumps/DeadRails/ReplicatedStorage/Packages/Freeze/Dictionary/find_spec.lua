--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.find.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:46
-- Luau version 6, Types version 3
-- Time taken: 0.001178 seconds

local find_upvr = require(script.Parent.find)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: find_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("find match", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: find_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(find_upvr(tbl_upvr, function(arg1) -- Line 7
			local var6
			if arg1 % 2 ~= 0 then
				var6 = false
			else
				var6 = true
			end
			return var6
		end)).toEqual(2)
	end)
	it("find no match", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: find_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(find_upvr(tbl_upvr, function(arg1) -- Line 15
			if arg1 ~= 4 then
			else
			end
			return true
		end)).toEqual(nil)
	end)
	it("find no match, default value", function() -- Line 22
		--[[ Upvalues[2]:
			[1]: find_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(find_upvr(tbl_upvr, function(arg1) -- Line 23
			if arg1 ~= 4 then
			else
			end
			return true
		end, -100)).toEqual(-100)
	end)
end