--[[
    Script: ReplicatedStorage.Packages.Freeze.List.forEach.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:29
-- Luau version 6, Types version 3
-- Time taken: 0.001101 seconds

local forEach_upvr = require(script.Parent.forEach)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: forEach_upvr (readonly)
	]]
	local tbl_upvr = {1, 2, 3, 4}
	it("forEach break", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: forEach_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(forEach_upvr(tbl_upvr, function(arg1) -- Line 7
			local var6
			if arg1 >= 2 then
				var6 = false
			else
				var6 = true
			end
			return var6
		end)).toEqual(2)
	end)
	it("forEach no match", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: forEach_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(forEach_upvr(tbl_upvr, function(arg1) -- Line 15
			return false
		end)).toEqual(1)
	end)
	it("forEach all match", function() -- Line 22
		--[[ Upvalues[2]:
			[1]: forEach_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(forEach_upvr(tbl_upvr, function(arg1) -- Line 23
			return true
		end)).toEqual(4)
	end)
end