--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.updateIn.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:21
-- Luau version 6, Types version 3
-- Time taken: 0.001623 seconds

local updateIn_upvr = require(script.Parent.updateIn)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: updateIn_upvr (readonly)
	]]
	local tbl_upvr = {
		persons = {
			alice = {
				age = 10;
			};
		};
	}
	it("should replace existing key", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: updateIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(updateIn_upvr(tbl_upvr, {"persons", "alice", "age"}, function(arg1) -- Line 15
			assert(arg1, "will exist")
			return arg1 + 1
		end)).toEqual({
			persons = {
				alice = {
					age = 11;
				};
			};
		})
	end)
	it("should pass nil to updater for nil key", function() -- Line 23
		--[[ Upvalues[2]:
			[1]: updateIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		local var13_upvw = false
		expect(var13_upvw).toEqual(true)
		expect(nil).toEqual(nil)
		expect(updateIn_upvr(tbl_upvr, {"persons", "alice", "age"}, function(arg1) -- Line 25
			--[[ Upvalues[1]:
				[1]: var13_upvw (read and write)
			]]
			var13_upvw = true
			return 4
		end)).toEqual({
			persons = {
				alice = {
					age = 4;
				};
			};
		})
	end)
	it("should pass notSetValue to updater for nil key", function() -- Line 35
		--[[ Upvalues[2]:
			[1]: updateIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(updateIn_upvr(tbl_upvr, {"persons", "alice", "test"}, function(arg1) -- Line 36
			assert(arg1, "exists")
			return arg1 + 1
		end, 4)).toEqual({
			persons = {
				alice = {
					age = 10;
					test = 5;
				};
			};
		})
	end)
end