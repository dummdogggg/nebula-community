--[[
    Script: ReplicatedStorage.Packages.t.init.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    it("should support basic types", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        assert(v0.any(""));
        assert(v0.boolean(true));
        assert(v0.none(nil));
        assert(v0.number(1));
        assert(v0.string("foo"));
        assert(v0.table({}));
        assert(not v0.any(nil));
        assert(not v0.boolean("true"));
        assert(not v0.none(1));
        assert(not v0.number(true));
        assert(not v0.string(true));
        assert(not v0.table(82));
    end);
    it("should support special number types", function() --[[ Line: 20 ]]
        -- upvalues: v0 (copy)
        local v1 = v0.numberMax(10);
        local v2 = v0.numberMin(2);
        local v3 = v0.numberMaxExclusive(10);
        local v4 = v0.numberMinExclusive(2);
        local v5 = v0.numberConstrained(8, 11);
        local v6 = v0.numberConstrainedExclusive(8, 11);
        assert(v1(5));
        assert(v1(10));
        assert(not v1(11));
        assert(not v1());
        assert(v2(5));
        assert(v2(2));
        assert(not v2(1));
        assert(not v2());
        assert(v3(5));
        assert(v3(9));
        assert(not v3(10));
        assert(not v3());
        assert(v4(5));
        assert(v4(3));
        assert(not v4(2));
        assert(not v4());
        assert(not v5(7));
        assert(v5(8));
        assert(v5(9));
        assert(v5(11));
        assert(not v5(12));
        assert(not v5());
        assert(not v6(7));
        assert(not v6(8));
        assert(v6(9));
        assert(not v6(11));
        assert(not v6(12));
        assert(not v6());
    end);
    it("should support optional types", function() --[[ Line: 63 ]]
        -- upvalues: v0 (copy)
        local v7 = v0.optional(v0.string);
        assert(v7(""));
        assert(v7());
        assert(not v7(1));
    end);
    it("should support tuple types", function() --[[ Line: 70 ]]
        -- upvalues: v0 (copy)
        local v8 = v0.tuple(v0.number, v0.string, v0.optional(v0.number));
        assert(v8(1, "2", 3));
        assert(v8(1, "2"));
        assert(not v8(1, "2", "3"));
    end);
    it("should support union types", function() --[[ Line: 77 ]]
        -- upvalues: v0 (copy)
        local v9 = v0.union(v0.number, v0.string);
        assert(v9(1));
        assert(v9("1"));
        assert(not v9(nil));
    end);
    it("should support literal types", function() --[[ Line: 84 ]]
        -- upvalues: v0 (copy)
        local v10 = v0.literal("foo");
        local v11 = v0.union(v0.literal("foo"), v0.literal("bar"), v0.literal("oof"));
        assert(v10("foo"));
        assert(v11("foo"));
        assert(v11("bar"));
        assert(v11("oof"));
        assert(not v10("FOO"));
        assert(not v11("FOO"));
        assert(not v11("BAR"));
        assert(not v11("OOF"));
    end);
    it("should support multiple literal types", function() --[[ Line: 99 ]]
        -- upvalues: v0 (copy)
        local v12 = v0.literal("foo");
        local v13 = v0.literal("foo", "bar", "oof");
        assert(v12("foo"));
        assert(v13("foo"));
        assert(v13("bar"));
        assert(v13("oof"));
        assert(not v12("FOO"));
        assert(not v13("FOO"));
        assert(not v13("BAR"));
        assert(not v13("OOF"));
    end);
    it("should support intersection types", function() --[[ Line: 114 ]]
        -- upvalues: v0 (copy)
        local v14 = v0.intersection(v0.integer, v0.numberMax(5000));
        assert(v14(1));
        assert(not v14(5001));
        assert(not v14(1.1));
        assert(not v14("1"));
    end);
    describe("array", function() --[[ Line: 122 ]]
        -- upvalues: v0 (copy)
        it("should support array types", function() --[[ Line: 123 ]]
            -- upvalues: v0 (ref)
            local v15 = v0.array(v0.string);
            local v16 = v0.array(v0.any);
            local v17 = v0.values(v0.string);
            assert(not v16("foo"));
            assert(v16({
                1, 
                "2", 
                3
            }));
            assert(not v15({
                1, 
                "2", 
                3
            }));
            assert(not v15());
            assert(not v17());
            assert(v16({
                "1", 
                "2", 
                "3"
            }, v0.string));
            assert(not v16({
                foo = "bar"
            }));
            assert(not v16({
                [1] = "non", 
                [5] = "sequential"
            }));
        end);
        it("should not be fooled by sparse arrays", function() --[[ Line: 142 ]]
            -- upvalues: v0 (ref)
            assert(not v0.array(v0.any)({
                [1] = 1, 
                [2] = 2, 
                [4] = 4
            }));
        end);
    end);
    it("should support map types", function() --[[ Line: 153 ]]
        -- upvalues: v0 (copy)
        local v18 = v0.map(v0.string, v0.number);
        assert(v18({}));
        assert(v18({
            a = 1
        }));
        assert(not v18({
            [1] = "a"
        }));
        assert(not v18({
            a = "a"
        }));
        assert(not v18());
    end);
    it("should support set types", function() --[[ Line: 162 ]]
        -- upvalues: v0 (copy)
        local v19 = v0.set(v0.string);
        assert(v19({}));
        assert(v19({
            a = true
        }));
        assert(not v19({
            [1] = "a"
        }));
        assert(not v19({
            a = "a"
        }));
        assert(not v19({
            a = false
        }));
        assert(not v19());
    end);
    it("should support interface types", function() --[[ Line: 172 ]]
        -- upvalues: v0 (copy)
        local v20 = v0.interface({
            x = v0.number, 
            y = v0.number, 
            z = v0.number
        });
        assert(v20({
            w = 0, 
            x = 1, 
            y = 2, 
            z = 3
        }));
        assert(not v20({
            w = 0, 
            x = 1, 
            y = 2
        }));
    end);
    it("should support strict interface types", function() --[[ Line: 193 ]]
        -- upvalues: v0 (copy)
        local v21 = v0.strictInterface({
            x = v0.number, 
            y = v0.number, 
            z = v0.number
        });
        assert(not v21(0));
        assert(not v21({
            w = 0, 
            x = 1, 
            y = 2, 
            z = 3
        }));
        assert(not v21({
            w = 0, 
            x = 1, 
            y = 2
        }));
        assert(v21({
            x = 1, 
            y = 2, 
            z = 3
        }));
    end);
    it("should support deep interface types", function() --[[ Line: 222 ]]
        -- upvalues: v0 (copy)
        local v22 = v0.interface({
            name = v0.string, 
            inventory = v0.interface({
                size = v0.number
            })
        });
        assert(v22({
            name = "TestPlayer", 
            inventory = {
                size = 1
            }
        }));
        assert(not v22({
            inventory = {
                size = 1
            }
        }));
        assert(not v22({
            name = "TestPlayer", 
            inventory = {}
        }));
        assert(not v22({
            name = "TestPlayer"
        }));
    end);
    it("should support deep optional interface types", function() --[[ Line: 254 ]]
        -- upvalues: v0 (copy)
        local v23 = v0.interface({
            name = v0.string, 
            inventory = v0.optional(v0.interface({
                size = v0.number
            }))
        });
        assert(v23({
            name = "TestPlayer"
        }));
        assert(not v23({
            name = "TestPlayer", 
            inventory = {}
        }));
        assert(v23({
            name = "TestPlayer", 
            inventory = {
                size = 1
            }
        }));
    end);
    it("should support Roblox Instance types", function() --[[ Line: 280 ]]
        -- upvalues: v0 (copy)
        local v24 = v0.instanceOf("StringValue");
        local l_StringValue_0 = Instance.new("StringValue");
        local l_BoolValue_0 = Instance.new("BoolValue");
        assert(v24(l_StringValue_0));
        assert(not v24(l_BoolValue_0));
        assert(not v24());
    end);
    it("should support Roblox Instance types inheritance", function() --[[ Line: 290 ]]
        -- upvalues: v0 (copy)
        local v27 = v0.instanceIsA("GuiObject");
        local l_Frame_0 = Instance.new("Frame");
        local l_TextLabel_0 = Instance.new("TextLabel");
        local l_StringValue_1 = Instance.new("StringValue");
        assert(v27(l_Frame_0));
        assert(v27(l_TextLabel_0));
        assert(not v27(l_StringValue_1));
        assert(not v27());
    end);
    it("should support Roblox Enum types", function() --[[ Line: 302 ]]
        -- upvalues: v0 (copy)
        local v31 = v0.enum(Enum.SortOrder);
        assert(v0.Enum(Enum.SortOrder));
        assert(not v0.Enum("Enum.SortOrder"));
        assert(v0.EnumItem(Enum.SortOrder.Name));
        assert(not v0.EnumItem("Enum.SortOrder.Name"));
        assert(v31(Enum.SortOrder.Name));
        assert(v31(Enum.SortOrder.Custom));
        assert(not v31(Enum.EasingStyle.Linear));
        assert(not v31());
    end);
    it("should support Roblox RBXScriptSignal", function() --[[ Line: 316 ]]
        -- upvalues: v0 (copy)
        assert(v0.RBXScriptSignal(game.ChildAdded));
        assert(not v0.RBXScriptSignal(nil));
        assert(not v0.RBXScriptSignal((Vector3.new())));
    end);
    it("should support wrapping function types", function() --[[ Line: 330 ]]
        -- upvalues: v0 (copy)
        local v32 = v0.tuple(v0.string, v0.number, v0.optional(v0.string));
        local v37 = v0.wrap(function(v33, v34, v35) --[[ Line: 332 ]]
            local v36 = string.format("%s %d", v33, v34);
            if v35 then
                v36 = v36 .. " " .. v35;
            end;
            return v36;
        end, v32);
        assert(not pcall(v37));
        assert(not pcall(v37, "a"));
        assert(not pcall(v37, 2));
        assert(pcall(v37, "a", 1));
        assert(pcall(v37, "a", 1, "b"));
    end);
    it("should support strict types", function() --[[ Line: 347 ]]
        -- upvalues: v0 (copy)
        local v38 = v0.strict(v0.tuple(v0.string, v0.number));
        assert(not pcall(function() --[[ Line: 349 ]]
            -- upvalues: v38 (copy)
            v38("a", "b");
        end));
        assert(pcall(function() --[[ Line: 352 ]]
            -- upvalues: v38 (copy)
            v38("a", 1);
        end));
    end);
    it("should support common OOP types", function() --[[ Line: 357 ]]
        -- upvalues: v0 (copy)
        local v39 = {};
        v39.__index = v39;
        v39.new = function() --[[ Line: 361 ]] --[[ Name: new ]]
            -- upvalues: v39 (copy)
            return (setmetatable({}, v39));
        end;
        local function _(v40) --[[ Line: 366 ]] --[[ Name: instanceOfClass ]]
            -- upvalues: v0 (ref)
            return function(v41) --[[ Line: 367 ]]
                -- upvalues: v0 (ref), v40 (copy)
                local v42, v43 = v0.table(v41);
                if not v42 then
                    return false, v43 or "";
                else
                    local v44 = getmetatable(v41);
                    if not v44 or v44.__index ~= v40 then
                        return false, "bad member of class";
                    else
                        return true;
                    end;
                end;
            end;
        end;
        local function v50(v46) --[[ Line: 367 ]]
            -- upvalues: v0 (ref), v39 (copy)
            local v47, v48 = v0.table(v46);
            if not v47 then
                return false, v48 or "";
            else
                local v49 = getmetatable(v46);
                if not v49 or v49.__index ~= v39 then
                    return false, "bad member of class";
                else
                    return true;
                end;
            end;
        end;
        assert(v50((v39.new())));
        assert(not v50({}));
        assert(not v50());
    end);
    it("should not treat NaN as numbers", function() --[[ Line: 390 ]]
        -- upvalues: v0 (copy)
        assert(v0.number(1));
        assert(not v0.number((0/0)));
        assert(not v0.number("1"));
    end);
    it("should not treat numbers as NaN", function() --[[ Line: 396 ]]
        -- upvalues: v0 (copy)
        assert(not v0.nan(1));
        assert(v0.nan((0/0)));
        assert(not v0.nan("1"));
    end);
    it("should allow union of number and NaN", function() --[[ Line: 402 ]]
        -- upvalues: v0 (copy)
        local v51 = v0.union(v0.number, v0.nan);
        assert(v51(1));
        assert(v51((0/0)));
        assert(not v51("1"));
    end);
    it("should support non-string keys for interfaces", function() --[[ Line: 409 ]]
        -- upvalues: v0 (copy)
        local v52 = {};
        local v53 = v0.interface({
            [v52] = v0.number
        });
        assert(v53({
            [v52] = 1
        }));
        assert(not v53({
            [v52] = "1"
        }));
    end);
    it("should support failing on non-string keys for strict interfaces", function() --[[ Line: 416 ]]
        -- upvalues: v0 (copy)
        assert(not v0.strictInterface({
            a = v0.number
        })({
            a = 1, 
            [{}] = 2
        }));
    end);
    it("should support children", function() --[[ Line: 421 ]]
        -- upvalues: v0 (copy)
        local v54 = v0.interface({
            buttonInFrame = v0.intersection(v0.instanceOf("Frame"), v0.children({
                MyButton = v0.instanceOf("ImageButton")
            }))
        });
        assert(not v0.children({})(5));
        assert(not v54({
            buttonInFrame = Instance.new("Frame")
        }));
        local l_Frame_1 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_1).Name = "MyButton";
        assert(v54({
            buttonInFrame = l_Frame_1
        }));
        l_Frame_1 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_1).Name = "NotMyButton";
        assert(not v54({
            buttonInFrame = l_Frame_1
        }));
        l_Frame_1 = Instance.new("Frame");
        Instance.new("TextButton", l_Frame_1).Name = "MyButton";
        assert(not v54({
            buttonInFrame = l_Frame_1
        }));
        l_Frame_1 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_1).Name = "MyButton";
        Instance.new("ImageButton", l_Frame_1).Name = "MyButton";
        assert(not v54({
            buttonInFrame = l_Frame_1
        }));
    end);
    it("should support t.instanceOf shorthand", function() --[[ Line: 462 ]]
        -- upvalues: v0 (copy)
        local v56 = v0.interface({
            buttonInFrame = v0.instanceOf("Frame", {
                MyButton = v0.instanceOf("ImageButton")
            })
        });
        assert(not v0.children({})(5));
        assert(not v56({
            buttonInFrame = Instance.new("Frame")
        }));
        local l_Frame_2 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_2).Name = "MyButton";
        assert(v56({
            buttonInFrame = l_Frame_2
        }));
        l_Frame_2 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_2).Name = "NotMyButton";
        assert(not v56({
            buttonInFrame = l_Frame_2
        }));
        l_Frame_2 = Instance.new("Frame");
        Instance.new("TextButton", l_Frame_2).Name = "MyButton";
        assert(not v56({
            buttonInFrame = l_Frame_2
        }));
        l_Frame_2 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_2).Name = "MyButton";
        Instance.new("ImageButton", l_Frame_2).Name = "MyButton";
        assert(not v56({
            buttonInFrame = l_Frame_2
        }));
    end);
    it("should support t.instanceIsA shorthand", function() --[[ Line: 503 ]]
        -- upvalues: v0 (copy)
        local v58 = v0.interface({
            buttonInFrame = v0.instanceIsA("Frame", {
                MyButton = v0.instanceIsA("ImageButton")
            })
        });
        assert(not v0.children({})(5));
        assert(not v58({
            buttonInFrame = Instance.new("Frame")
        }));
        local l_Frame_3 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_3).Name = "MyButton";
        assert(v58({
            buttonInFrame = l_Frame_3
        }));
        l_Frame_3 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_3).Name = "NotMyButton";
        assert(not v58({
            buttonInFrame = l_Frame_3
        }));
        l_Frame_3 = Instance.new("Frame");
        Instance.new("TextButton", l_Frame_3).Name = "MyButton";
        assert(not v58({
            buttonInFrame = l_Frame_3
        }));
        l_Frame_3 = Instance.new("Frame");
        Instance.new("ImageButton", l_Frame_3).Name = "MyButton";
        Instance.new("ImageButton", l_Frame_3).Name = "MyButton";
        assert(not v58({
            buttonInFrame = l_Frame_3
        }));
    end);
    it("should support t.match", function() --[[ Line: 544 ]]
        -- upvalues: v0 (copy)
        local v60 = v0.match("%d+");
        assert(v60("123"));
        assert(not v60("abc"));
        assert(not v60());
    end);
    it("should support t.keyOf", function() --[[ Line: 551 ]]
        -- upvalues: v0 (copy)
        local v61 = {
            OptionA = {}, 
            OptionB = {}
        };
        local v62 = v0.keyOf(v61);
        assert(v62("OptionA"));
        assert(not v62("OptionC"));
    end);
    it("should support t.valueOf", function() --[[ Line: 561 ]]
        -- upvalues: v0 (copy)
        local v63 = {
            OptionA = {}, 
            OptionB = {}
        };
        local v64 = v0.valueOf(v63);
        assert(v64(v63.OptionA));
        assert(not v64(1010));
    end);
    it("should support t.strictArray", function() --[[ Line: 571 ]]
        -- upvalues: v0 (copy)
        local v65 = v0.strictArray(v0.number, v0.number);
        assert(v65({
            1, 
            2
        }));
        assert(not v65({
            1, 
            2, 
            3
        }));
        assert(not v65({
            10
        }));
        assert(not v65({
            "Hello", 
            10
        }));
        assert(not v65({
            Foo = "Bar"
        }));
        local v66 = v0.strictArray(v0.number, v0.number, v0.optional(v0.string));
        assert(v66({
            10, 
            20
        }));
        assert(v66({
            10, 
            20, 
            "Hello"
        }));
        assert(not v66({
            10, 
            20, 
            30
        }));
    end);
end;