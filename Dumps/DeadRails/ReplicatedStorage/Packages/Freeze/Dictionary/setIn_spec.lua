--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.setIn.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:49
-- Luau version 6, Types version 3
-- Time taken: 0.001667 seconds

local setIn_upvr = require(script.Parent.setIn)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: setIn_upvr (readonly)
	]]
	local tbl_upvr = {
		a = {
			b = {'c'};
		};
	}
	it("setIn 1", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: setIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(setIn_upvr(tbl_upvr, {'a'}, "test")).toEqual({
			a = "test";
		})
	end)
	it("setIn 2", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: setIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(setIn_upvr(tbl_upvr, {'a', 'b'}, "test")).toEqual({
			a = {
				b = "test";
			};
		})
	end)
	it("setIn 3", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: setIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(setIn_upvr(tbl_upvr, {'a', 'b', 'c'}, "test")).toEqual({
			a = {
				b = {
					c = "test";
					'c'
				};
			};
		})
	end)
	it("setIn 4", function() -- Line 18
		--[[ Upvalues[2]:
			[1]: setIn_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(setIn_upvr(tbl_upvr, {'x', 'y', 'z'}, "test")).toEqual({
			a = {
				b = {'c'};
			};
			x = {
				y = {
					z = "test";
				};
			};
		})
	end)
	it("age", function() -- Line 22
		--[[ Upvalues[1]:
			[1]: setIn_upvr (copied, readonly)
		]]
		expect(setIn_upvr({
			persons = {
				alice = {
					age = 10;
				};
			};
		}, {"persons", "alice", "age"}, 11)).toEqual({
			persons = {
				alice = {
					age = 11;
				};
			};
		})
	end)
end