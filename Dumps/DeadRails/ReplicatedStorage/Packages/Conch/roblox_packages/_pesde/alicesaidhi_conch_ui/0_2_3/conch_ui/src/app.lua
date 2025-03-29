--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.alicesaidhi+conch_ui.0.2.3.conch_ui.src.app
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_TextService_0 = game:GetService("TextService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require("./components/background");
local v3 = require("../roblox_packages/conch");
local v4 = require("./components/corner");
local v5 = require("./components/flex");
local v6 = require("./components/gap");
local v7 = require("./components/loading");
local v8 = require("./components/padding");
local v9 = require("./components/screen");
local v10 = require("./state");
local v11 = require("./components/suggestion");
local v12 = require("./components/text");
local v13 = require("./components/textbox");
local v14 = require("./theme");
local v15 = require("../roblox_packages/vide");
local l_source_0 = v15.source;
local l_derive_0 = v15.derive;
local l_show_0 = v15.show;
local l_changed_0 = v15.changed;
local l_effect_0 = v15.effect;
local l_cleanup_0 = v15.cleanup;
local l_indexes_0 = v15.indexes;
return function() --[[ Line: 31 ]]
    -- upvalues: v10 (copy), v3 (copy), l_source_0 (copy), l_derive_0 (copy), l_effect_0 (copy), v14 (copy), l_TextService_0 (copy), l_cleanup_0 (copy), l_UserInputService_0 (copy), v9 (copy), v5 (copy), v8 (copy), l_show_0 (copy), v15 (copy), v11 (copy), v2 (copy), v4 (copy), l_indexes_0 (copy), v12 (copy), v6 (copy), v7 (copy), v13 (copy), l_changed_0 (copy)
    local function v27(v23) --[[ Line: 32 ]] --[[ Name: output ]]
        -- upvalues: v10 (ref)
        for _, v25 in (string.split(v23.text, "\n")) do
            local v26 = v10.logs();
            table.insert(v26, 1, {
                kind = v23.kind, 
                text = v25
            });
            table.remove(v26, 100);
            v10.logs(v26);
        end;
    end;
    v3.console.output = v27;
    for _, v29 in string.split("Conch 0.2.x\nCopyright (c) alicesays_hallo - This project is licensed under MIT, you can view the included license with `license`", "\n") do
        v27({
            kind = "normal", 
            text = v29
        });
    end;
    v3.register("clear", {
        description = "Clears the console.", 
        permissions = {}, 
        arguments = function() --[[ Line: 52 ]] --[[ Name: arguments ]]

        end, 
        callback = function() --[[ Line: 53 ]] --[[ Name: callback ]]
            -- upvalues: v10 (ref)
            v10.logs({});
        end
    });
    local v30 = l_source_0("");
    local v31 = l_source_0(false);
    local v32 = l_source_0(0);
    local v33 = l_source_0(Vector2.zero);
    local v34 = l_source_0();
    local v35 = l_derive_0(function() --[[ Line: 62 ]]
        -- upvalues: v34 (copy), v30 (copy)
        if v34() then
            return v34().src .. v30();
        else
            return v30();
        end;
    end);
    local v37 = l_derive_0(function() --[[ Line: 70 ]]
        -- upvalues: v3 (ref), v35 (copy)
        local v36 = v3.parse(v35());
        if v36.status == "error" then
            return v36.why;
        else
            return nil;
        end;
    end);
    local v38 = l_source_0(v3.analyze("", 0));
    local v39 = l_source_0(1);
    l_effect_0(function() --[[ Line: 79 ]]
        -- upvalues: v39 (copy), v38 (copy)
        v39((math.clamp(v39(), 1, (math.max(1, #v38().suggestions)))));
    end);
    local v40 = false;
    l_effect_0(function() --[[ Line: 91 ]]
        -- upvalues: v30 (copy), v32 (copy), v40 (ref), v38 (copy), v3 (ref)
        v30();
        v32();
        if v40 then
            return;
        else
            v40 = true;
            task.defer(function() --[[ Line: 96 ]]
                -- upvalues: v40 (ref), v38 (ref), v3 (ref), v30 (ref), v32 (ref)
                v40 = false;
                v38(v3.analyze(v30(), v32() - 1));
            end);
            return;
        end;
    end);
    local v41 = l_derive_0(function() --[[ Line: 103 ]]
        -- upvalues: v30 (copy), v32 (copy)
        return (string.sub(v30(), 1, v32() - 1));
    end);
    local v42 = l_source_0((Vector3.new(0, 0, 0, 0)));
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Font = v14.font();
    l_GetTextBoundsParams_0.RichText = false;
    l_GetTextBoundsParams_0.Size = 20;
    l_GetTextBoundsParams_0.Width = 100000;
    l_effect_0(function() --[[ Line: 114 ]]
        -- upvalues: v41 (copy), l_GetTextBoundsParams_0 (copy), l_TextService_0 (ref), v42 (copy)
        local v44 = v41();
        l_GetTextBoundsParams_0.Text = v44;
        task.spawn(function() --[[ Line: 117 ]]
            -- upvalues: l_TextService_0 (ref), l_GetTextBoundsParams_0 (ref), v44 (copy), v41 (ref), v42 (ref)
            local l_l_TextService_0_TextBoundsAsync_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
            if v44 ~= v41() then
                return;
            else
                v42(l_l_TextService_0_TextBoundsAsync_0);
                return;
            end;
        end);
    end);
    local function _(v46, v47, v48) --[[ Line: 124 ]] --[[ Name: autofill ]]
        -- upvalues: v32 (copy)
        local v49 = string.sub(v46, 1, v47.x);
        local v50 = string.sub(v46, v47.y + 1, -1);
        task.defer(v32, v47.x + #v48 + 2);
        return v49 .. v48 .. " " .. v50;
    end;
    l_cleanup_0(l_UserInputService_0.InputBegan:Connect(function(v52) --[[ Line: 132 ]]
        -- upvalues: v39 (copy), v38 (copy)
        if v52.KeyCode == Enum.KeyCode.Down then
            v39((math.min(v39() + 1, #v38().suggestions)));
            return;
        else
            if v52.KeyCode == Enum.KeyCode.Up then
                v39((math.max(1, v39() - 1)));
            end;
            return;
        end;
    end));
    local v53 = false;
    return v9({
        name = "Command Executor", 
        display_order = 100000, 
        enabled = v10.opened; 
        v5():fill("horizontal"):vertical("bottom"), 
        v8({
            padding = 12
        }), 
        l_show_0(v38, function() --[[ Line: 151 ]]
            -- upvalues: v15 (ref), v11 (ref), v41 (copy), v42 (copy), v33 (copy), v39 (copy), v38 (copy)
            return v15.create("Folder")({
                v11({
                    x = function() --[[ Line: 154 ]] --[[ Name: x ]]
                        -- upvalues: v41 (ref)
                        local v54 = string.split(v41(), "\n");
                        return #v54[#v54] * 10 + 10;
                    end, 
                    y = function() --[[ Line: 158 ]] --[[ Name: y ]]
                        -- upvalues: v42 (ref), v33 (ref)
                        return v42().Y + v33().Y - 20;
                    end, 
                    selected = v39, 
                    analyzing = function() --[[ Line: 165 ]] --[[ Name: analyzing ]]
                        -- upvalues: v38 (ref)
                        return v38().analyzing;
                    end, 
                    suggestions = function() --[[ Line: 166 ]] --[[ Name: suggestions ]]
                        -- upvalues: v38 (ref)
                        return v38().suggestions;
                    end
                })
            });
        end), 
        v2({
            auto = "Y"; 
            v5(), 
            v4(4), 
            v8({
                y = 4
            }), 
            l_indexes_0(function() --[[ Line: 178 ]]
                -- upvalues: v37 (copy), v38 (copy)
                local v55 = v37();
                local v56 = table.clone(v38() and v38().logs or {});
                if v55 then
                    table.insert(v56, {
                        kind = "error", 
                        text = v55
                    });
                end;
                return v56;
            end, function(v57, v58) --[[ Line: 185 ]]
                -- upvalues: v12 (ref), v8 (ref)
                return v12({
                    order = 0 - v58 + 100, 
                    height = 20, 
                    text = function() --[[ Line: 190 ]] --[[ Name: text ]]
                        -- upvalues: v57 (copy)
                        return v57().text;
                    end, 
                    text_size = 16, 
                    text_style = function() --[[ Line: 192 ]] --[[ Name: text_style ]]
                        -- upvalues: v57 (copy)
                        return v57().kind;
                    end, 
                    xalignment = Enum.TextXAlignment.Left; 
                    v8({
                        x = 8
                    })
                });
            end), 
            l_indexes_0(v10.logs, function(v59, v60) --[[ Line: 199 ]]
                -- upvalues: v12 (ref), v8 (ref)
                return v12({
                    height = 20, 
                    order = -v60 - 1, 
                    text = function() --[[ Line: 204 ]] --[[ Name: text ]]
                        -- upvalues: v59 (copy)
                        return v59().text;
                    end, 
                    text_size = 16, 
                    text_style = function() --[[ Line: 206 ]] --[[ Name: text_style ]]
                        -- upvalues: v59 (copy)
                        return v59().kind;
                    end, 
                    xalignment = Enum.TextXAlignment.Left; 
                    v8({
                        x = 8
                    })
                });
            end)
        }), 
        v6({
            height = 4
        }), 
        v2({
            auto = Enum.AutomaticSize.Y; 
            v4(4), 
            l_show_0(v31, function() --[[ Line: 222 ]]
                -- upvalues: v7 (ref)
                return v7({
                    height = 18, 
                    speed = 6, 
                    text_size = 18, 
                    xalignment = Enum.TextXAlignment.Left
                });
            end, function() --[[ Line: 230 ]]
                -- upvalues: v13 (ref), v30 (copy), v53 (ref), v32 (copy), v38 (copy), v39 (copy), v34 (copy), v3 (ref), v10 (ref), v31 (copy), l_changed_0 (ref)
                return v13({
                    text = v30, 
                    update_text = function(v61) --[[ Line: 233 ]] --[[ Name: update_text ]]
                        -- upvalues: v53 (ref), v32 (ref), v38 (ref), v30 (ref), v39 (ref)
                        local v62 = v53 or v32();
                        local v63 = string.sub(v61, v62 - 1, v62 - 1);
                        local l_suggestions_0 = v38().suggestions;
                        if v63 == "\t" and l_suggestions_0[1] then
                            local v65 = v30();
                            local l_replace_0 = l_suggestions_0[v39()].replace;
                            local l_with_0 = l_suggestions_0[v39()].with;
                            local v68 = string.sub(v65, 1, l_replace_0.x);
                            local v69 = string.sub(v65, l_replace_0.y + 1, -1);
                            task.defer(v32, l_replace_0.x + #l_with_0 + 2);
                            v61 = v68 .. l_with_0 .. " " .. v69;
                        end;
                        v30(v61);
                    end, 
                    placeholder = "Enter your command", 
                    text_size = 18, 
                    xalignment = Enum.TextXAlignment.Left, 
                    multiline = function() --[[ Line: 253 ]] --[[ Name: multiline ]]
                        -- upvalues: v34 (ref), v3 (ref), v30 (ref)
                        if v34() then
                            return v3.parse(v34().src .. v30(), "yield").status == "pending";
                        else
                            return v3.parse(v30(), "yield").status == "pending";
                        end;
                    end, 
                    enter = function(v70) --[[ Line: 266 ]] --[[ Name: enter ]]
                        -- upvalues: v30 (ref), v10 (ref), v34 (ref), v3 (ref), v31 (ref)
                        v30("");
                        v10.focused(true);
                        if v34() then
                            v34(v34().append(v70));
                        else
                            v34(v3.parse(v70, true));
                        end;
                        if v34().status ~= "pending" then
                            v31(true);
                            v34(nil);
                            v3.execute(v70);
                            v31(false);
                        end;
                    end, 
                    focused = v10.focused, 
                    update_focused = v10.focused; 
                    {
                        CursorPosition = v32; 
                        l_changed_0("CursorPosition", function(v71) --[[ Line: 289 ]]
                            -- upvalues: v53 (ref), v32 (ref)
                            if v53 then
                                v53 = v71;
                                return;
                            else
                                v53 = v71;
                                task.defer(function() --[[ Line: 297 ]]
                                    -- upvalues: v32 (ref), v53 (ref)
                                    v32(v53);
                                    v53 = false;
                                end);
                                return;
                            end;
                        end)
                    }
                });
            end), 
            v8({
                x = 8, 
                y = 8
            }), 
            v5():fill():vertical("center"):horizontal("left"), 
            l_changed_0("AbsolutePosition", v33)
        })
    });
end;