--[[
    Script: ReplicatedStorage.Packages.t.init.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:08
-- Luau version 6, Types version 3
-- Time taken: 0.012183 seconds

return function() -- Line 1
	local Parent_upvr = require(script.Parent)
	it("should support basic types", function() -- Line 4
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		assert(Parent_upvr.any(""))
		assert(Parent_upvr.boolean(true))
		assert(Parent_upvr.none(nil))
		assert(Parent_upvr.number(1))
		assert(Parent_upvr.string("foo"))
		assert(Parent_upvr.table({}))
		assert(not Parent_upvr.any(nil))
		assert(not Parent_upvr.boolean("true"))
		assert(not Parent_upvr.none(1))
		assert(not Parent_upvr.number(true))
		assert(not Parent_upvr.string(true))
		assert(not Parent_upvr.table(82))
	end)
	it("should support special number types", function() -- Line 20
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_numberMax_result1 = Parent_upvr.numberMax(10)
		local any_numberMin_result1 = Parent_upvr.numberMin(2)
		local any_numberMaxExclusive_result1 = Parent_upvr.numberMaxExclusive(10)
		local any_numberMinExclusive_result1 = Parent_upvr.numberMinExclusive(2)
		local any_numberConstrained_result1 = Parent_upvr.numberConstrained(8, 11)
		local any_numberConstrainedExclusive_result1 = Parent_upvr.numberConstrainedExclusive(8, 11)
		assert(any_numberMax_result1(5))
		assert(any_numberMax_result1(10))
		assert(not any_numberMax_result1(11))
		assert(not any_numberMax_result1())
		assert(any_numberMin_result1(5))
		assert(any_numberMin_result1(2))
		assert(not any_numberMin_result1(1))
		assert(not any_numberMin_result1())
		assert(any_numberMaxExclusive_result1(5))
		assert(any_numberMaxExclusive_result1(9))
		assert(not any_numberMaxExclusive_result1(10))
		assert(not any_numberMaxExclusive_result1())
		assert(any_numberMinExclusive_result1(5))
		assert(any_numberMinExclusive_result1(3))
		assert(not any_numberMinExclusive_result1(2))
		assert(not any_numberMinExclusive_result1())
		assert(not any_numberConstrained_result1(7))
		assert(any_numberConstrained_result1(8))
		assert(any_numberConstrained_result1(9))
		assert(any_numberConstrained_result1(11))
		assert(not any_numberConstrained_result1(12))
		assert(not any_numberConstrained_result1())
		assert(not any_numberConstrainedExclusive_result1(7))
		assert(not any_numberConstrainedExclusive_result1(8))
		assert(any_numberConstrainedExclusive_result1(9))
		assert(not any_numberConstrainedExclusive_result1(11))
		assert(not any_numberConstrainedExclusive_result1(12))
		assert(not any_numberConstrainedExclusive_result1())
	end)
	it("should support optional types", function() -- Line 63
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_optional_result1 = Parent_upvr.optional(Parent_upvr.string)
		assert(any_optional_result1(""))
		assert(any_optional_result1())
		assert(not any_optional_result1(1))
	end)
	it("should support tuple types", function() -- Line 70
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_tuple_result1 = Parent_upvr.tuple(Parent_upvr.number, Parent_upvr.string, Parent_upvr.optional(Parent_upvr.number))
		assert(any_tuple_result1(1, '2', 3))
		assert(any_tuple_result1(1, '2'))
		assert(not any_tuple_result1(1, '2', '3'))
	end)
	it("should support union types", function() -- Line 77
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_union_result1 = Parent_upvr.union(Parent_upvr.number, Parent_upvr.string)
		assert(any_union_result1(1))
		assert(any_union_result1('1'))
		assert(not any_union_result1(nil))
	end)
	it("should support literal types", function() -- Line 84
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_literal_result1 = Parent_upvr.literal("foo")
		local any_union_result1_3 = Parent_upvr.union(Parent_upvr.literal("foo"), Parent_upvr.literal("bar"), Parent_upvr.literal("oof"))
		assert(any_literal_result1("foo"))
		assert(any_union_result1_3("foo"))
		assert(any_union_result1_3("bar"))
		assert(any_union_result1_3("oof"))
		assert(not any_literal_result1("FOO"))
		assert(not any_union_result1_3("FOO"))
		assert(not any_union_result1_3("BAR"))
		assert(not any_union_result1_3("OOF"))
	end)
	it("should support multiple literal types", function() -- Line 99
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_literal_result1_3 = Parent_upvr.literal("foo")
		local any_literal_result1_2 = Parent_upvr.literal("foo", "bar", "oof")
		assert(any_literal_result1_3("foo"))
		assert(any_literal_result1_2("foo"))
		assert(any_literal_result1_2("bar"))
		assert(any_literal_result1_2("oof"))
		assert(not any_literal_result1_3("FOO"))
		assert(not any_literal_result1_2("FOO"))
		assert(not any_literal_result1_2("BAR"))
		assert(not any_literal_result1_2("OOF"))
	end)
	it("should support intersection types", function() -- Line 114
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_intersection_result1 = Parent_upvr.intersection(Parent_upvr.integer, Parent_upvr.numberMax(5000))
		assert(any_intersection_result1(1))
		assert(not any_intersection_result1(5001))
		assert(not any_intersection_result1(1.1))
		assert(not any_intersection_result1('1'))
	end)
	describe("array", function() -- Line 122
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		it("should support array types", function() -- Line 123
			--[[ Upvalues[1]:
				[1]: Parent_upvr (copied, readonly)
			]]
			local any_array_result1_2 = Parent_upvr.array(Parent_upvr.string)
			local any_array_result1 = Parent_upvr.array(Parent_upvr.any)
			assert(not any_array_result1("foo"))
			assert(any_array_result1({1, '2', 3}))
			assert(not any_array_result1_2({1, '2', 3}))
			assert(not any_array_result1_2())
			assert(not Parent_upvr.values(Parent_upvr.string)())
			assert(any_array_result1({'1', '2', '3'}, Parent_upvr.string))
			assert(not any_array_result1({
				foo = "bar";
			}))
			assert(not any_array_result1({"non", -- : First try: runluau:11745: attempt to index nil with 't'
))
		end)
		it("should not be fooled by sparse arrays", function() -- Line 142
			--[[ Upvalues[1]:
				[1]: Parent_upvr (copied, readonly)
			]]
			assert(not Parent_upvr.array(Parent_upvr.any)({1, 2, -- : First try: runluau:11745: attempt to index nil with 't'
))
		end)
	end)
	it("should support map types", function() -- Line 153
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_map_result1 = Parent_upvr.map(Parent_upvr.string, Parent_upvr.number)
		assert(any_map_result1({}))
		assert(any_map_result1({
			a = 1;
		}))
		assert(not any_map_result1({'a'}))
		assert(not any_map_result1({
			a = 'a';
		}))
		assert(not any_map_result1())
	end)
	it("should support set types", function() -- Line 162
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_set_result1 = Parent_upvr.set(Parent_upvr.string)
		assert(any_set_result1({}))
		assert(any_set_result1({
			a = true;
		}))
		assert(not any_set_result1({'a'}))
		assert(not any_set_result1({
			a = 'a';
		}))
		assert(not any_set_result1({
			a = false;
		}))
		assert(not any_set_result1())
	end)
	it("should support interface types", function() -- Line 172
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_interface_result1 = Parent_upvr.interface({
			x = Parent_upvr.number;
			y = Parent_upvr.number;
			z = Parent_upvr.number;
		})
		assert(any_interface_result1({
			w = 0;
			x = 1;
			y = 2;
			z = 3;
		}))
		assert(not any_interface_result1({
			w = 0;
			x = 1;
			y = 2;
		}))
	end)
	it("should support strict interface types", function() -- Line 193
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_strictInterface_result1 = Parent_upvr.strictInterface({
			x = Parent_upvr.number;
			y = Parent_upvr.number;
			z = Parent_upvr.number;
		})
		assert(not any_strictInterface_result1(0))
		assert(not any_strictInterface_result1({
			w = 0;
			x = 1;
			y = 2;
			z = 3;
		}))
		assert(not any_strictInterface_result1({
			w = 0;
			x = 1;
			y = 2;
		}))
		assert(any_strictInterface_result1({
			x = 1;
			y = 2;
			z = 3;
		}))
	end)
	it("should support deep interface types", function() -- Line 222
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_interface_result1_2 = Parent_upvr.interface({
			name = Parent_upvr.string;
			inventory = Parent_upvr.interface({
				size = Parent_upvr.number;
			});
		})
		assert(any_interface_result1_2({
			name = "TestPlayer";
			inventory = {
				size = 1;
			};
		}))
		assert(not any_interface_result1_2({
			inventory = {
				size = 1;
			};
		}))
		assert(not any_interface_result1_2({
			name = "TestPlayer";
			inventory = {};
		}))
		assert(not any_interface_result1_2({
			name = "TestPlayer";
		}))
	end)
	it("should support deep optional interface types", function() -- Line 254
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_interface_result1_6 = Parent_upvr.interface({
			name = Parent_upvr.string;
			inventory = Parent_upvr.optional(Parent_upvr.interface({
				size = Parent_upvr.number;
			}));
		})
		assert(any_interface_result1_6({
			name = "TestPlayer";
		}))
		assert(not any_interface_result1_6({
			name = "TestPlayer";
			inventory = {};
		}))
		assert(any_interface_result1_6({
			name = "TestPlayer";
			inventory = {
				size = 1;
			};
		}))
	end)
	it("should support Roblox Instance types", function() -- Line 280
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_instanceOf_result1 = Parent_upvr.instanceOf("StringValue")
		assert(any_instanceOf_result1(Instance.new("StringValue")))
		assert(not any_instanceOf_result1(Instance.new("BoolValue")))
		assert(not any_instanceOf_result1())
	end)
	it("should support Roblox Instance types inheritance", function() -- Line 290
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_instanceIsA_result1 = Parent_upvr.instanceIsA("GuiObject")
		assert(any_instanceIsA_result1(Instance.new("Frame")))
		assert(any_instanceIsA_result1(Instance.new("TextLabel")))
		assert(not any_instanceIsA_result1(Instance.new("StringValue")))
		assert(not any_instanceIsA_result1())
	end)
	it("should support Roblox Enum types", function() -- Line 302
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_enum_result1 = Parent_upvr.enum(Enum.SortOrder)
		assert(Parent_upvr.Enum(Enum.SortOrder))
		assert(not Parent_upvr.Enum("Enum.SortOrder"))
		assert(Parent_upvr.EnumItem(Enum.SortOrder.Name))
		assert(not Parent_upvr.EnumItem("Enum.SortOrder.Name"))
		assert(any_enum_result1(Enum.SortOrder.Name))
		assert(any_enum_result1(Enum.SortOrder.Custom))
		assert(not any_enum_result1(Enum.EasingStyle.Linear))
		assert(not any_enum_result1())
	end)
	it("should support Roblox RBXScriptSignal", function() -- Line 316
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		assert(Parent_upvr.RBXScriptSignal(game.ChildAdded))
		assert(not Parent_upvr.RBXScriptSignal(nil))
		assert(not Parent_upvr.RBXScriptSignal(Vector3.new()))
	end)
	it("should support wrapping function types", function() -- Line 330
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_wrap_result1 = Parent_upvr.wrap(function(arg1, arg2, arg3) -- Line 332
			local formatted = string.format("%s %d", arg1, arg2)
			if arg3 then
				formatted = formatted..' '..arg3
			end
			return formatted
		end, Parent_upvr.tuple(Parent_upvr.string, Parent_upvr.number, Parent_upvr.optional(Parent_upvr.string)))
		assert(not pcall(any_wrap_result1))
		assert(not pcall(any_wrap_result1, 'a'))
		assert(not pcall(any_wrap_result1, 2))
		assert(pcall(any_wrap_result1, 'a', 1))
		assert(pcall(any_wrap_result1, 'a', 1, 'b'))
	end)
	it("should support strict types", function() -- Line 347
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_strict_result1_upvr = Parent_upvr.strict(Parent_upvr.tuple(Parent_upvr.string, Parent_upvr.number))
		assert(not pcall(function() -- Line 349
			--[[ Upvalues[1]:
				[1]: any_strict_result1_upvr (readonly)
			]]
			any_strict_result1_upvr('a', 'b')
		end))
		assert(pcall(function() -- Line 352
			--[[ Upvalues[1]:
				[1]: any_strict_result1_upvr (readonly)
			]]
			any_strict_result1_upvr('a', 1)
		end))
	end)
	it("should support common OOP types", function() -- Line 357
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local tbl_upvr = {}
		tbl_upvr.__index = tbl_upvr
		function tbl_upvr.new() -- Line 361
			--[[ Upvalues[1]:
				[1]: tbl_upvr (readonly)
			]]
			return setmetatable({}, tbl_upvr)
		end
		local function _(arg1) -- Line 366, Named "instanceOfClass"
			--[[ Upvalues[1]:
				[1]: Parent_upvr (copied, readonly)
			]]
			return function(arg1_2) -- Line 367
				--[[ Upvalues[2]:
					[1]: Parent_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				local any_table_result1_2, any_table_result2 = Parent_upvr.table(arg1_2)
				if not any_table_result1_2 then
					return false, any_table_result2 or ""
				end
				local getmetatable_result1_2 = getmetatable(arg1_2)
				if not getmetatable_result1_2 or getmetatable_result1_2.__index ~= arg1 then
					return false, "bad member of class"
				end
				return true
			end
		end
		local function var97(arg1) -- Line 367
			--[[ Upvalues[2]:
				[1]: Parent_upvr (copied, readonly)
				[2]: tbl_upvr (readonly)
			]]
			local any_table_result1, any_table_result2_2 = Parent_upvr.table(arg1)
			if not any_table_result1 then
				return false, any_table_result2_2 or ""
			end
			local getmetatable_result1 = getmetatable(arg1)
			if not getmetatable_result1 or getmetatable_result1.__index ~= tbl_upvr then
				return false, "bad member of class"
			end
			return true
		end
		assert(var97(tbl_upvr.new()))
		assert(not var97({}))
		assert(not var97())
	end)
	it("should not treat NaN as numbers", function() -- Line 390
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		assert(Parent_upvr.number(1))
		assert(not Parent_upvr.number(tonumber("nan")))
		assert(not Parent_upvr.number('1'))
	end)
	it("should not treat numbers as NaN", function() -- Line 396
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		assert(not Parent_upvr.nan(1))
		assert(Parent_upvr.nan(tonumber("nan")))
		assert(not Parent_upvr.nan('1'))
	end)
	it("should allow union of number and NaN", function() -- Line 402
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_union_result1_2 = Parent_upvr.union(Parent_upvr.number, Parent_upvr.nan)
		assert(any_union_result1_2(1))
		assert(any_union_result1_2(tonumber("nan")))
		assert(not any_union_result1_2('1'))
	end)
	it("should support non-string keys for interfaces", function() -- Line 409
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local tbl_2 = {}
		local any_interface_result1_4 = Parent_upvr.interface({
			[tbl_2] = Parent_upvr.number;
		})
		assert(any_interface_result1_4({
			[tbl_2] = 1;
		}))
		assert(not any_interface_result1_4({
			[tbl_2] = '1';
		}))
	end)
	it("should support failing on non-string keys for strict interfaces", function() -- Line 416
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		assert(not Parent_upvr.strictInterface({
			a = Parent_upvr.number;
		})({
			a = 1;
			[{}] = 2;
		}))
	end)
	it("should support children", function() -- Line 421
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_interface_result1_5 = Parent_upvr.interface({
			buttonInFrame = Parent_upvr.intersection(Parent_upvr.instanceOf("Frame"), Parent_upvr.children({
				MyButton = Parent_upvr.instanceOf("ImageButton");
			}));
		})
		assert(not Parent_upvr.children({})(5))
		assert(not any_interface_result1_5({
			buttonInFrame = Instance.new("Frame");
		}))
		local Frame_11 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_11).Name = "MyButton"
		assert(any_interface_result1_5({
			buttonInFrame = Frame_11;
		}))
		local Frame_12 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_12).Name = "NotMyButton"
		assert(not any_interface_result1_5({
			buttonInFrame = Frame_12;
		}))
		local Frame_2 = Instance.new("Frame")
		Instance.new("TextButton", Frame_2).Name = "MyButton"
		assert(not any_interface_result1_5({
			buttonInFrame = Frame_2;
		}))
		local Frame_6 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_6).Name = "MyButton"
		Instance.new("ImageButton", Frame_6).Name = "MyButton"
		assert(not any_interface_result1_5({
			buttonInFrame = Frame_6;
		}))
	end)
	it("should support t.instanceOf shorthand", function() -- Line 462
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_interface_result1_7 = Parent_upvr.interface({
			buttonInFrame = Parent_upvr.instanceOf("Frame", {
				MyButton = Parent_upvr.instanceOf("ImageButton");
			});
		})
		assert(not Parent_upvr.children({})(5))
		assert(not any_interface_result1_7({
			buttonInFrame = Instance.new("Frame");
		}))
		local Frame_9 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_9).Name = "MyButton"
		assert(any_interface_result1_7({
			buttonInFrame = Frame_9;
		}))
		local Frame_3 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_3).Name = "NotMyButton"
		assert(not any_interface_result1_7({
			buttonInFrame = Frame_3;
		}))
		local Frame_10 = Instance.new("Frame")
		Instance.new("TextButton", Frame_10).Name = "MyButton"
		assert(not any_interface_result1_7({
			buttonInFrame = Frame_10;
		}))
		local Frame = Instance.new("Frame")
		Instance.new("ImageButton", Frame).Name = "MyButton"
		Instance.new("ImageButton", Frame).Name = "MyButton"
		assert(not any_interface_result1_7({
			buttonInFrame = Frame;
		}))
	end)
	it("should support t.instanceIsA shorthand", function() -- Line 503
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_interface_result1_3 = Parent_upvr.interface({
			buttonInFrame = Parent_upvr.instanceIsA("Frame", {
				MyButton = Parent_upvr.instanceIsA("ImageButton");
			});
		})
		assert(not Parent_upvr.children({})(5))
		assert(not any_interface_result1_3({
			buttonInFrame = Instance.new("Frame");
		}))
		local Frame_7 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_7).Name = "MyButton"
		assert(any_interface_result1_3({
			buttonInFrame = Frame_7;
		}))
		local Frame_5 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_5).Name = "NotMyButton"
		assert(not any_interface_result1_3({
			buttonInFrame = Frame_5;
		}))
		local Frame_4 = Instance.new("Frame")
		Instance.new("TextButton", Frame_4).Name = "MyButton"
		assert(not any_interface_result1_3({
			buttonInFrame = Frame_4;
		}))
		local Frame_8 = Instance.new("Frame")
		Instance.new("ImageButton", Frame_8).Name = "MyButton"
		Instance.new("ImageButton", Frame_8).Name = "MyButton"
		assert(not any_interface_result1_3({
			buttonInFrame = Frame_8;
		}))
	end)
	it("should support t.match", function() -- Line 544
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_match_result1 = Parent_upvr.match("%d+")
		assert(any_match_result1("123"))
		assert(not any_match_result1("abc"))
		assert(not any_match_result1())
	end)
	it("should support t.keyOf", function() -- Line 551
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_keyOf_result1 = Parent_upvr.keyOf({
			OptionA = {};
			OptionB = {};
		})
		assert(any_keyOf_result1("OptionA"))
		assert(not any_keyOf_result1("OptionC"))
	end)
	it("should support t.valueOf", function() -- Line 561
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local tbl = {
			OptionA = {};
			OptionB = {};
		}
		local any_valueOf_result1 = Parent_upvr.valueOf(tbl)
		assert(any_valueOf_result1(tbl.OptionA))
		assert(not any_valueOf_result1(1010))
	end)
	it("should support t.strictArray", function() -- Line 571
		--[[ Upvalues[1]:
			[1]: Parent_upvr (readonly)
		]]
		local any_strictArray_result1_2 = Parent_upvr.strictArray(Parent_upvr.number, Parent_upvr.number)
		assert(any_strictArray_result1_2({1, 2}))
		assert(not any_strictArray_result1_2({1, 2, 3}))
		assert(not any_strictArray_result1_2({10}))
		assert(not any_strictArray_result1_2({"Hello", 10}))
		assert(not any_strictArray_result1_2({
			Foo = "Bar";
		}))
		local any_strictArray_result1 = Parent_upvr.strictArray(Parent_upvr.number, Parent_upvr.number, Parent_upvr.optional(Parent_upvr.string))
		assert(any_strictArray_result1({10, 20}))
		assert(any_strictArray_result1({10, 20, "Hello"}))
		assert(not any_strictArray_result1({10, 20, 30}))
	end)
end