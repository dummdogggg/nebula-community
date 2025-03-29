--[[
    Script: StarterPlayer.StarterPlayerScripts.RecordSoundPlay.HandleOldMusic
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_char_0 = string.char;
local l_byte_0 = string.byte;
local l_sub_0 = string.sub;
local l_bxor_0 = (bit32 or bit).bxor;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local function v10(v6, v7) --[[ Line: 48 ]] --[[ Name: v7 ]]
    -- upvalues: l_bxor_0 (copy), l_sub_0 (copy), l_byte_0 (copy), l_char_0 (copy), l_insert_0 (copy), l_concat_0 (copy)
    local v8 = {};
    for v9 = 1, #v6 do
        l_insert_0(v8, (l_char_0(l_bxor_0(l_byte_0((l_sub_0(v6, v9, v9 + 1))), l_byte_0((l_sub_0(v7, 1 + v9 % #v7, 1 + v9 % #v7 + 1)))) % 256)));
    end;
    return l_concat_0(v8);
end;
local l_game_Service_0 = game:GetService(v10("\227\198\203)\239\184\198\n\212\199\2321\233\169\198\025\212", "~\177\163\187E\134\219\167"));
local l_game_Service_1 = game:GetService(v10("\015\194-\246\2491\219#\198\249", "\156C\173J\165"));
local v13 = v10("\018\190[\019\158)H0\164z\025\169(B", "&T\215)v\220F");
local v14 = {
    v10("\127\004+\029\240\016:+\016\236Q\004;", "\1580vBr"), 
    v10("\153%\t0z\160\247\175d\fv]\170\239\2357\0213z\171\252\235=\031#a\229\250\1680\0259}\182\187\162*P8|\177\242\173-\0197g\172\244\1657O", "\155\203DpV\019\197"), 
    v10("e\2133\255K8\225\247E\206x\239Ij\236\237U\147;\249Nm\165\254I\207v\244Et\245\184Q\212\"\244\000J\228\225@\2123\240D8\246\232C\222?\250I{\165\252C\2033\240Oh\232\253H\201x", "\152&\189V\156 \024\133"), 
    v10("\217O\162E\233C\168T\188\r\231m\238Y\171", "&\1567\199"), 
    v10("\141ey+\006`\245Q\232'<\f\022x\238B", "#\200\029\028Hs\020\154"), 
    v10("<\167\212\220\1528;\v\255\139\159\181):\022", "Ty\223\177\191\237L"), 
    v10("\158N\204\163/D?\211\251\f\137\1315T5\217", "\161\2196\169\192Z0P"), 
    v10("lZ\005&\\V\0157\t\024@\015cq\016)FK\020eQ\0028 GM", "E)\"`"), 
    v10("\153\219\210\t\023?\179\209\151PB\n\174\192\210\031\017k\132", "K\220\163\183jb"), 
    v10("'\162\1424\204\022\181\153w\131B\156\135\"\193\023\169", "\185b\218\235W"), 
    v10("\238$\"\229\203\190\196.g\188\158\156\206;&\222", "\202\171\\G\134\190"), 
    v10("\f\217)\139<\213#\154i\155l\1699\209 \141\030\192>\141", "\232I\161L")
};
local function v17() --[[ Line: 48 ]] --[[ Name: v12 ]]
    -- upvalues: l_game_Service_0 (copy), v10 (copy), v13 (copy)
    for _, v16 in l_game_Service_0:WaitForChild(v10("\137\220OR\n\190\202", "~\219\185\"=")):GetChildren() do
        if v16:HasTag(v13) then
            return v16;
        end;
    end;
    return nil;
end;
l_game_Service_1.MessageOut:Connect(function(v18) --[[ Line: 48 ]] --[[ Name: v13 ]]
    -- upvalues: v14 (copy), v17 (copy)
    for _, v20 in v14 do
        local v21 = 0;
        local v22 = nil;
        local v23 = nil;
        while v21 ~= 1 do
            if v21 == 0 then
                v22 = 0;
                v23 = nil;
                v21 = 1;
            end;
        end;
        while v22 ~= 0 do

        end;
        if string.match(v18, v20) then
            v17():FireServer();
        end;
    end;
end);